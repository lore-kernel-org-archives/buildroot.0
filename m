From: Artem Panfilov <panfilov.artyom@gmail.com>
Date: Mon, 25 Feb 2019 09:24:38 +0300
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: fix build with new
 headers
In-Reply-To: <20190225055853.rq2w5qnl4jxacj53@sapphire.tkos.co.il>
References: <20190224204931.2759-1-panfilov.artyom@gmail.com>
 <20190225055853.rq2w5qnl4jxacj53@sapphire.tkos.co.il>
Message-ID: <daf9e974-a52d-8109-102c-8d95b15732c3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 25.02.2019 8:58, Baruch Siach wrote:> Maybe update the Linaro toolchain to 2019.02 in master?
> This is a kernel bug. Kernel UAPI headers must not use the userspace clockid_t 
> type. This bug has been fixed in kernel commit e2c4cf7f98a5 ("net: Use 
> __kernel_clockid_t in uapi net_stamp.h") just before the v4.20 release. It 
> looks like this Linaro toolchain took the headers of a kernel -rc release.

This patch is already in the master branch of linuxptp.
It depends when buildroot 2019.02 will be released.

Upgrading toolchain seems a cleaner solution for me.

Artem
