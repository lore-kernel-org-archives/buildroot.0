From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 30 Sep 2011 13:53:58 +0200
Subject: [Buildroot] [git commit] gst-plugins-base: bump version
In-Reply-To: <20110929190333.7F3E78DBD5@busybox.osuosl.org>
References: <20110929190333.7F3E78DBD5@busybox.osuosl.org>
Message-ID: <1317383828.15482.1.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-09-29 at 16:42 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=def45ab622f942c9639ebe1ede79ac4dd590d8fb
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> index 79ced30..a260f89 100644
> --- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> +++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> @@ -3,7 +3,7 @@
>  # gst-plugins-base
>  #
>  #############################################################
> -GST_PLUGINS_BASE_VERSION = 0.10.32
> +GST_PLUGINS_BASE_VERSION = 0.10.35

After this update gst-plugins-base does not any longer compile for me.
It bails out when trying to link testchannels:

Making all in audio
make[5]: Entering directory `/home/sven/git/buildroot/output/build/gst-plugins-base-0.10.35/gst-libs/gst/audio'
  GEN    audio-enumtypes.c
  GEN    audio-enumtypes.h
/usr/bin/make  all-am
make[6]: Entering directory `/home/sven/git/buildroot/output/build/gst-plugins-base-0.10.35/gst-libs/gst/audio'
  CC     libgstaudio_0.10_la-audio.lo
  CC     libgstaudio_0.10_la-gstringbuffer.lo
  CC     libgstaudio_0.10_la-gstaudioclock.lo
  CC     libgstaudio_0.10_la-mixerutils.lo
  CC     libgstaudio_0.10_la-multichannel.lo
  CC     libgstaudio_0.10_la-gstbaseaudiosink.lo
gstbaseaudiosink.c: In function 'gst_base_audio_sink_get_alignment':
gstbaseaudiosink.c:1358: warning: unused variable 'diff_s'
  CC     libgstaudio_0.10_la-gstbaseaudiosrc.lo
  CC     libgstaudio_0.10_la-gstaudiofilter.lo
  CC     libgstaudio_0.10_la-gstaudiosink.lo
  CC     libgstaudio_0.10_la-gstaudiosrc.lo
  CC     libgstaudio_0.10_la-audio-enumtypes.lo
  CCLD   libgstaudio-0.10.la
  CC     testchannels-testchannels.o
  CCLD   testchannels
/home/sven/git/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
/home/sven/git/buildroot/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: warning: libgstinterfaces-0.10.so.0, needed by ./.libs/libgstaudio-0.10.so, not found (try using -rpath or -rpath-link)
./.libs/libgstaudio-0.10.so: undefined reference to `gst_property_probe_get_type'
./.libs/libgstaudio-0.10.so: undefined reference to `gst_mixer_list_tracks'
./.libs/libgstaudio-0.10.so: undefined reference to `gst_property_probe_get_property'
./.libs/libgstaudio-0.10.so: undefined reference to `gst_mixer_get_type'
./.libs/libgstaudio-0.10.so: undefined reference to `gst_property_probe_probe_and_get_values'
collect2: ld returned 1 exit status


Sven
