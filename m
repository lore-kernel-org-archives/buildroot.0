From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:50:53 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gdb-7.12.1 build on xtensa
In-Reply-To: <1490646130-413-1-git-send-email-jcmvbkbc@gmail.com>
References: <1490646130-413-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170328215053.68ae0686@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Mar 2017 13:22:10 -0700, Max Filippov wrote:
> This fixes the following gdb-7.12.1 build error on xtensa architecture:
> 
>   gdb/xtensa-linux-nat.c: In function 'void fetch_gregs(regcache*, ptid_t, int)':
>   gdb/xtensa-linux-nat.c:178:23: error: uninitialized const 'regs' [-fpermissive]
>      const gdb_gregset_t regs;
> 
> Backported from: d274ecf4ddf76768af57e27f654b9ce6784b391c
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...e-const-in-xtensa-linux-nat.c-fetch_gregs.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/gdb/7.12.1/0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
