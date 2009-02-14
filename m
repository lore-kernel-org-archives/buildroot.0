From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 14 Feb 2009 07:18:04 +0100
Subject: [Buildroot] 2009.02-rc4 released
In-Reply-To: <1234567053.7737.1.camel@daniel-laptop> (Daniel Li's message of
	"Sat\, 14 Feb 2009 07\:17\:33 +0800")
References: <87ljsf7f2f.fsf@macbook.be.48ers.dk>
	<1234567053.7737.1.camel@daniel-laptop>
Message-ID: <87eiy1ee3n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Li <lida_mail@163.com> writes:

 Daniel> Dear All,
 Daniel> I'm using ubuntu.
 Daniel> I just downloaded 2009.02, and met some error. What's the problem? How
 Daniel> can I solve the issue? Thanks.

 Daniel> daniel at daniel-laptop:~/work2/buildroot$ make menuconfig
 Daniel> make CC="/usr/bin/gcc" -C package/config conf mconf
 Daniel> make[1]: Entering directory
 Daniel> `/home/daniel/work2/buildroot/package/config'
 Daniel> /usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE  -g -O2  -c conf.c -o
 Daniel> conf.o
 Daniel> conf.c: ???'conf_askvalue'?:
 Daniel> conf.c:112: ??: ????? warn_unused_result ???'fgets'????
 Daniel> conf.c: ???'conf_choice'?:
 Daniel> conf.c:363: ??: ????? warn_unused_result ???'fgets'????
 Daniel> /usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE  -g -O2  -c kxgettext.c
 Daniel> -o kxgettext.o
 Daniel> /usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE  -g -O2  -c
 Daniel> lxdialog/checklist.c -o lxdialog/checklist.o
 Daniel> In file included from lxdialog/checklist.c:24:
 Daniel> lxdialog/dialog.h:32:20: error: curses.h: ????????

Hard to know with your locale, but it seems like you don't have the
ncurses development package installed.

-- 
Bye, Peter Korsgaard
