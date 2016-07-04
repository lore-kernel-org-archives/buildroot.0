From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:02:45 +0200
Subject: [Buildroot] [PATCH v3 2/3] toolchain: add bfin support
In-Reply-To: <20160603040531.GA31560@waldemar-brodkorb.de>
References: <20160603040531.GA31560@waldemar-brodkorb.de>
Message-ID: <20160704110245.1c10806b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 06:05:31 +0200, Waldemar Brodkorb wrote:
> With gcc 6.1.0 and binutils 2.26 internal bfin toolchain
> can be used. A gcc patch is required, which was reported upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v2 -> v3:
>   - keep BR2_GCC_TARGET_CPU
> v1 -> v2:                                                                                                                                              
>   - remove conditional patch requested by Thomas Petazzoni
>   - do not enable BR2_GCC_TARGET_CPU, may be we can use
>     BR2_TARGET_CPU later for passing -mcpu= via CFLAGS
> ---
>  package/binutils/Config.in.host                |  6 ++++--
>  package/gcc/6.1.0/892-disable-dwarf-bfin.patch | 24 ++++++++++++++++++++++++
>  package/gcc/Config.in.host                     |  8 ++++----
>  package/uclibc/Config.in                       |  1 +
>  toolchain/Config.in                            |  1 -
>  5 files changed, 33 insertions(+), 7 deletions(-)
>  create mode 100644 package/gcc/6.1.0/892-disable-dwarf-bfin.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
