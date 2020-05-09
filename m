From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 18:39:43 +0200
Subject: [Buildroot] [PATCH] package/ndisc6: fix for codesourcery
 compilation
In-Reply-To: <20200509170503.346103-1-vadim4j@gmail.com>
References: <20200509170503.346103-1-vadim4j@gmail.com>
Message-ID: <20200509183943.126d56e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 May 2020 20:05:03 +0300
Vadym Kochan <vadim4j@gmail.com> wrote:

> trace-{udp,tcp}.c uses BSD-style headers, it builds ok on some
> latest libc compilation because they use:
> 
>     __extension__ union
> 
> but for example on codesourcery toolchain 4.x version it requires that
> __FAVOR_BSD is defined. So fix it by defining this define only for
> tcp/udp headers.
> 
> Fixes: http://autobuild.buildroot.net/results/d05d5471d10a2b6634711ccad75d7f86d222cc31
> 
> Signed-off-by: Vadym Kochan <vadim4j@gmail.com>

Fixing issues for "codesourcery compilation" is wrong. What is being
fixed is either a glibc-version related issue, or a gcc-version related
issue. But we don't fix things for one specific toolchain.

Could you investigate a bit more, and reword the patch and commit log
accordingly ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
