From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:24:59 +0100
Subject: [Buildroot] [PATCH] screen: bump to version 4.3.1
In-Reply-To: <1456617671-27271-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1456617671-27271-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20160228222459.5be7efb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Sat, 27 Feb 2016 21:01:11 -0300, Ricardo Martincoski wrote:
> Patch files 0001 to 0005 were rebased.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Applied to next, thanks. One comment though.

> "src/" must be removed from the patches because _STRIP_COMPONENTS is not
> set, so it defaults to 1
> If I set SCREEN_STRIP_COMPONENTS=0, I would need to generate patches
> 0006-0010 again, so I kept the default 1.

The problem has nothing to do with <pkg>_STRIP_COMPONENTS. Even with
_STRIP_COMPONENTS = 0, patches with src/ wouldn't apply.

The problem is that the layout of the screen Git repository does not
match the layout of their tarball. Their Git repository has pretty much
nothing but a src/ sub-directory. While their tarball contain under a
screen-<version>/ directory directly the contents of the Git repository
src/ directory.

If you were to use <pkg>_STRIP_COMPONENTS = 0, you would have the
screen source code in:

  output/build/screen-<version>/screen-<version>/

and still no src/ directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
