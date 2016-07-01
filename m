From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:15:56 +0200
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
 2016.05
In-Reply-To: <1572014322.7513168.1467381657827.JavaMail.zimbra@datacom.ind.br>
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
 <20160701151804.61f389e9@free-electrons.com>
 <1572014322.7513168.1467381657827.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160701161556.5e65b3df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Jul 2016 11:00:57 -0300 (BRT), Carlos Santos wrote:

> > What is your host gcc version ? This failure smells like building an
> > old U-Boot, with gcc 5.x as the host gcc version.  
> 
> The problem happens on CentOS 7 (GCC 4.8.3) and Ubuntu 16.04 (GCC 5.3.1).

I think the failure with GCC 5.3.x is normal, but I don't understand
why it would fail with gcc 4.8.

> >>  UBOOT_MAKE_OPTS += \
> >>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> >> -	ARCH=$(UBOOT_ARCH) \
> >> -	HOSTCFLAGS="$(HOST_CFLAGS)" \
> >> -	HOSTLDFLAGS="$(HOST_LDFLAGS)"  
> > 
> > I'm not sure to see why this would fix the problem you're reporting.  
> 
> It prevents overriding HOSTCFLAGS and HOSTLDFLAGS on targets that don't need OpenSSL, so older versions of U-Boot will compile successfully.

Yes, but I don't understand why not setting HOSTCFLAGS/HOSTLDFLAGS
fixes the build issue you mentioned.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
