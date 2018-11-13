From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:42:35 +0100
Subject: [Buildroot] [PATCH/next 1/2] ncmpc: bump to version 0.33
In-Reply-To: <20181111205831.8213-1-fontaine.fabrice@gmail.com>
References: <20181111205831.8213-1-fontaine.fabrice@gmail.com>
Message-ID: <20181113224235.4bc0bf9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this version bump!

On Sun, 11 Nov 2018 21:58:30 +0100, Fabrice Fontaine wrote:
> - Remove second patch (already in version)
> - Replace true/false by enabled/disabled, see:
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/67d96543e64ec2eff2d3e9907c570ca09918c893
> - Add new boost system dependency:
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/74cc24bdfcfd0ba288b78f0fb75f409832d7586d
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/bef9017712da31b750799e6c7fb9d2829fa5e69c

If you need the boost system module, shouldn't you:

	select BR2_PACKAGE_BOOST_SYSTEM

> - Remove glib dependency:
>   https://github.com/MusicPlayerDaemon/ncmpc/commit/dfcb3ab0216d6c9ae35d06060cee806bd919c2ba
> - Disable new regex option (based on pcre)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Also, this patch doesn't apply cleanly here:

thomas at windsurf:~/projets/buildroot (next)$ git pwam 996189
Applying patch #996189 using "git am -s"
Description: [PATCH/next,1/2] ncmpc: bump to version 0.33
Applying: ncmpc: bump to version 0.33
error: patch failed: package/ncmpc/Config.in:2
error: package/ncmpc/Config.in: patch does not apply
error: patch failed: package/ncmpc/ncmpc.mk:5
error: package/ncmpc/ncmpc.mk: patch does not apply
Patch failed at 0001 ncmpc: bump to version 0.33
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
