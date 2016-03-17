From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 21:32:35 +0100
Subject: [Buildroot] How to check if a platform supports PCI bus
In-Reply-To: <900813099.3374314.1458219344699.JavaMail.zimbra@datacom.ind.br>
References: <900813099.3374314.1458219344699.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160317213235.77cd98e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 09:55:44 -0300 (BRT), DATACOM - Tiago.Brusamarello
wrote:

> I'm about to submit a new package to the upstream. This package is intended to be used for testing the Linux PCIe driver. On the "Config.in" file I'm using the same check made by the "pciutils" package: 
> 
> # PCI not supported on Blackfin 
> depends on !BR2_bfin 
> 
> Is this correct to check if a platform supports PCI bus on Buildroot? 

No. We don't really try to make sure that the platform has the relevant
HW for a certain package. You can build i2c-tools even if you don't
have an I2C bus. You can build X.org even if you don't have a screen,
etc.

So just don't try to do anything special about the PCI dependency. You
can try to build your package on Blackfin to see if it builds or not.
If it doesn't, then exclude Blackfin, and that's it. It should build
fine on other architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
