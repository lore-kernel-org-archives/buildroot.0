From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Sep 2013 09:01:34 +0200
Subject: [Buildroot] [PATCH 1/1] uboot: add support for a uEnv.txt file
In-Reply-To: <1379029303-17804-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1379029303-17804-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130913090134.2b05d3e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 12 Sep 2013 18:41:43 -0500, Ryan Barnett wrote:
> Some boards in u-boot support the ability to modify the environment
> by placing a plain text file as uEnv.txt in the root of the partition
> of an SD card. For the extact placement of where the uEnv.txt should
> be, consult your u-boot environment. Your board supports this
> overwriting of environment variables if "loadbootenv" and
> "importbootenv" are defined in the board's environment.

loadbootenv and importbootenv are just U-Boot scripts that are specific
to certain board configurations.

All what loadbootenv does it load a file into memory, and all what
importbootenv does is call 'env import -t <addr> <size>' to load the
environment into U-Boot.

So I don't think we should be mentioning loadbootenv and importbootenv
here.

However, what I'm really wondering if is we really need this. After
all, this is all about copying a text file to $(BINARIES_DIR),
something a post-build or a post-image script can do perfectly fine. I
mean, there's nothing U-Boot specific involved here, it's just a plain
'cp'. Therefore, I'm not sure we need this at all, but I am open to
discussion on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
