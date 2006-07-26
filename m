From: Clem Taylor <clem.taylor@gmail.com>
Date: Wed Jul 26 08:28:06 2006
Subject: [Buildroot] HowTo make jffs2 image after linux.mk?
In-Reply-To: <20060726135221.GB8832@synertronixx3>
References: <20060726135221.GB8832@synertronixx3>
Message-ID: <ecb4efd10607260820u199c122ci4c52233a0b785134@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/26/06, Konstantin Kletschke <kletschke@synertronixx.de> wrote:
> Actually I am going into production with a buildroot tree
> advanced by target/device/vendor/product subdirectory :)
>
> Well, I adapted a linux-mk for my needs and the function is quite handy.
>
> But what is the best way to create a jffs2 image _after_ compiling
> kernel modules?
>
> The only chance I see is to move "source "target/device/Config.in""
> just above "source "target/jffs2/Config.in"" but that looks rather ugly
> and hackish.

In my buildroot tree, I did the same thing the gumstix folks did. I
added a TARGET_FS target to the end of the world target list and moved
all the all the *root targets from TARGETS to TARGET_FS. This way the
jffs2 target is always built last.

                           --Clem
