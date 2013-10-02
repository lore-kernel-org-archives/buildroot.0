From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Oct 2013 09:35:19 +0200
Subject: [Buildroot] [PATCH 3/3] netkitbase: needs mmu
In-Reply-To: <1380693115.31880.2.camel@phoenix> (Axel Lin's message of "Wed,
 02 Oct 2013 13:51:55 +0800")
References: <1380692976.31880.0.camel@phoenix>
 <1380693115.31880.2.camel@phoenix>
Message-ID: <87d2noruq0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error:
 Axel> /opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc  inetd.o servtab.o builtins.o sig.o daemon.o setproctitle.o mysleep.o  -o inetd
 Axel> servtab.o: In function `loadconfigfile.clone.0':
 Axel> servtab.c:(.text+0x98c): warning: gethostbyname is obsolescent, use getnameinfo() instead.
 Axel> inetd.o: In function `main':
 Axel> inetd.c:(.text+0x8a4): undefined reference to `fork'
 Axel> inetd.c:(.text+0x974): undefined reference to `fork'
 Axel> daemon.o: In function `daemon':
 Axel> daemon.c:(.text+0xc): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[2]: *** [inetd] Error 1

Committed, thanks.

-- 
Bye, Peter Korsgaard
