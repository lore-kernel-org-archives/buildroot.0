From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 00:22:42 +0200
Subject: [Buildroot] [PATCH V3] sdl2: new package
In-Reply-To: <1435609819-22256-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <55381C91.30604@openwide.fr>
 <1435609819-22256-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <20150629222241.GF3669@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2015-06-29 22:30 +0200, Guillaume GARDET spake thusly:
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
> new file mode 100644
> index 0000000..c3f61f5
> --- /dev/null
> +++ b/package/sdl2/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_SDL2
> +	depends on !BR2_STATIC_LIBS
> +	bool "sdl2"
> +	help
> +	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
> +	  programs portable low level access to a video framebuffer,
> +	  audio output, mouse, and keyboard. It is not compatible with SDL1.
> +
> +	  http://www.libsdl.org/
> +
> +comment "sdl2 needs a toolchain w/ dynamic library"
> +        depends on BR2_STATIC_LIBS

Either you put that comment at the beginning of the file, or at the end,
not in the middle.

The reason is that Kconfig, when it detects a dependnecy chain between
two adjacent symbols, will render the second symbol indented below the
first, like so:

    config FOO
        bool "foo"

    config BAR
        boll "bar'
        depends on FOO

will be render in the menuconfig as:

    [*] foo
    [ ]   bar

To show that 'bar' is a sub-option of 'foo'.

If you put the comment in between FOO nad BAR, then you break the
"dependency chain" and the symbols will be rendred as:

    [*] foo
    [ ] bar

which is less than ideal.

[I haven't looked at the rest of the file, as I know about nothing about
sdl2]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
