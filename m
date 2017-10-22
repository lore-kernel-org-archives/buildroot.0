From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:37:08 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: fix build without wchar
In-Reply-To: <217c4b97cdb72c68b7d6d669b1c3cbb9b47bf4ad.1508242375.git.baruch@tkos.co.il>
References: <217c4b97cdb72c68b7d6d669b1c3cbb9b47bf4ad.1508242375.git.baruch@tkos.co.il>
Message-ID: <20171022143708.456a666d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 15:12:55 +0300, Baruch Siach wrote:
> GCC defines wchar_t even when wchar support is disabled in uClibc. The
> LTC_NO_WCHAR macro triggers a local definition of wchar_t that conflicts
> with the GCC defined one. Remove LTC_NO_WCHAR to avoid that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/895/895452ac973cab0e0bc22636d39cbec7fbf598d3/
> http://autobuild.buildroot.net/results/c82/c82d0173878e58f7192d3cec271b45763e6ea269/
> http://autobuild.buildroot.net/results/83f/83f433bcb608b341fca2180afa57fc81495bc3b4/
> 
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libtomcrypt/libtomcrypt.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master after updating the autobuilder reference to a result
that we still have in the database, and adding a reference to the
interesting Github discussion.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
