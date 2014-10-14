From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 09:37:48 +0200
Subject: [Buildroot] [PATCH] docs/manual: document the new patch naming
	convention
In-Reply-To: <c2ccb993-4c17-422d-90c1-d863e1f08f6e@email.android.com>
References: <1413125924-9885-1-git-send-email-yann.morin.1998@free.fr>
 <c2ccb993-4c17-422d-90c1-d863e1f08f6e@email.android.com>
Message-ID: <20141014073748.GC3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-12 20:11 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >To ease generating patches, we now use a naming convention that is in
> >line with what git-format-patch does, that is:
> >  - do not prefix patches with the package name
> >  - prefix patches with a 4-digit mber
> >  - start numbering at 0001
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Peter Korsgaard <jacmet@uclibc.org>
> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> >Cc: Arnout Vandecappelle <arnout@mind.be>
> >Cc: Samuel Martin <s.martin49@gmail.com>
> >---
> > docs/manual/patch-policy.txt | 20 ++++++++++++++------
> > 1 file changed, 14 insertions(+), 6 deletions(-)
> >
> >diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> >index 745f58d..098fbce 100644
> >--- a/docs/manual/patch-policy.txt
> >+++ b/docs/manual/patch-policy.txt
> >@@ -31,16 +31,24 @@ Most patches are provided within Buildroot, in the package
> > directory; these typically aim to fix cross-compilation, libc support,
> > or other such issues.
> > 
> >-These patch files should be named +<packagename>-<number>-<description>.patch+.
> >-
> >-A +series+ file, as used by +quilt+, may also be added in the
> >-package directory. In that case, the +series+ file defines the patch
> >-application order.
> >+These patch files should be named +<number>-<description>.patch+.
> > 
> > .Notes
> > - The patch files coming with Buildroot should not contain any package version
> > reference in their filename.
> >-- The field +<number>+ in the patch file name refers to the 'apply order'.
> >+- The field +<number>+ in the patch file name refers to the 'apply order',
> >+  and shall start at 1; it is preferred to prefix with 0, so that there are 4
> >+  leading digits, like 'git-format-patch' does.
> 
> What about:
> It is preferred to pad the number with zeros up to 4 digits, like ...

OK, done. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
