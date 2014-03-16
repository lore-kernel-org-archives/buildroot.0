From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2014 19:43:13 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <5325D7A3.4090704@gigabyte.getmyip.com>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
 <20140316160712.GA3267@free.fr>
 <5325D7A3.4090704@gigabyte.getmyip.com>
Message-ID: <20140316184313.GA21975@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha?l, All,

Please, do not send HTML mails, they do not make it to the list.
HTML mail is frowned upon on this list.

On 2014-03-16 17:56 +0100, Micha?l Zweers spake thusly:
> Yann E. MORIN wrote:
> 
>  [v3,02/11] sunxi-mali: add explicit pthread/dl/rt dependencies
>  [1]http://patchwork.ozlabs.org/patch/278295
> 
>     Vote: C, unsure. There was no feedback on the reason why the change
>     was needed in the first place (Peter tested and it worked).
>
> When cross compiling Qt5 for Olinuxino A13 I needed to link every Opengl program to
> -ldl -lrt -lpthread otherwise they would die during init. The sunxi OpenGl (framebuffer) binary blops probably needs them to function properly.
> (From my error logs, may be incomplete i don't really remember):
> #0  0x00000000 in ?? () #1  0x4020a584 in __pthread_initialize_minimal_internal ()
>    from /lib/libpthread.so.0 #2  0x40208bec in _init () from /lib/libpthread.so.0
> #3  0x4000e0d0 in ?? () from /lib/ld-linux.so.3
> #4  0xbefffcac in ?? () (gdb)
>
> So A, keep :)

Can you share your .config, please, so we can try to reproduce your build
failure?

You are reporting the exact same synptoms as the original submitter, but
that does not help understand what the problem actually is.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
