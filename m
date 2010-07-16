From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 16 Jul 2010 11:28:00 +1000
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <1279212734.3572.42.camel@dubciaranr1.verifone.com>
References: <1279123755.7058.242.camel@cabbage.rehill.info> 
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com> 
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com> 
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
	<AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com> 
	<1279205058.3572.29.camel@dubciaranr1.verifone.com>
	<AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com> 
	<1279212734.3572.42.camel@dubciaranr1.verifone.com>
Message-ID: <AANLkTikfJUKA0Y1Wv8iJ2Wa8w4IspA5wY-WkhBmkWueV@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 16, 2010 at 2:52 AM, Quotient Remainder
<quotientvremainder@gmail.com> wrote:
> Ar Aoine, 2010-07-16 ag 02:33 +1000, scr?obh Mitch Davis:
>> On Fri, Jul 16, 2010 at 12:44 AM, Quotient Remainder
>> <quotientvremainder@gmail.com> wrote:
>> >
>> >> If you run this from the command line (ie, not via buildroot), what
>> >> happens? ?Does it still hang?
>> >
>> > Yes, same result.
>>
>> Good. ?Now what happens if you run tic manually from the command line
>> under gdb? ?If you wait until it hangs, then press ^C, then run "bt"
>> in gdb, what happens? ?(You may like to install debug info for tic.
>> In Fedora, I'd do this:
>>
>
> Unfortunately I don't have root on this machine so debug symbols are not
> available.

If you're keen you can grab the debug RPM and use rpm2cpio to extract
the contents, then point gdb at it.  It would be nice to know the line
of code at 0x0055d2e5...

Yes it looks like a problem with the RHEL tic command.  Since it
appears that tic is being found on your path, is there a chance that
you can compile ncurses for yourself (--prefix=$HOME or similar) and
use that tic instead?

Mitch.
