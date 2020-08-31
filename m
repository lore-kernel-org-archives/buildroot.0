From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Mon, 31 Aug 2020 20:45:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: new package
In-Reply-To: <20200829224826.05bdb28b@windsurf.home>
References: <20200829082632.27414-1-egorenar-dev@posteo.net>
 <20200829224826.05bdb28b@windsurf.home>
Message-ID: <87d036vemc.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> As usual, we need an entry in the DEVELOPERS file.

Fixed.

>
> All those patches should have a description, Signed-off-by line, and be
> generated with git format-patch.
>

Fixed.

>
> Hum, this is not the best solution. Can we find something that works
> also for cross-compilation ?
>

Fixed.

>
> This one can be submitted upstream. Did you do it already?
>

Found a patch which has been submitted upstream but not yet released.

> I like that you're using $(PKG_CONFIG), but it's a bit annoying that
> you're dropping the systemctl usage because it makes the patch probably
> unsuitable for upstream. Should there be a way to avoid the systemctl
> usage if we're cross-compiling ?
>

Fixed.

>
> Not sure why this change is needed. Perhaps to support non-systemd
> situations ?
>

Fixed.

>
> This should be submitted upstream too.
>

Found a patch which has been submitted upstream but not yet released.


> So you need to replicate:
>
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>

Fixed.

>
> So you need to replicate:
>
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
>

Fixed.

>
> Is libaio directly used by multipath-tools, or just as a dependency of
> lvm2 ?
>

Directly.


>
> You also need to replicate:
>
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_USE_MMU # needs fork()
>         depends on !BR2_STATIC_LIBS # It fails to build statically
>

Fixed.

>
> And:
>
>         depends on !BR2_TOOLCHAIN_USES_MUSL
>

Fixed.

>
> This description is wrong.
>
> The upstream URL of the project at the end of the Config.in help text
> is missing.
>
> Hint: run "make check-package".
>
> You're also missing a Config.in comment about the dependencies.
>

Fixed.

>
> Could you take package/busybox/S01syslogd as a template for the init
> script ?
>

Done.

>
> In the Config.in file, you are selecting liburcu, libaio, but you don't
> have them as build dependencies here. Could you check that ?
>
> Also, since you're using pkg-config, you probably want host-pkgconf in
> the dependencies.
>

Fixed.

>
> An empty variable is quite useless.
>

Fixed.

>
> Could you try to use $(TARGET_CONFIGURE_OPTS) to pass CC, PKG_CONFIG,
> etc. ?
>

Fixed.


Thanks for take the time to review it.
Regards
Alex
