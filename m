From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jul 2011 09:52:03 +0200
Subject: [Buildroot] [PATCHv3] udev: bump to 172
In-Reply-To: <20110716092425.02e80735@skate> (Thomas Petazzoni's message of
 "Sat, 16 Jul 2011 09:24:25 +0200")
References: <4E1D4062.9010909@visionsystems.de>
 <87y5zz8jm6.fsf@macbook.be.48ers.dk> <20110716092425.02e80735@skate>
Message-ID: <87oc0s6n6k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Yegor> +    	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/share/pkgconfig 		\
 >> 
 >> Why do you need to set this?

 Thomas> I think because usr/share/pkgconfig is not in the default pkg-config
 Thomas> search path, and things like hwdata install their .pc file in
 Thomas> usr/share/pkgconfig. At least, that's what I remember from the time I
 Thomas> did a modern udev package in Buildroot (stuff that I lost when my
 Thomas> laptop got stolen...).

But it is as we build pkg-config with:

--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"

-- 
Bye, Peter Korsgaard
