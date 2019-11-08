From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 8 Nov 2019 23:17:35 +0100
Subject: [Buildroot] [PATCH v2 3/5] package/rpi-userland: bump version
 to 5070cb7f
In-Reply-To: <20191107224604.3fbb7261@windsurf>
References: <20191107202339.6371-1-ps.report@gmx.net>
 <20191107202339.6371-3-ps.report@gmx.net>
 <20191107224604.3fbb7261@windsurf>
Message-ID: <20191108231735.1d2bc178@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 7 Nov 2019 22:46:04 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu,  7 Nov 2019 21:23:37 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - rebased 0003-Disable-Werror-everywhere.patch
> > - remove vcfiled support (upstream removed, see [1])
> >
> > [1] https://github.com/raspberrypi/userland/commit/f00a1189b9f8246dc24c45985de599c50b8c62a5
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> This patch doesn't apply properly here:
>
> $ git pwam 1191416
> Applying patch #1191416 using "git am -s"
> Description: [v2,3/5] package/rpi-userland: bump version to 5070cb7f
> Applying: package/rpi-userland: bump version to 5070cb7f
> error: patch failed: package/rpi-userland/0003-Disable-Werror-everywhere.patch:55
> error: package/rpi-userland/0003-Disable-Werror-everywhere.patch: patch does not apply
> Patch failed at 0001 package/rpi-userland: bump version to 5070cb7f
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 'git am' failed with exit status 128
>
> I have not investigated why.

Mhhh, strange (and once again, I think it happened already before)...

Diff of the original 'git format-patch' version and the Patchwork download
version:

	$ diff -u v2-0003-package-rpi-userland-bump-version-to-5070cb7f.patch v2-3-5-package-rpi-userland-bump-version-to-5070cb7f.patch
[...]
 diff --git a/Config.in.legacy b/Config.in.legacy
 index fcb10b1291..7167b1d60c 100644
 --- a/Config.in.legacy
 +++ b/Config.in.legacy
 @@ -146,6 +146,12 @@ endif
-
+
  comment "Legacy options removed in 2019.11"
-
+
[...]

With '-<space><newline>' against '+<newline>'..., same against
the saved copy returned from the buildroot mailing list...,
seems someone is eating up my spaces...

Will re-try/re-send the patches...

Regards,
Peter

>
> Thomas
