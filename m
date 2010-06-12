From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 12 Jun 2010 18:22:37 +0200
Subject: [Buildroot] Add ffmpeg support
Message-ID: <1276359761-13721-1-git-send-email-luca@lucaceresoli.net>
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

Thanks,
Luca

ffmpeg: add new package
ffmpeg: add commandline programs
ffmpeg: allow customization of codecs, (de)muxers and other components
ffmpeg: add user-defined configure parameters

 CHANGES                                            |    2 +-
 package/multimedia/Config.in                       |    1 +
 package/multimedia/ffmpeg/Config.in                |  145 +++++++++++++++++++
 .../ffmpeg-0.5.2-fix-sdl-config-search.patch       |   17 +++
 package/multimedia/ffmpeg/ffmpeg.mk                |  150 ++++++++++++++++++++
 5 files changed, 314 insertions(+), 1 deletions(-)

Luca
