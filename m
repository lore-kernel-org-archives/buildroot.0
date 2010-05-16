From: Robert Urban <urban@unix-beratung.de>
Date: Mon, 17 May 2010 00:03:41 +0200
Subject: [Buildroot] libintl.h: need a hint or two
Message-ID: <4BF06BBD.4020908@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I'm trying to build a router/firewall system.  Thus I've chosen the ipsec-tools
and radvd packages.

These in turn have a dependency on flex.  The flex compile is failing with the
following error, when compiling "dfa.c":

In file included from flexdef.h:102,
                 from ccl.c:34:
gettext.h:26:22: error: libintl.h: No such file or directory

And it's right, there is no "libintl.h" under .../staging/usr/include/...

Please correct me if I'm wrong, but it seems I can only get libintl.h by turning
on first UCLIBC_MJN3_ONLY and then UCLIBC_HAS_GETTEXT_AWARENESS, but if
UCLIBC_MJN3_ONLY is enabled, I get slews of other errors...

I guess I'm doing something wrong.  Can someone help?

thanks,

Rob Urban
