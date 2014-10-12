From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 12 Oct 2014 20:11:13 +0200
Subject: [Buildroot] [PATCH] docs/manual: document the new patch naming
	convention
In-Reply-To: <1413125924-9885-1-git-send-email-yann.morin.1998@free.fr>
References: <1413125924-9885-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <c2ccb993-4c17-422d-90c1-d863e1f08f6e@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>To ease generating patches, we now use a naming convention that is in
>line with what git-format-patch does, that is:
>  - do not prefix patches with the package name
>  - prefix patches with a 4-digit mber
>  - start numbering at 0001
>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>Cc: Peter Korsgaard <jacmet@uclibc.org>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>Cc: Arnout Vandecappelle <arnout@mind.be>
>Cc: Samuel Martin <s.martin49@gmail.com>
>---
> docs/manual/patch-policy.txt | 20 ++++++++++++++------
> 1 file changed, 14 insertions(+), 6 deletions(-)
>
>diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
>index 745f58d..098fbce 100644
>--- a/docs/manual/patch-policy.txt
>+++ b/docs/manual/patch-policy.txt
>@@ -31,16 +31,24 @@ Most patches are provided within Buildroot, in the package
> directory; these typically aim to fix cross-compilation, libc support,
> or other such issues.
> 
>-These patch files should be named +<packagename>-<number>-<description>.patch+.
>-
>-A +series+ file, as used by +quilt+, may also be added in the
>-package directory. In that case, the +series+ file defines the patch
>-application order.
>+These patch files should be named +<number>-<description>.patch+.
> 
> .Notes
> - The patch files coming with Buildroot should not contain any package version
> reference in their filename.
>-- The field +<number>+ in the patch file name refers to the 'apply order'.
>+- The field +<number>+ in the patch file name refers to the 'apply order',
>+  and shall start at 1; it is preferred to prefix with 0, so that there are 4
>+  leading digits, like 'git-format-patch' does.

What about:
It is preferred to pad the number with zeros up to 4 digits, like ...
?


>+  E.g.: +0001-foobar-the-buz.patch+
>+- Previously, it was mandatory for patches to be prefixed with the name of
>+  the package, like +<package>-<number>-<description>.patch+, but that is
>+  no longer the case. Existing packages will be fixed as time passes. 'Do
>+  not prefix patches with the package name.'
>+- Previously, a +series+ file, as used by +quilt+, could also be added in
>+  the package directory. In that case, the +series+ file defines the patch
>+  application order. This is deprecated, and will be removed in the future.
>+  'Do not use a series file.'
>+
> 
> ==== Global patch directory
> 
