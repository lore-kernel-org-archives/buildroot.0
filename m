From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Thu, 27 Jul 2017 13:58:42 -0300 (BRT)
Subject: [Buildroot] How to add a new board to buildroot
In-Reply-To: <1501170608.440004909@f502.i.mail.ru>
References: <1501170608.440004909@f502.i.mail.ru>
Message-ID: <1109478333.2167086.1501174722386.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 

> De: "????????? ?????????" <naka_sml@mail.ru>
> Para: buildroot at busybox.net
> Enviadas: Quinta-feira, 27 de julho de 2017 12:50:08
> Assunto: [Buildroot] How to add a new board to buildroot

> Good day!
> I have some problems with addind a new my_board to buildroot.
> I've tried to develop linux kernel to special mips-32 processor.
> May be you have some manual how to do it.
> Thats what I've done:
> 1. download buildroot 2016-08
> 2. choose malta board (at least I need to add my_own_board, but i choose malta
> board because it is similar to mine board)
> 3. make
> 4. in folder arch/mips create folder my_board with needed files(Timers,
> initions, uart, exeptions), in uncludes also create folder my_board
> 5. copy changed folder linux-3-4-2 on local server
> 6. try to make buildroot using local linux.
> 7. at the end I have many errors: part of it because with my_board also
> malta-board is making...
> May be you have manual or another paper how to add new_board to buildroot.
> I'll be greatful if there is someone who can help me to add this new board.
> Best regards, Anastasia.

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Maybe steps 4 or 5 are incorrect: 

Use OVERRIDE_SRCDIR for local development (see usage in buildroot manual): 

1 - create a file local.mk in buildroot output folder 
2 - My local.mk contains 

LINUX_OVERRIDE_SRCDIR=/opt/devel/repos/my-kernel 

my-kernel folder contains the kernel source-code, of course. 

Try this first. Maybe you have some additional problems that can be solved running "make menuconfig", in the kernel part (use a custom repo, use an in-tree kerel defconfig, etc.) 

-- 
Dr. Henrique Marks 
henrique.marks at datacom.ind.br 
R. Am?rica, 1000 - Eldorado do Sul - RS 
CEP: 92990-000 - Brasil 
Fone: +55 51 3933 3000 - Ramal 3466 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170727/0bc96a6b/attachment.html>
