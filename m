From: Sam Voss <sam.voss@gmail.com>
Date: Fri, 15 May 2020 21:35:02 -0500
Subject: [Buildroot] [PATCH] package/rustc: RUSTC_TARGET_NAME is needed
 to build host-rust
In-Reply-To: <20200508152739.1625844-1-romain.naour@gmail.com>
References: <20200508152739.1625844-1-romain.naour@gmail.com>
Message-ID: <CAK714xLFWo4YdRgz8XhO5BZDTbx4YSGxRHAdYxzV_Dk+WoB2Nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Fri, May 8, 2020 at 10:27 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> As reported on bugzilla [1], the host-rust package fail when
> the target architecture or the target libc is not supported.
>
> The error is the following:
> failed to parse TOML configuration 'config.toml': expected a table key, found a right bracket at line 15
>
> In such case BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is
> not set thus RUSTC_TARGET_NAME is also not set [2].
>
> But RUSTC_TARGET_NAME is needed to generate the file config.toml [3]
>
> Add BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS in the host-rust
> dependency.
>
> The commit [4] that allowed to select host-rust when the target
> architecture or the target libc is not supported, should have
> allowed to select only host-rustc-bin.

Thanks for fixing this, looks good to me.

>
> Fixes:
> Bug #12691
>
> [1] https://bugs.busybox.net/show_bug.cgi?id=12691
> [2] https://git.buildroot.net/buildroot/tree/package/rustc/rustc.mk?h=2020.05-rc1#n10
> [3] https://git.buildroot.net/buildroot/tree/package/rust/rust.mk?h=2020.05-rc1#n41
> [4] 025b863e6facb7b219b82ee6ee7a7916c2c3c47e
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: Sam Voss <sam.voss@gmail.com>
