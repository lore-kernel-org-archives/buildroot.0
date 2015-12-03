From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 21:53:32 +0100
Subject: [Buildroot] [PATCH] connman: disable for sparc
In-Reply-To: <20151203172322.GA767@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 3 Dec 2015 18:23:22 +0100")
References: <20151203172322.GA767@waldemar-brodkorb.de>
Message-ID: <87zixrb6er.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Connman uses __sync_fetch_and_add, which is not available for sparc.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

You forgot to add references to the autobuilder failures.

> ---
 >  package/connman/Config.in |    1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/connman/Config.in b/package/connman/Config.in
 > index ba238af..687d903 100644
 > --- a/package/connman/Config.in
 > +++ b/package/connman/Config.in
 > @@ -7,6 +7,7 @@ config BR2_PACKAGE_CONNMAN
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 >  	depends on BR2_USE_MMU # dbus, libglib2
 >  	depends on !BR2_STATIC_LIBS # needs dlopen()
 > +	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 >  	help
 >  	  The Connection Manager (ConnMan) project provides a daemon
 >  	  for managing internet connections within embedded devices

We should also hide the toolchain comment on sparc.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
