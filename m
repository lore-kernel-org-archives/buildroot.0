From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 23:47:33 +0200
Subject: [Buildroot] [PATCH v2,1/1] cryptopp: bump to version 7.0.0
In-Reply-To: <20180409210329.8592-1-fontaine.fabrice@gmail.com>
References: <20180409210329.8592-1-fontaine.fabrice@gmail.com>
Message-ID: <20180409234733.1f7435eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 23:03:29 +0200, Fabrice Fontaine wrote:
> Remove patch (applied upstream)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Rebase/fix patch (remove deletion of uncommited patches)

Your patch still didn't apply cleanly:

thomas at windsurf:~/projets/buildroot (master)$ git status
On branch master
Your branch is ahead of 'origin/master' by 20 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
thomas at windsurf:~/projets/buildroot (master)$ git pwam 896414
Applying patch #896414 using 'git am -s'
Description: [v2,1/1] cryptopp: bump to version 7.0.0
Applying: cryptopp: bump to version 7.0.0
error: patch failed: package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch:1
error: package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch: patch does not apply
Patch failed at 0001 cryptopp: bump to version 7.0.0
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

So, this time around, I fixed it up locally, and applied. Perhaps it's
a line ending issue.

Yeah, that's it:

$ file package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch
package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch: unified diff output, ASCII text, with CRLF, LF line terminators

CRLF line endings. They get removed when the patch is sent over e-mail.
Mystery solved :)

Thanks, applied!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
