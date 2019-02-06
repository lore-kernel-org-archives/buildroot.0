From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Feb 2019 04:11:58 -0600
Subject: [Buildroot] [PATCH v5 2/3] openjdk: new package
In-Reply-To: <20190205143126.13857-2-aduskett@gmail.com>
References: <20190205143126.13857-1-aduskett@gmail.com>
 <20190205143126.13857-2-aduskett@gmail.com>
Message-ID: <CANQCQpZxPpFRUTWt_MZEYuMTiH0R0+ezvjndoFNDH4OM1+B2rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam.

On Tue, Feb 5, 2019 at 8:34 AM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
[snip]
> +OPENJDK_CONF_OPTS = \
> +       --disable-full-docs \
> +       --disable-hotspot-gtest \
> +       --disable-manpages \
> +       --disable-warnings-as-errors \
> +       --enable-headless-only \
> +       --enable-openjdk-only \
> +       --enable-unlimited-crypto \
> +       --openjdk-target=$(GNU_TARGET_NAME) \
> +       --prefix=$(TARGET_DIR)/usr \
> +       --with-boot-jdk=$(HOST_DIR) \
> +       --with-debug-level=release \
> +       --with-devkit=$(HOST_DIR) \
> +       --with-extra-cflags="$(TARGET_CFLAGS)" \
> +       --with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
> +       --with-extra-path=$(HOST_DIR)/bin:$(HOST_DIR)/sbin \
> +       --with-giflib=system \
> +       --with-jobs=$(PARALLEL_JOBS) \

Got a build failure where I suspect PARALLEL_JOBS might be a fault.
I'm dropping my core count and seeing if things succeed.

Here's the pastebin
https://pastebin.com/FNehyafY

Matt
