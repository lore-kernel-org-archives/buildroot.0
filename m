From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 14:32:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpg123: fix static linking
 issue with alsa
In-Reply-To: <1446986201-24074-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446986201-24074-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151108143238.1b9324f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  8 Nov 2015 13:36:41 +0100, Bernd Kuhls wrote:
> As opposed to the other audio backends, the configure script does NOT
> use pkg-config to figure out how to link with alsa, breaking static
> linking as alsa uses pthreads.
> 
> This patch uses the same fix from Peter used for portaudio:
> http://git.buildroot.net/buildroot/commit/package/mpg123/mpg123.mk?id=dea306c78b5d4c571555c50512e212a725b594b9
> 
> Fixes
> http://autobuild.buildroot.net/results/796/79613fda3f51e969ecd46ae1151bd4c3316639c3/
> http://autobuild.buildroot.net/results/b0a/b0a99ff1516602ed42c0cc14d9d2922a01cdf88f/
> http://autobuild.buildroot.net/results/5bd/5bdfd2aa9de568d0f7be27ffb18d4541b0e1be0c/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpg123/mpg123.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
