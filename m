From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 18:45:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: use pkg-config to get ssl
 dependencies
In-Reply-To: <20190326172704.11023-1-fontaine.fabrice@gmail.com>
References: <20190326172704.11023-1-fontaine.fabrice@gmail.com>
Message-ID: <20190326184552.119fd240@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Mar 2019 18:27:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> On some architectures, atomic binutils are provided by the libatomic
> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> /home/test/autobuild/run/instance-2/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): In function `CRYPTO_DOWN_REF':
> /home/test/autobuild/run/instance-2/output/build/libopenssl-1.1.1a/include/internal/refcount.h:50: undefined reference to `__atomic_fetch_sub_4'
> 
> This is often for example the case on sparcv8 32 bit.
> 
> To fix this issue, use pkg-config to retrieve openssl dependencies
> including atomic library, these dependencies must be passed to
> LIB_4_CRYPTO IN GIT_MAKE_OPTS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3093897d14a854a7252b25b2fa1f8fdcbb26c9b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/git/git.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
