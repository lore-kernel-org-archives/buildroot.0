From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 16:46:25 +0200
Subject: [Buildroot] [PATCH 5 of 5 RFC] busybox: update-config: preserve
 freshly configured settings
In-Reply-To: <b84b5b9c-4658-449d-a6cf-005a0e2373a1@email.android.com>
References: <patchbomb.1403444739@localhost>
 <7e80ee0110a2066c2afe.1403444744@localhost>
 <20140622141416.GF3509@free.fr>
 <b84b5b9c-4658-449d-a6cf-005a0e2373a1@email.android.com>
Message-ID: <20140622144625.GG3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 16:22 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >On 2014-06-22 15:45 +0200, Thomas De Schampheleire spake thusly:
> >> In the sequence:
> >> 
> >> make busybox-menuconfig
> >> make busybox-update-config
> >> 
> >> the freshly configured settings from the menuconfig are lost during the
> >> update-config step. This is because update-config depends on the configure
> >> step, which starts by copying the config file to the build directory.
> >> 
> >> Instead, stop depending on the configure step from update-config, and
> >> explicitly call the needed commands before actually copying the config file.
> >> 
> >> This has the added bonus that 'busybox-update-config' no longer needs the
> >> toolchain to be available, which makes:
> >>     make clean busybox-menuconfig busybox-update-config
> >> much faster and user-friendly.
> >> 
> >> This is a corrolary of bug #7154 https://bugs.busybox.net/show_bug.cgi?id=7154
> >> 
> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[--SNIP--]
> Thanks for the review and tests. So it seems you are fine with the approach?

It looks Ok to me. We do need these new behaviours.

As for the code, I only marked it Reviewed-by for what it means. I am
not not sure enough to mak it Acked-by, although I don't see a better
way to do it. Thomas and Peter have a better understanding on all this
stuff, so I'll leave the last call to them. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
