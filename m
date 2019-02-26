From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Feb 2019 09:36:45 +0100
Subject: [Buildroot] or1k - openrisc, gdb
In-Reply-To: <CAKtOgoSxdRRucLoQW6eExuw0n2J26wFC0W6w2hKqOmuuGSxXqA@mail.gmail.com>
References: <CAKtOgoSxdRRucLoQW6eExuw0n2J26wFC0W6w2hKqOmuuGSxXqA@mail.gmail.com>
Message-ID: <20190226093645.0c6f4d75@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shimon,

Please Cc: the Buildroot mailing list for such questions. I've added it
in Cc. Thanks!

On Mon, 25 Feb 2019 23:05:43 +0200
Shimon Zadok <shimon.zadok@gmail.com> wrote:

> It seems that gdb is available for or1k,
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=tree;f=cpu;h=9adfae1a3b79dc955562b75284ba57536c6d8fd3;hb=HEAD

The presence of a or1k file in the cpu/ folder is not sufficient to
indicate that there is gdb support.

> Though the following commit says otherwise(, but may be outdated):
> commit 61b502794eda3fdd100eea9e8f3d0b78f8fe4151
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Sat Jun 3 15:39:38 2017 +0200
> 
>     gdb: not available on ARM noMMU and OpenRISC
> 
>     Neither gdb nor gdbserver have support for ARM noMMU and OpenRISC, so
>     let's disable gdb on those architectures.
> 
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>     ---
>     Changes since v2:
>      - Fixed BR2_openrisc to BR2_or1k in Config.in.host
>     Changes since v1:
>      - Fixed BR2_openrisc to BR2_or1k
> 
> What would be the procedure to update that?

However, or1k support was indeed recently added in gdb, in commit:

  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=42e151bf4cc66b8781f2b139c6da320095f9a045

This commit is not yet in any gdb release, so I guess waiting until 8.3
is released is necessary. Alternatively, you could use a Git commit for
the gdb version on or1k, like what is done for the ARC architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
