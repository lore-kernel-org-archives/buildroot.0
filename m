From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 14:29:02 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540D9F28.1010709@imgtec.com>
References: <20140907063013.1CB98101499@stock.ovh.net>
 <20140907100918.6b017a09@free-electrons.com>
 <540D69A4.4080503@imgtec.com>
 <20140908103445.6a8858b4@free-electrons.com>
 <540D6ADB.30300@imgtec.com>
 <20140908111733.1966e641@free-electrons.com>
 <540D9F28.1010709@imgtec.com>
Message-ID: <20140908142902.4adfd667@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Sep 2014 13:20:56 +0100, Vicente Olivert Riera wrote:

> One could think we should add that dependence to the 
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT symbols instead, but there are 
> packages depending on that symbol which compile fine on MIPS64 n32, for 
> instance grantlee.

That doesn't make sense. More precisely, it's your commit
a88dceb951de977ad2d896d697f87d98e9705280 that doesn't make sense.
You're adding a "depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT" to
grantlee because grantlee has "select BR2_PACKAGE_QT_SCRIPT".

The reason why your commit doesn't make sense appears clearly now: the
set of architectures that have support for QtScript and QtWebkit is not
the same. So, if QtScript is restricted to certain architectures,
please introduce a BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT separate from
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT, and use them appropriately.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
