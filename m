From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Mar 2013 18:45:40 +0100
Subject: [Buildroot] [PATCH 116/120] xutil_util-macros: bump revision to
 X11R7.7
In-Reply-To: <1363611926-27105-57-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
 <1363611926-27105-57-git-send-email-jbb@gamblify.com>
Message-ID: <514B4744.7030100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/13 14:05, Jesper Baekdahl wrote:
> From: Will Wagner <will_wagner@carallon.com>
>
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
> ---
>   package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch |    9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch
>
> diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch
> new file mode 100644
> index 0000000..167229d
> --- /dev/null
> +++ b/package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch
> @@ -0,0 +1,9 @@
> +--- xutil_util-macros-1.8.0/xorg-macros.m4.in.orig	2010-05-27 14:03:30.000000000 +0100
> ++++ xutil_util-macros-1.8.0/xorg-macros.m4.in	2011-11-09 11:57:41.000000000 +0000
> +@@ -1064,3 +1064,6 @@ mv \$(top_srcdir)/.INSTALL.tmp \$(top_sr
> + echo 'util-macros \"pkgdatadir\" from xorg-macros.pc not found: installing possibly empty INSTALL.' >&2)"
> + AC_SUBST([INSTALL_CMD])
> + ]) # XORG_INSTALL
> ++
> ++# Buildroot stuff
> ++AC_SUBST(STAGING_DIR)


  This does not make sense... It's not a version bump, first of all, and 
in addition the STAGING_DIR variable isn't used anywhere so substituting 
it won't do much good... Or am I missing something? In addition, it's 
very strange that a patch for version 1.17 would refer to the -1.8.0 
directory. And finally: patch filenames shouldn't contain a version 
number, and the patch should have an explanatory comment and a 
Signed-off-by line.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
