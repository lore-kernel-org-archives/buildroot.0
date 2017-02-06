From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 20:03:04 +0100
Subject: [Buildroot] [git commit] system(d): allow auto net
 configuration with networkd
In-Reply-To: <20170206180709.xhsttul3nq7vgtya@tarshish>
References: <20170206174814.32BF581F79@busybox.osuosl.org>
 <20170206180709.xhsttul3nq7vgtya@tarshish>
Message-ID: <20170206200304.0893e799@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Feb 2017 20:07:09 +0200, Baruch Siach wrote:

> > +SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
> > +ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
> > +define SYSTEMD_INSTALL_NETWORK_CONFS
> > +	sed s/SYSTEMD_NETWORKD_DHCP_IFACE/$(SYSTEMD_NETWORKD_DHCP_IFACE)/ \
> > +		package/systemd/dhcp.network > \  
> 
> Where is this file?

Sorry, forgot to "git add" it. I even did a test build before pushing
to make sure it was all building fine... but forgot to git add. I've
fixed that in a follow-up commit. Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
