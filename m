From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:11:28 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: hls: fix broken
 dependency
In-Reply-To: <1470305203-1738-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470305203-1738-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160805211128.0b02eda7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Aug 2016 15:36:43 +0530, Rahul Bedarkar wrote:
> HLS plugin can be built with nettle or libgcrypt or openssl
> cryptographic backend. But current dependency on gnutls is incorrect.
> It has been working so far because gnutls depends on nettle.
> 
> gst-plugins-bad's build system for HLS allows user to choose which
> cryptographic backend to use. If that is not specified, it internally
> checks for nettle or libgcrypt or openssl in order. If none of the
> cryptographic backend is available, HLS plugin gets disabled internally.
> 
> Select cryptographic backend according to which cryptographic packages
> are available. If both libgcrypt or openssl are not available, choose
> nettle by default.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in           |  2 +-
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 +++++++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
