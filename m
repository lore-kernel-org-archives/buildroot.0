From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:45:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/f2fs-tools: add host package
In-Reply-To: <20181031212128.GM28575@scaer>
References: <20181026200016.30856-1-grzegorz@blach.pl>
 <20181026200016.30856-2-grzegorz@blach.pl>
 <20181031212128.GM28575@scaer>
Message-ID: <20181103154532.3b9d8e94@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Oct 2018 22:21:28 +0100, Yann E. MORIN wrote:

> I don't think that libblkid is needed for the host variant, so we should
> probably explicitly disable it. On the other hand, libblkid is always
> built by host-util-linux.

Agreed, I've added --without-blkid.

> Also, we do have host-libselinux, so wyou may want to also enable that
> unconditionally.

I don't really agree here. We try to build only a minimal set of
dependencies, so we shouldn't build against host-libselinux by default.
Yes, solving that properly requires introducing Config.in options for
host packages :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
