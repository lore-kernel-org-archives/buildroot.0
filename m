From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:54:41 +0200
Subject: [Buildroot] [PATCH 2/3] uboot: deprecate
 BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
In-Reply-To: <1429302375-12275-2-git-send-email-fhunleth@troodon-software.com>
References: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
 <1429302375-12275-2-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150418155441.76edbfe1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Fri, 17 Apr 2015 16:26:14 -0400, Frank Hunleth wrote:
> Users should use BR2_TARGET_UBOOT_PATCHES instead.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Except that your implementation of BR2_TARGET_UBOOT_PATCHES does not
allow the same thing as BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR.
BR2_TARGET_UBOOT_PATCHES, as per your current implementation, can only
be used for remote patches: they will be downloaded from the given URL
if a full URL is given, or from $(UBOOT_SITE) if just a file name is
given.

See how things are done in linux/linux.mk for an example that allows
both remote and local patches. Though I'm not necessarily too happy to
see the linux/linux.mk being duplicated...

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
