From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 14:35:09 +0200
Subject: [Buildroot] Network configuration form buildroot menu (dhcp +
 static ip)
In-Reply-To: <5523CC3D.1080002@ap3.fr>
References: <5523CC3D.1080002@ap3.fr>
Message-ID: <20150407143509.08c68648@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear thln,

On Tue, 07 Apr 2015 14:23:25 +0200, thln wrote:

> I use the version 2015-02 of buildroot.
> I want to configure the network interface as static ip.
> In the old version of buildroot, I modified the "interfaces" file
> located in output/target/etc/network/.
> But now my settings are systematically re-written.
> So I modified Config.in and system.mk to select the configuration
> directly in the menu of buildroot.

We don't want to support each and every crazy possible configuration
using new Buildroot options. When the "simple network config" patch was
accepted, we agreed on only supporting DHCP and that's it.

If you want to customize /etc/network/interfaces, please do so in a
post-build script, or using a rootfs overlay. Both are done *after* the
"simple network config" customization, so they will override it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
