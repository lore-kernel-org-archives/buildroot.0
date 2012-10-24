From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Oct 2012 00:20:34 +0200
Subject: [Buildroot] [PATCH 15/47] package/libseccomp: new package
In-Reply-To: <1351113973-17237-16-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-16-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201210250020.34545.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wednesday 24 October 2012 Yann E. MORIN wrote:
[--SNIP--]
> diff --git a/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch b/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
> new file mode 100644
> index 0000000..f287377
> --- /dev/null
> +++ b/package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
> @@ -0,0 +1,19 @@
> +diff -du libseccomp-1.0.0.orig/configure libseccomp-1.0.0/configure
> +--- libseccomp-1.0.0.orig/configure	2012-07-27 22:35:05.000000000 +0200
> ++++ libseccomp-1.0.0/configure	2012-09-07 00:00:09.918429292 +0200
> +@@ -205,7 +205,8 @@
> + #
> + 
> + # system seccomp includes
> +-if [[ -r "/usr/include/linux/seccomp.h" ]]; then
> ++# ${SYSROOT} added by buildroot for cross-compilation
> ++if [[ -r "${SYSROOT}/usr/include/linux/seccomp.h" ]]; then
> + 	opt_sysinc_seccomp="yes"
> + else
> + 	opt_sysinc_seccomp="no"
> +Common subdirectories: libseccomp-1.0.0.orig/doc and libseccomp-1.0.0/doc
> +Common subdirectories: libseccomp-1.0.0.orig/include and libseccomp-1.0.0/include
> +Common subdirectories: libseccomp-1.0.0.orig/install and libseccomp-1.0.0/install
> +Common subdirectories: libseccomp-1.0.0.orig/src and libseccomp-1.0.0/src
> +Common subdirectories: libseccomp-1.0.0.orig/tests and libseccomp-1.0.0/tests
> +Common subdirectories: libseccomp-1.0.0.orig/tools and libseccomp-1.0.0/tools

Hmm. I'll have to rework that patch before it can be included...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
