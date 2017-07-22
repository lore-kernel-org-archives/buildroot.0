From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 21:34:43 +0200
Subject: [Buildroot] [PATCH 1/1] brcm-patchram-plus: new package
In-Reply-To: <20170722152511.4ffc8dd3@windsurf>
References: <20170721144520.14683-1-alexey.roslyakov@gmail.com>
 <20170722152511.4ffc8dd3@windsurf>
Message-ID: <116942c7-9781-f00a-bcb9-37633d2a03ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-07-17 15:25, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 21 Jul 2017 21:45:20 +0700, Alexey Roslyakov wrote:
[snip]
>> +config BR2_PACKAGE_BRCM_PATCHRAM_PLUS
>> +	bool "brcm-patchram-plus"
>> +	help
>> +		Utility's to configure and test Broadcom Bluetooth chips on Linux.
                Utilities

 As I understand it, recent kernels should be able to load the firmware directly
from the driver, and recent bluez should be able to issue the other HCI
commands. Is that correct or not?

>> +
>> +		https://code.google.com/archive/p/broadcom-bluetooth/
> 
> Indentation for the help text is one tab + two spaces. I would
> recommend you to run utils/check-package on your new package to catch
> such coding style issues.
> 
>> +BRCM_PATCHRAM_PLUS_VERSION = 0.1.1
>> +BRCM_PATCHRAM_PLUS_SOURCE = brcm-patchram-plus_$(BRCM_PATCHRAM_PLUS_VERSION).tar.gz
>> +BRCM_PATCHRAM_PLUS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
> 
> Perhaps using the git repository at
> https://chromium.googlesource.com/chromiumos/third_party/broadcom would
> be a more "official" upstream ?

 Indeed, that's what's used by openembedded. It also has an additional feature
--enable_bt_rfkill.

 There is also https://github.com/MarkMendelsohn/brcm_patchram - certainly less
official, but possibly better maintained. Well, it doesn't have --enable_bt_rfkill.


 Regards,
 Arnout

>> +define BRCM_PATCHRAM_PLUS_BUILD_CMDS
>> +	$(TARGET_CC) -o $(@D)/brcm_patchram_plus $(@D)/brcm_patchram_plus.c
>> +endef
>> +
>> +define BRCM_PATCHRAM_PLUS_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/brcm_patchram_plus $(TARGET_DIR)/usr/bin/brcm_patchram_plus
>> +endef
> 
> What about using the Makefile that comes inside the package ? At least
> in the Git repository I pointed to, there is a Makefile that seems
> suitable.
> 
> Thanks!
> 
> Thoma
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
