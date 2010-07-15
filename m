From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 15 Jul 2010 22:06:43 +1000
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <1279192188.6184.2.camel@dubciaranr1.verifone.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info> 
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
Message-ID: <AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 15, 2010 at 9:09 PM, Quotient Remainder
<quotientvremainder@gmail.com> wrote:
> Unfortunately it doesn't work, still stuck at the same place, though the
> patch has changed the variable list passed.
>
> ? ? ? ?DESTDIR=/home/crehill/obair/buildroot.org/output/staging \
> ? ? ? ? ? ? ? ?prefix=/usr \
> ? ? ? ? ? ? ? ?exec_prefix=/usr \
> ? ? ? ? ? ? ? ?bindir=/usr/bin \
> ? ? ? ? ? ? ? ?top_srcdir=.. \
> ? ? ? ? ? ? ? ?srcdir=. \
> ? ? ? ? ? ? ? ?datadir=/usr/share \
> ? ? ? ? ? ? ? ?ticdir=/usr/share/terminfo \
> ? ? ? ? ? ? ? ?source=terminfo.tmp \
> ? ? ? ? ? ? ? ?cross_compiling="yes" \
> ? ? ? ? ? ? ? ?/bin/sh ./run_tic.sh
> ? ? ? ?** Building terminfo database, please wait...
> ? ? ? ?Running tic to install /home/crehill/obair/buildroot.org/output/staging/usr/share/terminfo ...

I don't know if this is helpful or not, but can you run strace -p
$(pidof tic) and show the result?  That might tell us what tic is
doing.  In addition, you may consider adding "set -x" to run_tic.sh.
That will tell us how tic is being invoked.

Mitch.
