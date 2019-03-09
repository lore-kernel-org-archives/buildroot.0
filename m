From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 14:53:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/ncmpc: fix build with gcc 5
In-Reply-To: <20190309113127.24045-2-fontaine.fabrice@gmail.com>
References: <20190309113127.24045-1-fontaine.fabrice@gmail.com>
 <20190309113127.24045-2-fontaine.fabrice@gmail.com>
Message-ID: <20190309145332.50877f3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  9 Mar 2019 12:31:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/655eb4905c6e308d34293658acee4fc4e1fe0bbc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...TagListPage.cxx-fix-build-with-gcc-5.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/ncmpc/0002-src-TagListPage.cxx-fix-build-with-gcc-5.patch

This patch didn't apply cleanly:

$ git pwam 1053833
Applying patch #1053833 using "git am -s"
Description: [2/2] package/ncmpc: fix build with gcc 5
Applying: package/ncmpc: fix build with gcc 5
.git/rebase-apply/patch:46: space before tab in indent.
 	unsigned i = lw.selected;
.git/rebase-apply/patch:47: space before tab in indent.
 	if (parent != nullptr) {
.git/rebase-apply/patch:48: space before tab in indent.
 		if (i == 0)
.git/rebase-apply/patch:51: trailing whitespace.
 
.git/rebase-apply/patch:52: space before tab in indent.
 		--i;
error: corrupt patch at line 56
Patch failed at 0001 package/ncmpc: fix build with gcc 5
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

I fixed it up manually and applied. I'm not entirely sure that the fix
is the best/correct one as I'm not proficient enough in C++, but we'll
see what upstream says about the pull request later on.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
