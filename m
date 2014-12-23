From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:33:28 +0100
Subject: [Buildroot] [PATCH] liblinear: fix shared library build when
 -fPIC is required
In-Reply-To: <5fd89bc9217a91d4387f32dce95e557b4044ca17.1419270638.git.baruch@tkos.co.il>
References: <5fd89bc9217a91d4387f32dce95e557b4044ca17.1419270638.git.baruch@tkos.co.il>
Message-ID: <20141223113328.117b3951@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 22 Dec 2014 19:50:38 +0200, Baruch Siach wrote:
> Some architectures require building with -fPIC for shared libraries. -fPIC is
> present in upstream Makefile but we override CFLAGS when running make. Add
> -fPIC back when building shared libraries.
> 
> Fixes:
> http://autobuild.buildroot.net/results/5d6/5d63bf2f1af7977ff81116e767b399d4d0a30a99/
> http://autobuild.buildroot.net/results/47d/47d62d66c65cc77da9d48981ca6612257e616a90/
> http://autobuild.buildroot.net/results/c81/c816a0982733595438ed7ad90ae1231001c285cc/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/liblinear/liblinear.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
