From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 22 Jun 2017 11:49:15 +0300
Subject: [Buildroot] [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170622101041.3d01e783@windsurf>
References: <20170618184200.31167-1-geomatsi@gmail.com>
 <20170618184200.31167-2-geomatsi@gmail.com>
 <20170621224139.720d19cc@windsurf>
 <20170622075519.qp2nbrgekpbhc72i@bars>
 <20170622101041.3d01e783@windsurf>
Message-ID: <20170622084915.rm5u3qbeppy2k6e6@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Yes, it's fine to point to the Armbian github. The only gotcha is how
> to do this without downloading the entire Github repository. I guess
> you will have to do something like this:
> 
> XR819_FIRMWARE_VERSION = 8b4a4ed16f7f9d12e59ff2f9ceba3cc335374dbe
> XR819_FIRMWARE_SITE = https://github.com/armbian/build/tree/$(XR819_FIRMWARE_VERSION)/bin/firmware-overlay/xr819
> XR819_FIRMWARE_SOURCE = fw_xr819.bin
> XR819_FIRMWARE_EXTRA_DOWNLOADS = boot_xr819.bin sdd_xr819.bin
> 
> and of course, add hashes for those files in the .hash file.
> 
> However, the bigger question is: what is the license of those firmware
> files? Are users at least allowed to redistribute them?

Thanks for the answers. I will check the licensing. If it is not
clear enough about redistribution, then I will not add xr819
firmware package. In this case I will just add a note to
board/orangepi/orangepi-zero/readme.txt explaining manual
firmware installation procedure.

Regards,
Sergey
