From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 15:52:57 +0200
Subject: [Buildroot] Patch not being applied to out of tree package
In-Reply-To: <1499430383935-170337.post@n4.nabble.com>
References: <1499430383935-170337.post@n4.nabble.com>
Message-ID: <20170707155257.78b51950@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 05:26:23 -0700 (PDT), ngu wrote:

> My goal is to integrate a driver to buildroot.
> From what I understand, the best way to do so is to create a package, this
> is what I did. The package is out of tree which is not a problem a I
> correctly set the BR2_EXTERNAL to the right path. I can generate a valid
> image for my system and I even had a "hello world" driver as an external
> package. For the driver I want to integrate, I need to fix a few calls
> which, I believe, should be done with a patch. As I understand, there are at
> least 2 ways to place the patch. The first one is to have a global patch
> directory (BR2_GLOBAL_PATCH_DIR) or to place the patch in the package
> directory. I did both.
> My problem is that the patch seems to be ignored and is not applied.
> 
> For the info, I tried:
> make mypackage-dirclean
> make mypackage-patch V=1
> 
> The second command doesn't output anything about the patch, only the "rsync"
> command.
>
> Could the patch not be applied because the source files are local?

Correct: when you use <pkg>_SITE_METHOD = local or
<pkg>_OVERRIDE_SRCDIR in local.mk, we simply rsync the source code, and
the patching step is skipped.

The assumption is that if the source tree is local... you'd rather
have the changes you need made on it directly, rather than having
patches in Buildroot.

This sadly doesn't seem to be mentioned in the Buildroot manual, and it
should be fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
