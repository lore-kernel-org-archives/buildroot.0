From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Dec 2018 09:10:29 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] lxc: fix build without stack protector
In-Reply-To: <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
 <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
Message-ID: <20181204091029.01a78c0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Arnout, Peter, Yann in Cc.

On Tue, 4 Dec 2018 07:54:39 +0200, Baruch Siach wrote:

> > +LXC_CONF_ENV = ax_cv_check_cflags__Werror__fstack_protector_strong=no  
> 
> Can't we make this depend on BR2_TOOLCHAIN_HAS_SSP? See the packages ntp or 
> sox, for example.

The question is whether we want SSP support to be enabled as soon as
the toolchain *has* SSP support, or only when the user explicitly
request SSP support using BR2_SSP_{REGULAR,STRONG,ALL} ?

This is a real policy decision:

 - Do we let the packages default to what they think is good (of course
   as long as the toolchain provides what's needed) ?

 - Or do we enforce the system-level configuration options that
   Buildroot has ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
