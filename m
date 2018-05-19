From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 13:47:39 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.60.0
In-Reply-To: <c80a6fad0f71e02beda054135fc6e2e2f4ed2a0f.1526612436.git.baruch@tkos.co.il>
References: <c80a6fad0f71e02beda054135fc6e2e2f4ed2a0f.1526612436.git.baruch@tkos.co.il>
Message-ID: <20180519134739.69d2d28f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 May 2018 06:00:36 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> This release fixes the security issues listed below.
> 
> CVE-2018-1000300: curl might overflow a heap based memory buffer when
> closing down an FTP connection with very long server command replies.
> 
>   https://curl.haxx.se/docs/adv_2018-82c2.html
> 
> CVE-2018-1000301: curl can be tricked into reading data beyond the end
> of a heap based buffer used to store downloaded content.
> 
>   https://curl.haxx.se/docs/adv_2018-b138.html
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-openssl-fix-build-with-LibreSSL-2.7.patch | 75 -------------------
>  package/libcurl/libcurl.hash                  |  4 +-
>  package/libcurl/libcurl.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 78 deletions(-)
>  delete mode 100644 package/libcurl/0001-openssl-fix-build-with-LibreSSL-2.7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
