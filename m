From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:51:59 +0200
Subject: [Buildroot] [PATCH] grub2: add configuration options for grub
 config files
In-Reply-To: <1396600337-26228-1-git-send-email-dmitriyz@google.com>
References: <1396600337-26228-1-git-send-email-dmitriyz@google.com>
Message-ID: <20140420175159.591f1714@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dima Zavin,

On Fri,  4 Apr 2014 01:32:17 -0700, Dima Zavin wrote:
> Add an option for embedding a config file directly in grub as
> well as an option to provide a custom grub.cfg file through
> a defconfig.
> 
> Signed-off-by: Dima Zavin <dmitriyz@google.com>
> ---
>  boot/grub2/Config.in | 12 ++++++++++++
>  boot/grub2/grub2.mk  |  8 +++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)

I've applied your patch, but:

 * I've removed the BR2_TARGET_GRUB2_CONFIG option, because the same
   thing can be achieved using a post-build script or a rootfs overlay.
   We don't have options in each and every package that can use a
   custom configuration, so I don't really see a reason to have this
   for Grub2 specifically.

 * I've reworded the Config.in help for the built-in configuration file
   option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
