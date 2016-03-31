From: Romain Izard <romain.izard.pro@gmail.com>
Date: Thu, 31 Mar 2016 14:13:40 +0200
Subject: [Buildroot] [PATCH v3 3/3] core/pkg-kconfig: Use olddefconfig
	when possible
In-Reply-To: <1459414674-30753-4-git-send-email-romain.izard.pro@gmail.com>
References: <1459414674-30753-1-git-send-email-romain.izard.pro@gmail.com>
 <1459414674-30753-4-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <CAGkQfmNR_X0YPhWRQfvJemm8Xofm3Z0umn2O7dewJ6rkqbCnNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-03-31 10:57 GMT+02:00 Romain Izard <romain.izard.pro@gmail.com>:
> Using 'yes "" | make oldconfig' to regenerate a .config file from an
> existing defconfig does not work reliably in all cases. Specifically, it
> does not work well with tristate choice entries.
>
> The correct way to do it is to use 'make olddefconfig', but this target
> is not supported in projects that use an old version of kconfig. As
> most projects do not use tristate entries, there is no need for them to
> upgrade.
>
> 'oldnoconfig' is an alias for 'olddefconfig', but it also is the only
> name for this target between Linux versions 2.6.36 and 3.6.
>
> Try to use 'oldnoconfig' by default, using 'oldconfig' as a fallback
>

This one is an error, please use the correct version of patch #3.

-- 
Romain Izard
