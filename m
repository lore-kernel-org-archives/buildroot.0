From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:02:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/sunxi-tools: additional build
 options
In-Reply-To: <1542092998-21977-1-git-send-email-kaplan2539@gmail.com>
References: <1542092998-21977-1-git-send-email-kaplan2539@gmail.com>
Message-ID: <20181203230239.2c7756a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

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
> ---
>  package/sunxi-tools/Config.in      | 67 +++++++++++++++++++++++++++++++++++---
>  package/sunxi-tools/Config.in.host |  1 +
>  package/sunxi-tools/sunxi-tools.mk | 45 ++++++++++++++++++++-----
>  3 files changed, 100 insertions(+), 13 deletions(-)

Applied to master with the following changes:

    [Thomas:
     - properly format Config.in
     - do not select BR2_PACKAGE_HOST_LIBUSB in Config.in.host, since this
       option doesn't exist
     - properly indent code in sunxi-tools.mk]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
