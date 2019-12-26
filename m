From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 23:23:17 +0100
Subject: [Buildroot] [PATCH] package/at91bootstrap3: fix hash
In-Reply-To: <1577393383-29831-1-git-send-email-pjtexier@koncepto.io>
References: <1577393383-29831-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20191226232317.684ff7c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 21:49:43 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> When at91bootstrap3 was bumped to 3.9.0 in commit 513899e471890f4eb677066876890d43ea91b25e,
> an incorrect hash was set.
> 
> However, after some checks on the archive with the wrong hash, it appears that it is identical to
> the one with the good hash.
> 
> Fixes:
> 
> ERROR: at91bootstrap3-v3.9.0.tar.gz has wrong sha256 hash:
> ERROR: expected: 9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e
> ERROR: got     : e23e6df23b79ca81e412cb73a1f48bd95df8d46c7d52a1d073c2ed9d4f3a1a71
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Reported-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an improved commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
