From: Marc Gauthier <marc@tensilica.com>
Date: Tue, 7 Dec 2010 21:45:28 -0800
Subject: [Buildroot] [PATCH 50/55] xtensa: remove unused and useless
 skeleton patch
In-Reply-To: <20101206204859.51b3cd6f@surf>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<668fe87ee8e6c80825b87382fb17dc9cacc43c0e.1291582352.git.thomas.petazzoni@free-electrons.com>
	<522C1DF17AF50042AD8AE87F7887BD3D01E0B5DDE6@exch.hq.tensilica.com>
	<20101206204859.51b3cd6f@surf>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D01E0D9889F@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Here is the diff between the default skeleton inittab and the xtensa
> specific inittab (and my comments below) :
[...]
> So it does three things:
>
>  * Moves the read/write remount of the root filesystem after mounting
>    proc, which probably makes sense to have in the default skeleton
>    (there has been a thread recently on the list about this).

Ok.


>  * It enables a getty on ttyS0, and we have an option to do that in
>    Buildroot (which this patch set moves to a new "System
>    configuration" menu).


Ah, interesting.


>  * It removes things from tty1, tty2, tty3. They don't do much harm if
>    tty1, tty2 and tty3 are not visible, but if we really think it's
>    useful to be able to disable them, we can just add some
>    more generic options in the "System configuration" menu.

I forget what effect this might have if any.  Will have to try again.


> So I think all those three changes can be handled without having a
> specific inittab, which is why I called the Xtensa specific one
> "useless" (sorry if the word sounded offensive, it definitely
> wasn't my intention).
>
> Does this clarifies what I meant ?

Yes, very much.  I'm happy to call the file "useless" (or whatever it
rightly deserves ;-) , just wanted to understand why.

Thanks!
-Marc



> Thanks for your feedback!
>
> Thomas
