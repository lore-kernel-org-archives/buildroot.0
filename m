From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:04:42 +0100
Subject: [Buildroot] [PATCH] ptpd2: fix bfin compile by avoiding gcc bug
In-Reply-To: <20161121183217.GA1046@waldemar-brodkorb.de>
References: <20161121183217.GA1046@waldemar-brodkorb.de>
Message-ID: <20161121220442.77263bd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 19:32:18 +0100, Waldemar Brodkorb wrote:

> +# GCC bug with Os/O1/O2/O3
> +# internal compiler error: in gen_add2_insn, at optabs.c:4454
> +ifeq ($(BR2_bfin),y)
> +PTPD2_CONF_ENV += CFLAGS="-O0"

You forgot to pass $(TARGET_CFLAGS) here. With your change, we loose
TARGET_CFLAGS. So I've fixed that up and applied.

However, I continue to dislike such hacks: when the problem gets fixed
by gcc, how will we notice?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
