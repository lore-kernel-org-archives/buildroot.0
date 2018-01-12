From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 10:02:16 +0100
Subject: [Buildroot] [PATCH] system/Config.in: hide
 BR2_TARGET_GENERIC_GETTY_{TERM, OPTIONS} with systemd
In-Reply-To: <20180111173104.GB3559@scaer>
References: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
 <20180111173104.GB3559@scaer>
Message-ID: <20180112100216.36d494c1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Jan 2018 18:31:04 +0100, Yann E. MORIN wrote:

> > +	# currently not observed by systemd
> > +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV  
> 
> Why not:
>     depends on !BR2_INIT_SYSTEMD
> 
> because this is really want we want to express: this is not compatible
> with systemd...

No, what we really want to express is that
BR2_TARGET_GENERIC_GETTY_{TERM,OPTIONS} are only handled in the busybox
code and sysvinit code. It's not so much that they are not compatible
with systemd, it is that only busybox and sysvinit observe those
options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
