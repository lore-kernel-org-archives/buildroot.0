From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:41:40 +0100
Subject: [Buildroot] [PATCH 01/21 v2] core: do not accept multiple
 definitions of a package
In-Reply-To: <1996959fcee1f7bf71e9e8539fa2471fce6b1308.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <1996959fcee1f7bf71e9e8539fa2471fce6b1308.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <20151103234140.67e23821@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 22 Oct 2015 22:33:56 +0200, Yann E. MORIN wrote:
> One of the selling points for br2-external is to provide a mean to add
> new packages. However, it is not supported that a package be defined by
> Buildroot and then redefined in a br2-external tree.
> 
> This situation may occur without the user noticing or even willing to
> redefine the package, for example:
>   - br2-external is first created against a version of Buildroot
>   - a package (missing in Buildroot) is added to that br2-external tree
>   - upstream Buildroot adds this package
>   - user updates to the new Buildroot
> 
> In this case, the result in undefined, and we can't make any guarantee
> on the result (working or not).
> 
> Add a sanity check so that a package redefinition gets caught.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  Makefile               | 1 +
>  package/pkg-generic.mk | 9 +++++++++
>  2 files changed, 10 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
