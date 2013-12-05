From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 23:31:31 +0100
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <52A0BCBC.5000008@mind.be>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
 <1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
 <20131204094419.6d4d4279@skate> <529EFEBA.8040103@zacarias.com.ar>
 <20131204133306.7e7e8e07@skate> <529F24A4.6030005@zacarias.com.ar>
 <52A0BCBC.5000008@mind.be>
Message-ID: <20131205233131.0cad979d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 05 Dec 2013 18:49:48 +0100, Arnout Vandecappelle wrote:

> >> Yes, I agree, the user mode emulation should probably be removed. It
> >> simply cannot work properly, because we have no way of guaranteeing
> >> that the kernel headers used for the target toolchain are older than
> >> the kernel running on the system.
> 
>   It's not possible to do it in Config.in, but it's easy to do during the 
> build: compare /usr/include/linux/version.h with 
> $(STAGING_DIR)/usr/include/linux/version.h

And then you fail the build if
$(STAGING_DIR)/usr/include/linux/version.h gives a newer version
of /usr/include/linux/version.h ? Could be possible, even if not really
nice. But Fran?ois is proposing to remove cpanminus, which was the only
reason to have qemu-user support. So do we care?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
