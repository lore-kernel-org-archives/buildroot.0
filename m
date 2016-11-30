From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:09:38 +0100
Subject: [Buildroot] [PATCH next 1/4] lttng-tools: bump version to 2.9.0
In-Reply-To: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
References: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130220938.246d5b98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 17:04:42 +0000, Vicente Olivert Riera wrote:
> Drop sha256 hash. The combination of md5 and sha1 hashes is enough.
> 
> Remove upstream patches:
> 
>  - 0001-Fix-snapshot-del-output-with-name-on-musl.patch
>    https://github.com/lttng/lttng-tools/commit/07f5023712313d73ab3feac62390a2d50457b7aa
> 
>  - 0002-Fix-strerror_r-behavior-is-glibc-specific.patch
>    https://github.com/lttng/lttng-tools/commit/b6dacfe27a91af50a1f81a2a7eadf4f34ca75769
> 
>  - 0003-Set-thread-stack-size-to-ulimit-soft-value.patch
>    https://github.com/lttng/lttng-tools/commit/1a1a34b40ab10a195633b1ed5e2e9b42fdae0a78
> 
> Release notes:
>   https://lists.lttng.org/pipermail/lttng-dev/2016-November/026763.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...Fix-snapshot-del-output-with-name-on-musl.patch |  32 --
>  ...Fix-strerror_r-behavior-is-glibc-specific.patch |  30 --
>  ...et-thread-stack-size-to-ulimit-soft-value.patch | 431 ---------------------
>  package/lttng-tools/lttng-tools.hash               |   9 +-
>  package/lttng-tools/lttng-tools.mk                 |   2 +-
>  5 files changed, 4 insertions(+), 500 deletions(-)
>  delete mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
>  delete mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
>  delete mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch

All four applied to next. For the last patch, I was worried that CMake
might have been mandatory. But the configure script properly checks if
cmake is available or not, and apparently acts properly if it's not
available, so it looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
