From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:28:42 +0100
Subject: [Buildroot] [PATCH v2] ffmpeg: fix build for xtensa
In-Reply-To: <3eaba734f6632e37ccac0e80e8326761c29075ee.1387963458.git.baruch@tkos.co.il>
References: <3eaba734f6632e37ccac0e80e8326761c29075ee.1387963458.git.baruch@tkos.co.il>
Message-ID: <20131225122842.4d07677e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 25 Dec 2013 11:24:18 +0200, Baruch Siach wrote:
> The ffmpeg package generates libraries that are too large for the xtensa
> default placement of literals in a dedicated section. Use
> -mtext-section-literal to place literals in the text section.
> 
> Fixes
> http://autobuild.buildroot.net/results/606/60670d35f16c3b8fe19debf7f8e40a046a579520/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>     Use FFMPEG_CFLAGS as intermediate variable (Thomas Petazzoni)
> ---
>  package/ffmpeg/ffmpeg.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
