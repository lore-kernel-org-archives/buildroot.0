From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:42:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: add optional support
 for alsa-lib
In-Reply-To: <20170601203930.1069-1-bernd.kuhls@t-online.de>
References: <20170601203930.1069-1-bernd.kuhls@t-online.de>
Message-ID: <20170605144218.500921ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Jun 2017 22:39:29 +0200, Bernd Kuhls wrote:
> ffmpeg has optional support for alsa as input and/or output device:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=23823e3b7012d847b614bd43316fb614676bedb2;hb=refs/heads/release/3.3#l2987
> 
> Problem was found while fixing
> http://autobuild.buildroot.net/results/7ba/7ba485532fcab74928246a8f95dba7e5eea9d4a5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks. To be honest, I wasn't sure it was necessary
to repeat the alsa-lib logic twice. Maybe having it outside any
conditional would be sufficient.

But OK, since it's only repeated two times, I guess it's OK, and more
precise to have it done the way you proposed, which is why I applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
