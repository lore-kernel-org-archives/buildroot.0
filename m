From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 07:59:04 +0100
Subject: [Buildroot] Curl : Segmentation Fault
In-Reply-To: <0DE4C824AF494821A7CBD6732C85F0A6@JohanW7>
References: <54A0F0B594484527AFD52D676121CFAF@JohanW7>
 <20120314202240.6e90ba86@skate>
 <0DE4C824AF494821A7CBD6732C85F0A6@JohanW7>
Message-ID: <20120315075904.1e5493e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 15 Mar 2012 01:51:47 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> Thanks for reply, i am getting desperate..
> 
> I am using ARM9 (AT91SAM9260 )

Can you try setting BR2_arm926t=y in your configuration?

I am not sure for what ARM architecture gcc generates code by default
(which is what happens when you use BR2_generic_arm).

> First libsoup causing problems, and when trying to switch to curl something else bites me...
> 
> Should i do a rebuild with strip disabled ?

Yes.

> Should i build a gdb for my target ?

Either that or cross-gdb+gdbserver.

> I tried remote cross debugging with gdbserver but even that causes trouble : debugging a trivial 'Hello world' world using
> uclibc-0.9.33 fails. 
> (breakpoints are just ignored. I don't have that with the 0.9.32)

Argh, ok. It would have been good to report that previously, because it
is quite a big problem if gdbserver doesn't work with uClibc 0.9.33.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
