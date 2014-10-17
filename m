From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:03:52 +0200
Subject: [Buildroot] qemu compiling error
In-Reply-To: <543E62FE.4040803@mind.be>
References: <543E3CBC.5080901@free.fr>
 <543E62FE.4040803@mind.be>
Message-ID: <20141017220352.GO3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-10-15 14:05 +0200, Arnout Vandecappelle spake thusly:
> On 15/10/14 11:22, St?phane ANCELOT wrote:
> > git compiling I have got target list unknown error
> 
>  Please read the section in the manual about submitting bug reports: you should
> give us the result of 'make savedefconfig' and which buildroot version you're using.
> 
>  However, in this case it happens to be obvious from the output, because the
> error message is right there:
> 
> [snip]
> > ERROR: Unknown target name 'i386-softmmu'
> 
>  You gave i386-softmmu as the target name (configuration variable
> BR2_PACKAGE_QEMU_CUSTOM_TARGETS) but that doesn't exist. You probably want to
> set it to i386.

Nope, i386-softmmu is the correct setting. It;s just a bug in the
package I submitted. I already talked to Peter about this, and the fact
that it used to work in the past (series is roughly 2.5 years old now),
but I only comnfigured it with all emulations now, so did not notice
this breakage.

Fix done, pending, ETA: this week-end.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
