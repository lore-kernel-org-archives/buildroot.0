From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 09:47:24 -0300
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <8762fy4otk.fsf@macbook.be.48ers.dk>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
Message-ID: <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-01-26 09:43, Peter Korsgaard wrote:

> Agreed, except you should use a loop and install -D, so subdirs are
> supported.
>
> E.G.
>
>         for i in $(LINUX_FIRMWARE_FILES); do \
>           $i(INSTALL) -m 0644 -D $(@D)/$$i 
> $(TARGET_DIR)/lib/firmware/$$i; \
>         done

Also LINUX_FIRMWARE_FILES_$(CONFIG_FIRMWARE_XXXX) += file1 file2 could 
be used with $(LINUX_FIRMWARE_FILES_y) to make it even shorter.
While at it, should we go for a /lib/firmware skeleton?
Regards.
