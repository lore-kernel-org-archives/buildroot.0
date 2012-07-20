From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 22:27:22 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
Message-ID: <20120720222722.5f89af04@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Richard,

Le Fri, 20 Jul 2012 15:39:32 +0200,
Richard Braun <rbraun@sceen.net> a ?crit :

> The -reconfigure and -rebuild per package targets unconditionally
> recreate the root filesystem image by depending on the all target.
> Restrict their actions to their package instead.
> 
> Signed-off-by: Richard Braun <rbraun@sceen.net>

Well, the use case for those targets was the following: I am making
modifications to the source code of a package (especially using the
OVERRIDE_SRCDIR mechanism) and I want to easily restart the build of
that package and recreate the filesystem image so that I can test the
new version of my package on the target. That's the reason why the
target restarts the build *and* recreates the target filesystem.

For the -reconfigure, the idea is the same: I made some changes that
affect the configure script, or changed configuration options, and I
want to restart the configure+build+install of my package and recreate
the target filesystem.

That's the original idea of those targets. That said, I am personally
open to making changes to their semantic, but I'd prefer to see what
the opinion of other people in the community.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
