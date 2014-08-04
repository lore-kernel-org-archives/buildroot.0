From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 04 Aug 2014 19:32:59 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: do not rebuild
	kconfig packages again and again
In-Reply-To: <fb48537ba04cc50d1f8043e5e347dedcdd5ba671.1407172590.git.yann.morin.1998@free.fr>
References: <cover.1407172590.git.yann.morin.1998@free.fr><cover.1407172590.git.yann.morin.1998@free.fr>
 <fb48537ba04cc50d1f8043e5e347dedcdd5ba671.1407172590.git.yann.morin.1998@free.fr>
Message-ID: <9846dd33-c6e6-4753-b275-e10d957f0e23@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>When a kconfig-based package executes its confiigure step, it may

configure

>overwrite it .config file. Thus, the .config file is more recent than

its

>our stamp file .stamp_kconfig_fixup_done. On a subsequent build, out

our

>dependency rules would kick in, and run the config fixup again, thus
>kikcing in the package's configure, build and isntall steps yet once

kicking
install

>more, that, ad libitum.

You mean 'ad infinitum' ?

>
>Fix that by introducing a post-configure hook that re-touches our stamp
>file, so it is always more recent than the .config.

Could you share an example of which package does what type of change to the .config?

Thanks!
Thomas
