From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Jun 2010 21:41:41 +0200
Subject: [Buildroot] [PATCH v2] Add ffmpeg support
Message-ID: <1276544505-2969-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FFmpeg is a complete, cross-platform solution to record, convert and stream
audio and video. It includes libavcodec - the leading audio/video codec library.

This patchset adds support for building ffmpeg in buildroot.

Most high-level options are provided via kconfig options, and there is a hook
in the last commit to allow passing .configure any parameters not directly
supported (very handy for machine support, for example).

Note that this support is much more complete than the one in bug 401
(https://bugs.busybox.net/show_bug.cgi?id=401).

v2 includes improvements suggested by Peter Korsgaard.

Thanks,
Luca

ffmpeg: add new package
ffmpeg: add commandline programs
ffmpeg: allow customization of codecs, (de)muxers and other components
ffmpeg: add user-defined configure parameters

 package/multimedia/Config.in                       |    1 +
 package/multimedia/ffmpeg/Config.in                |  141 +++++++++++++++++++
 .../ffmpeg-0.5.2-fix-sdl-config-search.patch       |   17 +++
 package/multimedia/ffmpeg/ffmpeg.mk                |  143 ++++++++++++++++++++

Luca
