From: Stefan Peter <st3fanp3t3r@gmail.com>
Date: Tue, 13 Aug 2013 15:39:07 +0200
Subject: [Buildroot] ubifs rootfs attached error
In-Reply-To: <20130813130443.GA3676@zuhnb712>
References: <20130813130443.GA3676@zuhnb712>
Message-ID: <520A36FB.80403@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On 13.08.2013 15:04, Woody Wu wrote:
> Hi,
...
> Firstly, below are the kernel error messages:
> 
> ------------------------------------------------------------------
> NAND_ECC_NONE selected by board driver. This is not recommended !!

Modern flash chips actually rely on specific forms of cyclic redundancy
checks in order to be able to correct for bit errors in NAND flash.
Without using the proper CRC algorithm, you can never be sure to be able
to read from the flash what you have written to it. Another hint at this
problem are the "Bad eraseblock" messages that follow.

Check your kernel configuration and the documentation of your target for
the proper ECC settings for the NAND flash.

With kind regards

Stefan Peter
