From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Dec 2018 09:15:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/sunxi-tools: additional build
 options
In-Reply-To: <1542092998-21977-1-git-send-email-kaplan2539@gmail.com>
References: <1542092998-21977-1-git-send-email-kaplan2539@gmail.com>
Message-ID: <20181207091539.515fa3a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Nov 2018 23:09:58 -0800, kaplan2539 at gmail.com wrote:
> From: Alex Kaplan <kaplan2539@gmail.com>
> 
> This patch allows to select the installation of additional commands
> which are part of the sunxi-tools. It's now possible to e.g. install
> sunxi-fel on the target device. The corresponding options have been
> added to Config.in and sunxi-tools.mk has been modified respectively.
> The default setting is to only build sunxi-nand-part.
> 
> On the host building of the misc-tools target is added, which provides
> sunxi-nand-image-builder and phoenix_info.
> 
> Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>

This patch seems to be causing some build issues:

  http://autobuild.buildroot.net/?reason=sunxi-tools-v1.4.1

Some new code that gets compiled uses inl/outl, which apparently aren't
provided by musl on ARM ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
