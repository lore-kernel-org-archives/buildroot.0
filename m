From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 28 May 2009 10:48:55 +0100
Subject: [Buildroot] kernel module dir following move to git
Message-ID: <4A1E5E07.2000403@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Following the move to git I am seeing the kernel modules being built to a different 
directory. The code expects modules to be built in 
$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)

LINUX26_VERSION_PROBED is set with
LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) -s kernelrelease`

Since the move to git the kernel has changed what it reports with kernelrelease to 
$(VERSION)-g7664a62a-dirty. Presumably the kernel is spotting that buildroot came from a 
git repository and is appending info about the checkout?

Any suggestion on how to prevent this happening?

Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
