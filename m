From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 12 Feb 2009 15:45:33 +0100
Subject: [Buildroot] Buildroot 2009.02 released
In-Reply-To: <87ocx7g731.fsf@macbook.be.48ers.dk>
References: <87skmkf1s0.fsf@macbook.be.48ers.dk>	<49941678.4040902@cetrtapot.si>
	<87ocx7g731.fsf@macbook.be.48ers.dk>
Message-ID: <4994360D.1030108@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:
> 
> Hi,
> 
>  Hinko> Building gdb for cris-v10 architecture fails with:
> 
> Ahh, seems like you should have tested the release candidates better
> ;)
> 

Yep ;)

Wait a minute - I selected the wrong option: gdb for target.
I wanted to build gdbserver for target, that does compile. IIRC, I saw
the error when building gdb for target!

>  Hinko> make: *** [/work/uclibc.buildroot/buildroot-2009.02/build_cris/gdb-6.8-target/gdb/gdb] Error 2
> 
>  Hinko> Are we missing uclibc config.guess and config.sub?
> 
> No, gdk.mk does the CONFIG_UPDATE stuff, and
> package/gnuconfig/config.guess seems to have have the cris entries.
> 

Right. I found the problem - gdb-6.8/gdb/config/cris and
related config files for native gdb are missing. I seem no one
ever tried native cris gdb. Not a big problem, as I'm used to
debug with gdbserver + host gdb.

Thank you,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
