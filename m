From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Fri, 17 Aug 2012 11:05:33 -0700 (PDT)
Subject: [Buildroot] external toolchain
In-Reply-To: <201208171519.16926.yann.morin.1998@free.fr>
References: <1345207629.82252.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <201208171519.16926.yann.morin.1998@free.fr>
Message-ID: <1345226733.22381.YahooMailNeo@web164602.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for revealing me the matter about Crosstool- NG adjustment
and related to glibc. I?was not?able to try (but will do at monday), however,
it raises another question to me. Having in mind that I built with??2.6.9 choice?
- which is default (although I didn't know the fact) and that my exact kernel
version is 2.6.32.2 (that is on target board) then how it comes error
"kernel too old" (because target kernel is newer one) ???
?
Best regards
?


________________________________
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot at busybox.net; Zoran Djordjevic <djdjdjole@yahoo.com> 
Sent: Friday, August 17, 2012 3:19 PM
Subject: Re: [Buildroot] external toolchain

Zoran, All,

On Friday 17 August 2012 14:47:09 Zoran Djordjevic wrote:
> I am using buildroot to build RFS with external toolchain support.
> When using Crosstool- NG, it builds OK, but on my target I got
> an error- saying "kernel too old".

When you build your toolchain with crosstool-NG, you can tell glibc what the
oldest supported kernel should be:
? ? C-library? --->
? ? ? ? Minimum supported kernel version (Specific kernel version)? --->
? ? ? ? ? ? (2.6.9) Minimum kernel version to support

Of course, 2.6.9 is just an example. Use whatever you see fit for your
use-case (eg. 2.6.32?)

> Seems to me that there is no other
> way out (is it so ?) knowing that 2.6.32 is the latest kernel that I 
> found for my board.

Bug your provider about this issue. Tell them they should upgrade. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? |? ___? ? ? ? ? ? ? |
| +33 223 225 172 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? v? conspiracy.? |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120817/7614f7e6/attachment.html>
