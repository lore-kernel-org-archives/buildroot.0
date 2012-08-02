From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Thu, 2 Aug 2012 12:38:35 -0700 (PDT)
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <20120802152640.5d9cca86@skate>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20120801231635.08b7d808@skate>
 <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120802152640.5d9cca86@skate>
Message-ID: <1343936315.31073.YahooMailNeo@web164603.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Excuse me, Thomas, but I don't know exactly the meaning of? "keeping
the Buildroot list in Cc", however hope this way is OK.
Shortly as possible - I build Tiny X?with Buildroot for ARM and it works
on target, including your?gtk-demo.Now I try building my own simple GUI - gtk program
?(Lazarus iz Delphi like IDE - it works OK?for me?in Linux-?i386 and could be??
adjusted?for cross compilation including ARM). I use it at Ubuntu 11.04.
For cross compiling, I use?target libraries (X11, pango, ...), built as described.
However, I probably make some mistake in first pass, and in second attempt
(few hours ago) the only error reported, AT THE MOMENT, is (like first time):? 
undefined refernece?to __libc_start_main.? 
Here http://lists.uclibc.org/pipermail/uclibc/2006-June/015659.html?I found some
statement that uClibc does not have that function (but glibc yes). 
I am aware that this question is maybe more related to other forums, but part of
it MAYBE to uClibc. So don't bother too much with this problem, just hoped that?
it?was already?recorded matter.?
?
Thanks a lot


________________________________
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: buildroot at uclibc.org 
Sent: Thursday, August 2, 2012 3:26 PM
Subject: Re: [Buildroot] glibc instead of ulibc ?

Hello,

Please keep the Buildroot list in Cc.

Le Thu, 2 Aug 2012 06:23:26 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> I am not much familiar with process of linking, but I suppose,
> somwhere (in Lazarus units) is explicitly named glibc.so as file
> which contains necessary binaries (let's say for fclose function). It
> is so in Windows, where I must note (Delphi) dll name and function
> name or index?inside that dll,?in order for linker to find wanted
> function.) Otherwise, I don't know why linker would try to find
> eg.?fclose function exactely?in uclibc.so. Or am I wrong with that
> way of thinking ? 

Yes. The compiler knows which C library it has been linked against, and
automatically links programs against it, unless you explicitly tell it
to do otherwise.

However, I don't know what Lazarus is, and how it works, so maybe it
does funky things. If you want help, please share the current state of
the packages you're trying to add to Buildroot and let us know how to
reproduce the problem, and maybe someone will try to help on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120802/a6c57494/attachment.html>
