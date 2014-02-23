From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 11:45:46 +0000
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME
	vendor	part
In-Reply-To: <20140223104658.4088cdc6@skate>
References: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
 <20140223104658.4088cdc6@skate>
Message-ID: <884EA965490E3C4D8E66AEF41E98025006C3BB@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Here (EZchip) we change toolchain elements such binutils/gdb kernel (headers) and gcc.
We are using override feature of buildroot to create our custom buildroot toolchain.
One of the GCC changes we carry is that we assume dedicated vendor (ezchip) to control several GCC defaults and enable extra configurations within GCC.

About "unknown" I guess that it can be blocked by checking the value and in some cases cause intentional make error.

I hope this makes sense to you.

Noam

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Sunday, February 23, 2014 11:47 AM
To: Noam Camus
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME vendor part

Dear Noam Camus,

On Sun, 23 Feb 2014 08:28:21 +0000, Noam Camus wrote:
> When the toolchain is custom we can denote that by setting in the triplet the vendor part.
> This is done through configution, where the default is buildroot.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>

Is there a compelling reason to allow the configuration of the vendor part of the tuple? To me, it makes sense that all Buildroot toolchain have the "buildroot" vendor, so that they can be identified easily.

Also, if by mistake the vendor part of the tuple is defined by the user as "unknown", they he might get compilation issues when building with target architecture == host architecture.

See 11017f081fc5b034e680d89eaea729c19f450e01 ('pkg-infra: make sure cross compiling is enabled when host == target').

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
