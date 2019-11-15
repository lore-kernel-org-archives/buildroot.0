From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:02:01 +0100
Subject: [Buildroot] Rebuilding Linux after modifying Linux device tree
 in output/build directory?
In-Reply-To: <1573850449466.42632@amazon.com>
References: <d508ce60a63d4182a02ddfadaeb042ac@EX13D04UEA001.ant.amazon.com>
 <20191115211340.3c06fe96@windsurf> <1573850449466.42632@amazon.com>
Message-ID: <20191115220201.4727d921@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Scott,

Please keep the Buildroot mailing list in Cc.

On Fri, 15 Nov 2019 20:40:50 +0000
"Whitney, Scott" <scwhitn@amazon.com> wrote:

> I understand that such changes are volatile, but this gives me a way
> to run experiments without having to check each one into Git and
> pulling a new copy of the Linux repository from scratch.

Using the <pkg>_OVERRIDE_SRCDIR would give you the best of both worlds:
you're not working on a volatile copy *and* you don't rebuild from
scratch.

> After running "make linux-rebuild", I believe that I will also need
> to run "make" in order to generate the sdcard.img file that I need
> for my target, correct?  "make linux-rebuild" only rebuilds parts of
> the kernel that changed, but does not run any of my post-build steps
> to create my image, I believe.

Correct, "make linux-rebuild" only rebuilds the kernel itself.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
