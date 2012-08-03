From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Fri, 3 Aug 2012 05:59:26 -0700 (PDT)
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <20120802214237.37ed2f82@skate>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20120801231635.08b7d808@skate>
 <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120802152640.5d9cca86@skate>
 <1343936315.31073.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <20120802214237.37ed2f82@skate>
Message-ID: <1343998766.23838.YahooMailNeo@web164606.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello 
?
Regarding problem "undefined refernece?to c", I found,
using "nm" command that this function does not exist in uClibc, and 
it does in glibc (although for i386, but I expect?also in ARM case).Seems to me obvious that some file in my GUI project (as error report 
declares) - ask for __libc_start_main function and certainly not find
it in libc.so (ie uClibc). 
So I intend to build root file system with glibc and want to ask you if?it 
is OK to choose (menuconfig): Toolchain type (CrosstoolNG- toolchain)
and immediately below: CrosstoolNG- C library (glibc) ?
The?other adjustments I would not change. 
What confuses me is that my compiler asked at some moment for?"ld-uClibc.so" 
library and I don't know what would happened if I?build with?glibc.
And at last - do I have to rebuild all if I change toolchain the way I described ?
?
Best regards


________________________________
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at uclibc.org" <buildroot@uclibc.org> 
Sent: Thursday, August 2, 2012 9:42 PM
Subject: Re: [Buildroot] glibc instead of ulibc ?

Hello,

Le Thu, 2 Aug 2012 12:38:35 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> Excuse me, Thomas, but I don't know exactly the meaning of? "keeping
> the Buildroot list in Cc", however hope this way is OK.

It is correct. You kept the list in copy of our discussion, which is
good.

> Shortly as possible - I build Tiny X?with Buildroot for ARM and it
> works on target, including your?gtk-demo.Now I try building my own
> simple GUI - gtk program (Lazarus iz Delphi like IDE - it works
> OK?for me?in Linux-?i386 and could be adjusted?for cross compilation
> including ARM). I use it at Ubuntu 11.04. For cross compiling, I
> use?target libraries (X11, pango, ...), built as described. However,
> I probably make some mistake in first pass, and in second attempt
> (few hours ago) the only error reported, AT THE MOMENT, is (like
> first time): undefined refernece?to __libc_start_main. Here
> http://lists.uclibc.org/pipermail/uclibc/2006-June/015659.html?I
> found some statement that uClibc does not have that function (but
> glibc yes). I am aware that this question is maybe more related to
> other forums, but part of it MAYBE to uClibc. So don't bother too
> much with this problem, just hoped that it?was already?recorded
> matter.

If you don't provide all the details needed to reproduce your problem,
there's no way we can help you. So, please provide:

*) Your Buildroot configuration and version
*) The exact command lines you use to build your Lazarus program
*) An example of Lazarus program that exhibits the problem

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120803/f4f407f5/attachment.html>
