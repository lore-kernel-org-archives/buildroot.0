From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 17:50:17 +0200
Subject: [Buildroot] Numerous ARC related toolchain issues
Message-ID: <20160609175017.0d9fae13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

It seems like since the latest update of the ARC tools, we're seeing
quite a few build failures caused by the toolchain:

http://autobuild.buildroot.net/results/d73/d732127d136bacc6bc17b742028691437df7f5f9/build-end.log
BFD (GNU Binutils) 2.26.51.20160308 assertion fail elf32-arc.c:1566

http://autobuild.buildroot.net/results/cb8/cb8bd3a01c7a6fadb20f18c1a3cbfabc52f3a6ff/build-end.log
/tmp/ccKi33Rl.s: Assembler messages:
/tmp/ccKi33Rl.s:578: Error: @dtpoff is not a complex relocation.
/tmp/ccKi33Rl.s:578: Error: extra comma
/tmp/ccKi33Rl.s:578: Error: syntax error
/tmp/ccKi33Rl.s:588: Error: @dtpoff is not a complex relocation.
/tmp/ccKi33Rl.s:588: Error: extra comma
/tmp/ccKi33Rl.s:588: Error: syntax error

http://autobuild.buildroot.net/results/37a/37a57f29c6632fcdb18670a18328679dee925240/build-end.log
BFD (GNU Binutils) 2.26.51.20160308 assertion fail elf32-arc.c:1566

http://autobuild.buildroot.net/results/1c1/1c14a7cbda1dce8867275ba2f2c70054fdbfbbbc/build-end.log
(same, but on wireshark)

These are all with the internal toolchain backend, so we're building
with the latest ARC toolchain components.

Are these problems already known? They seem to be new, I don't think
they were appearing with the previous release of ARC tools.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
