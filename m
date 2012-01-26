From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 26 Jan 2012 14:44:10 +0100
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
 <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
Message-ID: <4F2158AA.1060508@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.01.2012 13:47, schrieb Gustavo Zacarias:
> On 2012-01-26 09:43, Peter Korsgaard wrote:
> 
>> Agreed, except you should use a loop and install -D, so subdirs are
>> supported.
>>
>> E.G.
>>
>>         for i in $(LINUX_FIRMWARE_FILES); do \
>>           $i(INSTALL) -m 0644 -D $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i; \
>>         done
> 
> Also LINUX_FIRMWARE_FILES_$(CONFIG_FIRMWARE_XXXX) += file1 file2 could be used with $(LINUX_FIRMWARE_FILES_y) to make it even shorter.

How can I use it exactly? Can provide an example?

Yegor
