From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 23 Apr 2008 09:22:28 +0200
Subject: [Buildroot] trouble building grep
References: <1CF6EDDF0820924DA43C9A52FE7325950ABFA085@MI8NYCMAIL17.Mi8.com>
Message-ID: <06ee01c8a512$ccac08c0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> As far as I can tell the dependants (uclibc, gettext and libintl) are
> being built with no problem. When the make runs for grep it appears to
> get configured fine but during the actual build I get error messages
> that I think are during the link of libgreputils.a. I get undefined
> reference messages for libintl_gettext at various lines in the source
> then the build stops.
>
> I'm kind of stuck. Any ideas what the problem could be? I already
> checked my $(STAGING_DIR)/usr/lib directory and the libgettext and
> libintl files are there.

All I can offer is that the grep from busybox works fine, and doesn't need 
gettext.

I assume you have selected BR2_PACKAGE_GETTEXT in the main config of 
buildroot.

But I think the main problem is with locales (intl) and/or wchar 
dependencies missing from the uclibc config.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
