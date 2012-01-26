From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 13:57:56 +0100
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar> (Gustavo
 Zacarias's message of "Thu, 26 Jan 2012 09:47:24 -0300")
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
 <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
Message-ID: <871uqm4o4r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Agreed, except you should use a loop and install -D, so subdirs are
 >> supported.
 >> 
 >> E.G.
 >> 
 >> for i in $(LINUX_FIRMWARE_FILES); do \
 >> $i(INSTALL) -m 0644 -D $(@D)/$$i
 >> $(TARGET_DIR)/lib/firmware/$$i; \
 >> done

 Gustavo> Also LINUX_FIRMWARE_FILES_$(CONFIG_FIRMWARE_XXXX) += file1 file2 could
 Gustavo> be used with $(LINUX_FIRMWARE_FILES_y) to make it even shorter.

Agreed.

 Gustavo> While at it, should we go for a /lib/firmware skeleton?

What is the advantage to adding an empty dir in the default skeleton? We
want this work with custom skeletons where it might not exist.

-- 
Bye, Peter Korsgaard
