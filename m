From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 10:32:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: build on arm64
In-Reply-To: <20201017082525.GF3466@scaer>
References: <20201017011356.50029-1-aman@tmm1.net>
 <20201017082525.GF3466@scaer>
Message-ID: <20201017083210.GG3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aman, All,

[sorry, I hit 'send' too early; see more review below...]

On 2020-10-17 10:25 +0200, Yann E. MORIN spake thusly:
> On 2020-10-16 18:13 -0700, Aman Karmani spake thusly:
> > Parts of the userland (such as `vcgencmd`) are now usable on aarch64
> This has already been proposed a few times already (review all the
> messages in those threads):
> 
>     http://lists.busybox.net/pipermail/buildroot/2020-August/289559.html
>     http://lists.busybox.net/pipermail/buildroot/2020-January/271577.html
> 
> There, it was pointed out that the set of libraries instaleld on AArch64
> is different from AArch32, and most notably "no libegl, libgles,
> libopenmax, libopenvg" are built and installed.
> 
> This means that rpi-userland couldn't be an EGL or GLES or OPENMAX
> provider when building for AArch64.
> 
> Has that situation improved now?

If the situation is better now, then please address that in the commit
log. If not, please see the the aforementioned threads for suggested
improvements (like making the EGL/GLES/OPENMAX provider conditional).

Please note that there is one big question, about libfdt, in one of
those threads, which must be addressed too (although it does not seem to
be AArch64-related?).

For now, I've marked this patch as changes requested.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
