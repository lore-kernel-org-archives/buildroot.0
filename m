From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 16 Jul 2010 00:30:38 +1000
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <1279202763.3572.22.camel@dubciaranr1.verifone.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info> 
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com> 
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com> 
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
Message-ID: <AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 16, 2010 at 12:06 AM, Quotient Remainder
<quotientvremainder@gmail.com> wrote:
>
> I'd actually done both of these before but drew nothing from them
> myself, then again I don't really know what "tic" does

These might help:

  http://tldp.org/HOWTO/Text-Terminal-HOWTO-16.html#ss16.2
  http://en.wikipedia.org/wiki/Terminfo

> #!/bin/sh and adding strace before the tic call:

Ok.

> ? ? ? ?+ strace tic -x -s -o /home/qvr/obair/buildroot.org/output/staging/usr/share/terminfo terminfo.tmp

If you run this from the command line (ie, not via buildroot), what
happens?  Does it still hang?  Are you able to find out whether the
tic that's being called is from buildroot, or the tic installed as
part of your host operating system?  (adding "type -p tic" before tic
is called will show this).

> I've also run ltrace instead of strace and the following is output. ?I
> have *not* chopped off the end of the output (at 0x80495d0); that's all
> that appears.

That's really odd... as if the system call isn't returning.  Never
mind, I look forward to seeing the results of the above tests.

Mitch.
