From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 16:43:01 +0200
Subject: [Buildroot] [PATCH 1/1] tinycbor: new package
In-Reply-To: <1469435859-25918-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469435859-25918-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160730164301.329de917@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 10:37:39 +0200, Fabrice Fontaine wrote:
> Concise Binary Object Representation (CBOR) Library
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/Config.in              |  1 +
>  package/tinycbor/Config.in     | 20 ++++++++++++++++++++
>  package/tinycbor/tinycbor.hash |  2 ++
>  package/tinycbor/tinycbor.mk   | 38 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 61 insertions(+)
>  create mode 100644 package/tinycbor/Config.in
>  create mode 100644 package/tinycbor/tinycbor.hash
>  create mode 100644 package/tinycbor/tinycbor.mk

This package is causing two types of build failures:

 * On Blackfin only:

   http://autobuild.buildroot.net/?reason=tinycbor-v0.3.1&arch=bfin

   The Blackfin external toolchain uses gcc 4.3, which is pretty old.
   The error occurs on unnamed unions, maybe there's a problem with
   that. But
   https://gcc.gnu.org/onlinedocs/gcc-4.3.2/gcc/Unnamed-Fields.html
   seems to indicate it was already supported in gcc 4.3. More
   investigation is needed.

 * On other architectures, a problem occurs when
   output/target/usr/lib/libtinycbor.a is created as a directory, for
   some reason:

   http://autobuild.buildroot.net/results/760/7605c301f460398c2435f6b73d6d07c7d1022e8c/build-end.log

Could you look into those issues?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
