From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 12:05:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot: needs OpenSSL
In-Reply-To: <20161212061543.9629-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 12 Dec 2016 07:15:43 +0100")
References: <20161212061543.9629-1-bernd.kuhls@t-online.de>
Message-ID: <87h969qufb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The latest version bump to 2.27 introduced a bug in the configure
 > script which occurs when OpenSSL support is missing:
 > http://lists.busybox.net/pipermail/buildroot/2016-December/179397.html

 > This patch makes OpenSSL mandatory following the upstream advice:
 > http://www.dovecot.org/list/dovecot/2016-December/106346.html
 > "Nobody really should be building without OpenSSL nowadays anyway"

 > Fixes
 > http://autobuild.buildroot.net/results/85f/85f2f176c108ab36520f02d975f27c27cddce84b/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  Config.in.legacy           |  6 ++++++
 >  package/dovecot/Config.in  |  9 ++-------
 >  package/dovecot/dovecot.mk | 14 +++++---------
 >  3 files changed, 13 insertions(+), 16 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index b42eb41..461afeb 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -145,6 +145,12 @@ endif
 >  ###############################################################################
 >  comment "Legacy options removed in 2017.02"
 
 > +config BR2_PACKAGE_DOVECOT_OPENSSL
 > +	bool "OpenSSL is mandatory for Dovecot now"
 > +	select BR2_LEGACY
 > +	help
 > +	  With Dovecot 2.27, OpenSSL support is now mandatory.
 > +

I don't think this legacy handling is really useful. Dovecot users who
didn't have this sub option enabled will not be notified, and users that
did have it enabled don't need to do anything with that information.

So I've dropped it and committed, thanks.

-- 
Bye, Peter Korsgaard
