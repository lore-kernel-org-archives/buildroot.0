From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 11:41:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] ffmpeg: fix neon support for aarch64
In-Reply-To: <20170414093026.32067-1-bernd.kuhls@t-online.de>
References: <20170414093026.32067-1-bernd.kuhls@t-online.de>
Message-ID: <20170414114132.4235ea1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 11:30:26 +0200, Bernd Kuhls wrote:
> ffmpeg ported arm 32-bit NEON code to aarch64 as hard dependency:
> http://ffmpeg.org/pipermail/ffmpeg-devel/2016-November/202733.html
> 
> Buildroot option BR2_ARM_CPU_HAS_NEON handles only the 32bit case:
> https://git.buildroot.net/buildroot/commit/?id=0976cd6cd64a128a2ac921e4f35f0e7cbe306692
> 
> For aarch64 we need to make sure to pass --enable-neon in order to
> prevent a link error, fixes
> 
> http://autobuild.buildroot.net/results/fa4/fa46003249664b1f97f6c18253c84cd3d6fb9cdb/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed if-clause (Thomas)
>     v1 "fixed" the problem as well by omitting --disable-neon,
>     ffmpeg then autodetected neon support ;)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
