From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jul 2017 15:15:02 +0200
Subject: [Buildroot] Patch: new board Socrates Cyclone 5
In-Reply-To: <aafbf1fc-74ab-1be4-5c58-76a2db9b97e3@gmail.com>
References: <aafbf1fc-74ab-1be4-5c58-76a2db9b97e3@gmail.com>
Message-ID: <20170730151502.6e99d720@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Lionel, Jan: see below, there is a question for you.)

On Sun, 30 Jul 2017 14:51:25 +0200, Micha? ?yszczek wrote:

> This is my first contribution so please correct me if I did something wrong.

Could you please resend your patch with "git send-email" so that it is
sent as the e-mail body and not as attachment? This will make reviewing
the patch a lot easier.

> I attach patch with new board support - EVB SoCrates based on Altera's
> Cyclone 5. I had to add a single binary file - preloader.bin. This is
> uboot based SPL from Altera. Problem with altera is that boot images
> must be signed with mkpimage tool, that is bundled with Quartus and it
> is not possible to sign SPL from buildroot. Yes, supposedly there is
> option in config to create signed SPL, but it doesn't work for none of
> my Altera's board, hence this binary SPL. Good side is that this SPL
> loads uboot that is made during compilation, so there is still place for
> customization and patching if someone needs it.

I've added in Cc: Jan and Lionel who added and improved the
BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC. Hopefully they will have
some ideas.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
