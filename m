From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:10:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: disable build of nvidia
	hardware acceleration support
In-Reply-To: <20170722151306.22870-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 22 Jul 2017 17:13:06 +0200")
References: <20170722151306.22870-1-bernd.kuhls@t-online.de>
Message-ID: <87inigxj51.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > ffmpeg always enables support for nvenc/cuda even if their support
 > libraries are not present:

 > External libraries providing hardware acceleration:
 > cuda cuvid nvenc
 > [...]
 > Enabled hwaccels:
 > h264_cuvid mjpeg_cuvid mpeg2_cuvid vc1_cuvid vp9_cuvid
 > hevc_cuvid mpeg1_cuvid mpeg4_cuvid vp8_cuvid

 > This leads to a crash in freeswitch git master when transcoding video
 > streams on a system without nvidia hardware:

 > 2017-07-22 15:06:27.306760 [INFO] avcodec.c:1077 initializing encoder 352x288
 > 2017-07-22 15:06:27.306760 [NOTICE] avcodec.c:828 NVENC HW CODEC ENABLED

 > This patch disables the support of nvidia hardware acceleration support
 > for now until the needed packages are added to buildroot. For details
 > about this please refer to https://developer.nvidia.com/ffmpeg

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
