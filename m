From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Sep 2013 11:35:41 +0200
Subject: [Buildroot] [PATCH] xinetd: needs mmu
In-Reply-To: <1380269959.32472.1.camel@phoenix> (Axel Lin's message of "Fri,
 27 Sep 2013 16:19:19 +0800")
References: <1380269959.32472.1.camel@phoenix>
Message-ID: <87mwmy4nf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel> Fixes below build error:

 Axel> /opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc -pipe -Os   -Wl,-elf2flt -DNO_RPC  -I../libs/include  -o xinetd access.o addr.o builtins.o child.o conf.o confparse.o connection.o env.o ident.o init.o int.o intcommon.o internals.o log.o logctl.o main.o msg.o nvlists.o parse.o parsesup.o parsers.o reconfig.o retry.o sconf.o sensor.o server.o service.o signals.o special.o tcpint.o time.o udpint.o util.o redirect.o xgetloadavg.o options.o includedir.o xtimer.o inet.o xmdns.o -L../libs/lib -lsio -lmisc -lxlog -lportable -lstr -lpset -lm -lcrypt  || rm -f xinetd
 Axel> init.o: In function `init_daemon':
 Axel> init.c:(.text+0x318): undefined reference to `fork'
 Axel> int.o: In function `intercept':
 Axel> int.c:(.text+0x3a4): undefined reference to `fork'
 Axel> server.o: In function `server_start':
 Axel> server.c:(.text+0x1b8): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status

Committed, thanks.

-- 
Bye, Peter Korsgaard
