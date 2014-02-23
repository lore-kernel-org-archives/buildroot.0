From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 10:46:58 +0100
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME vendor
 part
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
Message-ID: <20140223104658.4088cdc6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 23 Feb 2014 08:28:21 +0000, Noam Camus wrote:
> When the toolchain is custom we can denote that by setting in the triplet the vendor part.
> This is done through configution, where the default is buildroot.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>

Is there a compelling reason to allow the configuration of the vendor
part of the tuple? To me, it makes sense that all Buildroot toolchain
have the "buildroot" vendor, so that they can be identified easily.

Also, if by mistake the vendor part of the tuple is defined by the user
as "unknown", they he might get compilation issues when building with
target architecture == host architecture.

See 11017f081fc5b034e680d89eaea729c19f450e01 ('pkg-infra: make sure
cross compiling is enabled when host == target').

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
