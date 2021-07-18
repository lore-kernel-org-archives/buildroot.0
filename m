From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:39:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.52.1
In-Reply-To: <20210529083710.2471632-1-fontaine.fabrice@gmail.com>
References: <20210529083710.2471632-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718223909.284ad634@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Fabrice,

On Sat, 29 May 2021 10:37:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This release disables incremental compilation, unless the user has
> explicitly opted in via the newly added RUSTC_FORCE_INCREMENTAL=1
> environment variable.
> 
> This is due to the widespread, and frequently occuring, breakage
> encountered by Rust users due to newly enabled incremental verification
> in 1.52.0.
> 
> https://github.com/rust-lang/rust/blob/1.52.1/RELEASES.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash | 96 +++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |  2 +-
>  package/rust/rust.hash         |  6 +--
>  package/rust/rust.mk           |  2 +-
>  4 files changed, 53 insertions(+), 53 deletions(-)

Thanks, but it does not apply to master. It seems that your patch isn't
based on top of d69d40c029dc7d8199b745eaee759d92b66c5d17 (from May 18).
Could you refresh your patch? You will have to update a significant
number of additional hashes in rust-bin.hash.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
