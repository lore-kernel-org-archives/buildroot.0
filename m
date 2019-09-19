From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:40:39 +0200
Subject: [Buildroot] [PATCH] package/ytree: needs glibc/uclibc toolchain
 (re_comp/re_exec)
In-Reply-To: <20190919200257.7960-1-ps.report@gmx.net>
References: <20190919200257.7960-1-ps.report@gmx.net>
Message-ID: <20190919224039.2ee970e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Sep 2019 22:02:57 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   match.o: In function `SetMatchSpec':
>   match.c:(.text+0x9c): undefined reference to `re_comp'
>   match.o: In function `Match':
>   match.c:(.text+0xca): undefined reference to `re_exec'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ytree/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks. Not great that we're adding a new package,
and it uses some old legacy/deprecated APIs that musl doesn't implement.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
