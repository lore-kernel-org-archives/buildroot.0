From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:08:22 +0200
Subject: [Buildroot] [RFC PATCH] linux: let to work with xenomai in
 override mode
In-Reply-To: <1536782312-12240-1-git-send-email-michael@amarulasolutions.com>
References: <1536782312-12240-1-git-send-email-michael@amarulasolutions.com>
Message-ID: <20180912220822.7c6beee4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 21:58:32 +0200, Michael Trimarchi wrote:
> We would like to patch xenomai in override mode. Xenomai create
> symlink in order to build the kernel and those links are absolute
> one. The adeos patch is not applied if it is found so we
> can change the connect hook from PRE_PATCH to PRE_CONFIGURE.
> The xenomi dependence should be explicit set
> 
> Change-Id: Idc5189047451bb9ac3019d3f35674d5332159918
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

As I explained in our previous e-mail discussion, when you use
<pkg>_OVERRIDE_SRCDIR, you should handle any needed patching yourself.

Doing what you suggest here means that all patches from Linux kernel
extensions will be applied in the configure step, which is:

 (1) Contrary to common sense: why should patching happen outside of
     the patching step ?

 (2) Completely inconsistent with what happens in all other packages
     that use <pkg>_OVERRIDE_SRCDIR.

 (3) Inconsistent with the initial principle of <pkg>_OVERRIDE_SRCDIR,
     which is that the user *controls* the source code, and Buildroot
     will not touch it all.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
