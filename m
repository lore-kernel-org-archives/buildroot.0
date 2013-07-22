From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 07:31:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] dropwatch: new package
In-Reply-To: <CAEvN+1jnT+8CXC+gtHO-Pu1zPz9K181f6D6TsZ01CErbiuC6jw@mail.gmail.com>
 (Tzu-Jung Lee's message of "Mon, 22 Jul 2013 08:00:48 +0800")
References: <1374284049-8159-1-git-send-email-tjlee@ambarella.com>
 <87a9lfr16n.fsf@dell.be.48ers.dk>
 <CAEvN+1jnT+8CXC+gtHO-Pu1zPz9K181f6D6TsZ01CErbiuC6jw@mail.gmail.com>
Message-ID: <8761w3qhyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tzu-Jung" == Tzu-Jung Lee <roylee17@gmail.com> writes:

Hi,

 T> +++ b/package/dropwatch/dropwatch-1.4-build.patch
 T> @@ -0,0 +1,27 @@
 T> +From 03bab84ca3f102274837e83ee6da4c997a9da018 Mon Sep 17 00:00:00 2001
 T> +From: Tzu-Jung Lee <tjlee@ambarella.com>
 T> +Date: Fri, 12 Jul 2013 20:00:57 +0800
 T> +Subject: [PATCH] build: modify hardcoded gcc to support buildroot
 T> +
 >> 
 >> It isn't just about buildroot, it is for everything not just using
 >> 'gcc'.
 >> Did you send this patch upstream?

 T> I'm sending one now, and will feedback once I got ... feedback :-)

Great, thanks.

 T> +define DROPWATCH_INSTALL_TARGET_CMDS
 T> +  cp $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin
 >> 
 >> We normally use
 >> $(INSTALL) -D -m 0755 $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin/dropwatch

 T> done.

 >> And normally put it below the build step.

 T> Do you mean to put it under BUILD_CMD, instead, or both BUILD and INSTALL_TARGET

Under BUILD_CMDS, so they are listed in the order that they get
executed.


 >> Does it really make sense to put in usr/bin? Don't you need root
 >> permissions to listen for these events?

 T> Not really. It doesn't require root permission.

Ahh, ok.


 >> 
 >> From the website I see it apparently relies on some out of tree netlink
 >> patches:
 >> 
 >> Normally, monitoring for dropped packets requires the creation of a
 >> script that periodically polls all the aformentioned interfaces,
 >> checking for a change in various counter values. Dropwatch instead
 >> listens on a netlink socket for the kernel to inform userspace (apps
 >> like dropwatch and any others), that a packet has been dropped. This of
 >> course implies that the kernel has some sort of functionality to this
 >> end. That functionality (called the netlink Drop Monitor protocol), is
 >> currently being reviewed upstream. For those who would like to
 >> experiment with dropwatch now, you can either retrieve the appropriate
 >> kernel patches from the netdev mailing list, or download them here
 >> 
 >> Is that still the case? Have these been reviewed on the netdev list?
 >> Have they been accepted/rejected?

 T> Yes, they've been merged for quite some time.

Ahh, great!

-- 
Bye, Peter Korsgaard
