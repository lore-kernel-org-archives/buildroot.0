From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:59:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/openpowerlink: bump to v2.5.0
In-Reply-To: <1478207123-27787-1-git-send-email-romain.naour@gmail.com>
References: <1478207123-27787-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204235928.5ba9426f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 22:05:22 +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@smile.fr>
> 
>  - Rebase existing patches
>  - Use a "menu" instead of "choice" to select Ethernet Powerlink
>    Drivers since we can now build several kernel modules at once.
>  - Select the Intel 82573 driver by default.
>  - Disable library with simulation interface.
>  - Disable zynq/FPGA (PCIe) interface otherwise the kernelpcp library
>    is always build.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

I've applied, after doing one small change, see below.


> -choice
> -	prompt "select Ethernet Powerlink Driver"
> +menu "select Ethernet Powerlink Driver"

Just "Ethernet drivers" was enough.

 - "select" is useless, options are obviously meant to be selected

 - powerlink is already the name of the package (or close to)

 - driver should be drivers, since we can now select more than one

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
