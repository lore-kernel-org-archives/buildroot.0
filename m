From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 22:32:06 +0100
Subject: [Buildroot] [PATCH] samba4: add host-python to dependencies
In-Reply-To: <1458138880-973-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 16 Mar 2016 11:34:40 -0300")
References: <1458138880-973-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760wm9kix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Even though it's inherited by the python dependency it's more clear this
 > way for graph-depends, since it's used by the waf buildsystem.
 > And even though we have a hard dependency on python for the distro this
 > python could ostensibly be 3.x which isn't compatible with the bundled
 > waf series (1.5.x) in samba (as of current shipping version and upcoming
 > 4.4.x series).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/samba4/samba4.mk | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
 > index ee0452e..0fa70a5 100644
 > --- a/package/samba4/samba4.mk
 > +++ b/package/samba4/samba4.mk
 > @@ -10,7 +10,9 @@ SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 >  SAMBA4_INSTALL_STAGING = YES
 >  SAMBA4_LICENSE = GPLv3+
 >  SAMBA4_LICENSE_FILES = COPYING
 > -SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
 > +SAMBA4_DEPENDENCIES = \
 > +	host-e2fsprogs host-heimdal host-python \
 > +	e2fsprogs popt python zlib \
 >  	$(if $(BR2_PACKAGE_LIBBSD),libbsd) \
 >  	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 >  	$(if $(BR2_PACKAGE_READLINE),readline)

I first thought this wasn't enough as we don't explicitly ensure
host/usr/bin/python2 is used, but as samba selects python (which ensures
that python3 cannot be built) and hence host/usr/bin/python will point to
host-python2.

Committed, thanks.

-- 
Bye, Peter Korsgaard
