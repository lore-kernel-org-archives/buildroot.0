From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 04 Aug 2014 20:13:25 +0200
Subject: [Buildroot] [PATCH 0/2] Fix pkg-kconfig infra (branch
	yem/kconfig)
In-Reply-To: <cover.1407172590.git.yann.morin.1998@free.fr>
References: <cover.1407172590.git.yann.morin.1998@free.fr>
Message-ID: <e6001c6d-be6d-4d79-8136-88979fc1ea29@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Hello All!
>
>This series fixes a nasty regression introduced with the pkg-kconfig
>infrastructure recently applied, whereby kconfig packages are always
>rebuilt on each 'make'.
>
>The proposed fix consists in a post-configure hook, and I believe this
>is enough to get us rolling for the next release.
>
>A better fix would be to move the call to 'oldocnifg' out of the
>packages, and into the kconfig infra itself, but this is a bit more
>involved. This could be done in -next (or maybe in master shortly after
>-rc1 if possible).

For uclibc, the oldconfig call is actually part of the fixup commands, so no problem there, right?

What if we do the same for busybox?

Best regards,
Thomas
