From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:17:21 +0100
Subject: [Buildroot] [PATCH] polarssl: remove unmaintained
In-Reply-To: <20170316130434.26287-1-gustavo@zacarias.com.ar>
References: <20170316130434.26287-1-gustavo@zacarias.com.ar>
Message-ID: <20170318141721.4b6c5cc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Mar 2017 10:04:34 -0300, Gustavo Zacarias wrote:
> The 1.2.x branch is no longer maintained, so remove it since it's
> likely security-vulnerable.
> 
> mbedtls is the modern replacement which was renamed from polarssl when
> ARM bought them up.
> However major releases broke API so polarssl 1.2.x isn't always
> interchangeable with polarssl/mbedtls 1.3.x (interim mixed naming
> because of new ownership) or newer 2.x series.
> 
> Fortunately we don't have any package in the tree that uses polarssl
> exclusively.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy                                   |  9 +++++
>  package/Config.in                                  |  1 -
>  package/bctoolbox/Config.in                        |  3 +-
>  package/bctoolbox/bctoolbox.mk                     |  8 +----
>  package/polarssl/0001-no-test-suite.patch          | 27 ---------------
>  ...he-standard-CMake-flag-to-drive-the-share.patch | 39 ----------------------
>  package/polarssl/Config.in                         | 32 ------------------
>  package/polarssl/polarssl.hash                     |  2 --
>  package/polarssl/polarssl.mk                       | 32 ------------------
>  9 files changed, 11 insertions(+), 142 deletions(-)
>  delete mode 100644 package/polarssl/0001-no-test-suite.patch
>  delete mode 100644 package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
>  delete mode 100644 package/polarssl/Config.in
>  delete mode 100644 package/polarssl/polarssl.hash
>  delete mode 100644 package/polarssl/polarssl.mk

Applied to master, after fixing the two issues noticed by Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
