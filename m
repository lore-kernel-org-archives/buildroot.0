From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 17:49:09 +0100
Subject: [Buildroot] [PATCH v3 0/7] dtc: update and add raspberry pi
	overlay support
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150118164909.GS4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-01-13 20:40 +0100, Peter Seiderer spake thusly:
> There are two different dtb files used for raspberry pi booting:
> - overwrite the firmware provided videocore dtb configuration ([1])
> - linux kernel dtb configuration and dtb overlays ([2])

Well, I haven't yet tried to use overlays, but from what I understood,
DTB overlays can be handled seamlessly from the RPi bootloader:

    device_tree_overlay=path/to-overlay.dtb

So, is it really required that we do patch dtc for overlay support?

Instead, I would very much prefer we stick to what upstream dtc provide,
and when overlay support has been merged in there, we can bump our dtc
version (or backport just the overlay support if bumping is not
practical).

It would be very unmaintainable to bundle overlay support in Buildroot,
if upstream eventually decide to not support them, or decide to support
them in a very different way. We can not afford this, I'm afraid.

In the meantime, and that's unfortunate, we won't support overlays in
dtc... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
