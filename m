From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 May 2010 08:55:20 +0200
Subject: [Buildroot] libintl.h: need a hint or two
In-Reply-To: <4BF06BBD.4020908@unix-beratung.de>
References: <4BF06BBD.4020908@unix-beratung.de>
Message-ID: <20100517085520.586c2c8d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 May 2010 00:03:41 +0200
Robert Urban <urban@unix-beratung.de> wrote:

> I'm trying to build a router/firewall system.  Thus I've chosen the ipsec-tools
> and radvd packages.
> 
> These in turn have a dependency on flex.  The flex compile is failing with the
> following error, when compiling "dfa.c":
> 
> In file included from flexdef.h:102,
>                  from ccl.c:34:
> gettext.h:26:22: error: libintl.h: No such file or directory
> 
> And it's right, there is no "libintl.h" under .../staging/usr/include/...
> 
> Please correct me if I'm wrong, but it seems I can only get libintl.h by turning
> on first UCLIBC_MJN3_ONLY and then UCLIBC_HAS_GETTEXT_AWARENESS, but if
> UCLIBC_MJN3_ONLY is enabled, I get slews of other errors...
> 
> I guess I'm doing something wrong.  Can someone help?

Do you have the full build log available somewhere and the .config file
you are using ?

In general, when using a uClibc toolchain, gettext/libintl must be
compiled separatly from the C library by using the BR2_PACKAGE_GETTEXT
package of Buildroot. So, either flex should depend on it, or it's
because the configure cache has been loaded with incorrect
informations. Only the full build log can tell.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
