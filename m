From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Sep 2015 09:26:04 +0200
Subject: [Buildroot] sysvinit-2.88 build is failing for ARM64
In-Reply-To: <20150917213916.GW11632@tarshish>
References: <ec4144432f3279ce0594dd6adbd847f5e4a7fb13.1442482205.git.jpinto@synopsys.com>
 <55FA95DB.80408@synopsys.com> <20150917103540.GO11632@tarshish>
 <55FA986B.9080208@synopsys.com> <55FA9C24.2060901@synopsys.com>
 <20150917111217.GP11632@tarshish>
 <20150917230753.2ad46e4c@free-electrons.com>
 <20150917213916.GW11632@tarshish>
Message-ID: <20150918092604.6029c0a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Fri, 18 Sep 2015 00:39:16 +0300, Baruch Siach wrote:

> Why not use /dev/null for gcc output instead of a temporary file? Something 
> like:
> 
> HAS_LIBCRYPT=$(shell echo 'int main(void) {}' | $(CC) -o /dev/null -xc - -lcrypt >/dev/null 2>&1 && echo y)

Because it is known to not work with all toolchains:

   http://git.buildroot.net/buildroot/commit/toolchain/helpers.mk?id=375bc18850f0f8fec90e1e478c0e9d2159377a64

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
