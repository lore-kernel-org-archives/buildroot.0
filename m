From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:34:34 +0100
Subject: [Buildroot] [PATCH v3,
 1/3] package/sysrepo: link with libatomic when needed
In-Reply-To: <20191031131507.1936-1-fontaine.fabrice@gmail.com>
References: <20191031131507.1936-1-fontaine.fabrice@gmail.com>
Message-ID: <20191031223434.7fbe5d31@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Oct 2019 14:15:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> On some architectures, atomic binutils are provided by the libatomic
> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libsysrepo.so.0.7.8: undefined reference to `__atomic_fetch_add_4'
> 
> This is often for example the case on sparcv8 32 bit.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d807f3dc922a61e099a66de3bc340c018a86e150
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sysrepo/sysrepo.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
