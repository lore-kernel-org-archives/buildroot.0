From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:37:52 +0200
Subject: [Buildroot] [PATCH 1/1 v2] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
References: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20150401223752.0fd358cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed,  1 Apr 2015 22:12:33 +0200, Sagaert Johan wrote:

> +# lz4 kernel compression is only available on ARM and kernel >= 3.11
> +# we always build host-lz4 when the target is ARM.
> +# (how could i use LINUX_VERSION_PROBED to check for >=3.11 ?)
> +ifeq ($(BR2_arm),y)
> +LINUX_DEPENDENCIES += host-lz4
> +endif

No that still isn't good: LZ4 compressed kernel is available on ARM,
MIPS, x86 and S390 (we don't care about the latter in Buildroot).

No, I really think we need to add new options in linux/Config.in.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
