From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Nov 2020 00:18:00 +0100
Subject: [Buildroot] [ISSUE] webkitgtk/webkitgtk.mk
In-Reply-To: <CANVomh9b1fBc6vzrqjttcFijQP3Pi6tFSRkWKWgpPrhh6MZa1g@mail.gmail.com>
References: <CANVomh9b1fBc6vzrqjttcFijQP3Pi6tFSRkWKWgpPrhh6MZa1g@mail.gmail.com>
Message-ID: <20201110001800.47d64dcc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cerezo,

On Sun, 8 Nov 2020 21:07:57 +0000, C Larbi <pkl2000us@gmail.com> wrote:

> Compiling webkitgtk for a raspberrypi4 target using busybox as init throws
> a "requires systemd" error at configuration stage
>
> was solved adding command to configuration options in webkitgtk.mk:
>
> WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
> 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
> 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
> WEBKITGTK_CONF_OPTS = \
> 	-DENABLE_API_TESTS=OFF \
> 	-DENABLE_GEOLOCATION=OFF \
> 	-DENABLE_GTKDOC=OFF \
> 	-DENABLE_INTROSPECTION=OFF \
> 	-DENABLE_MINIBROWSER=ON \
> 	-DENABLE_SPELLCHECK=ON \
> 	-DPORT=GTK \
> +       *-DUSE_SYSTEMD=OFF \*
> 	-DSILENCE_CROSS_COMPILATION_NOTICES=ON \
> 	-DUSE_LIBNOTIFY=OFF \
> 	-DUSE_LIBHYPHEN=OFF \
> 	-DUSE_OPENJPEG=ON \
> 	-DUSE_WOFF2=ON \
> 	-DUSE_WPE_RENDERER=OFF
>

Thanks for the bug report and the suggested fix, feel free
to test the suggested patches [1] and [2]...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201109231356.32230-1-ps.report at gmx.net/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20201109231356.32230-2-ps.report at gmx.net/

> regards
> Cerezo
