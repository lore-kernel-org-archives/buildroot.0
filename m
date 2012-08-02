From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Thu, 2 Aug 2012 15:00:07 -0700 (PDT)
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <20120802214237.37ed2f82@skate>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20120801231635.08b7d808@skate>
 <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120802152640.5d9cca86@skate>
 <1343936315.31073.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <20120802214237.37ed2f82@skate>
Message-ID: <1343944807.21046.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Buildroot is 2012.02. Config, attached. 

Lazarus project is nothing more then simple form- no code. However,
attached is project file and the only unit - all automatically generated 

by IDE.
Tricky part is command for compiling. I do that from IDE - in accordance
with: http://wiki.freepascal.org/Setup_Cross_Compile_For_ARM. 

Of course, I don't expect from someone, not related to Lazarus, to dive 

into that matter, but that was what you asked me (I suppose).
Target libs, that compiler asked me for, I transferred from my NFS 

target folders (mainly <buildroot>/output/target/usr/lib) into ...lazarus/fpc/libcross. Then, 

compiler didn't complain about missing files (as it was without transfering target libs) 

but only error I've mentioned (AT THE MOMENT).? Or to remaind -compiling, passed 

and linking error was:? .../rtl/cprt0.o: In function _start:

(.text+0x4c): undefined reference to __libc_start_main.

Best regards

PS
I may be wrong but GUI programming to me has sense only if
I have friendly environment like VS or Delphi in Windows. 

Learning gtk or Qt functions seems to me very time consuming task instead
of spending time to solve real problem.Lazarus is OK for Linux (,Windows, MacOS...) 

in that sense so I want to try it for ARM cross compiling.



From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at uclibc.org" <buildroot@uclibc.org> 
Sent: Thursday, August 2, 2012 12:42 PM
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120802/b38918bc/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 31590 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120802/b38918bc/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: prvarm.lpr
Type: application/octet-stream
Size: 359 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120802/b38918bc/attachment-0003.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: unit1.pas
Type: text/x-pascal
Size: 287 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120802/b38918bc/attachment-0001.pas>
