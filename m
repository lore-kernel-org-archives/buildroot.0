From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jun 2017 10:10:41 +0200
Subject: [Buildroot] [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170622075519.qp2nbrgekpbhc72i@bars>
References: <20170618184200.31167-1-geomatsi@gmail.com>
 <20170618184200.31167-2-geomatsi@gmail.com>
 <20170621224139.720d19cc@windsurf>
 <20170622075519.qp2nbrgekpbhc72i@bars>
Message-ID: <20170622101041.3d01e783@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jun 2017 10:55:19 +0300, Sergey Matyukevich wrote:

> Thanks for taking care and fixing those patch issues !
> 
> Could you please also comment on the question regarding firmware binaries
> from the cover email to this patch series. For convenience
> I repeat it here:

Thanks for repeating these here, because I missed them. Patchwork only
lists the patches, not the cover letter, so I tend to miss the cover
letter details, sorry about that :/

> This series does not include firmware since I have certain doubts regarding
> firmware packaging. IIUC normally xr819 firmware is extracted from vendor's SDK.
> Extracted firmware can be obtained from various places on the web,
> e.g. from Armbian project.
> 
> Would it be alright to point at Armbian github in firmware package ?

Yes, it's fine to point to the Armbian github. The only gotcha is how
to do this without downloading the entire Github repository. I guess
you will have to do something like this:

XR819_FIRMWARE_VERSION = 8b4a4ed16f7f9d12e59ff2f9ceba3cc335374dbe
XR819_FIRMWARE_SITE = https://github.com/armbian/build/tree/$(XR819_FIRMWARE_VERSION)/bin/firmware-overlay/xr819
XR819_FIRMWARE_SOURCE = fw_xr819.bin
XR819_FIRMWARE_EXTRA_DOWNLOADS = boot_xr819.bin sdd_xr819.bin

and of course, add hashes for those files in the .hash file.

However, the bigger question is: what is the license of those firmware
files? Are users at least allowed to redistribute them?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
