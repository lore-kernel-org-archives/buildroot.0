From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Sep 2018 16:16:09 +0200
Subject: [Buildroot] [PATCH/next v3 3/7] package/gstreamer1/gst1-libav:
 Fix build with FFmpeg 4.0
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
 <20180825073118.14980-3-bernd.kuhls@t-online.de>
 <20180908232331.0a5a634b@windsurf.home>
Message-ID: <9imf6fxkgr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am Sat, 08 Sep 2018 23:23:31 +0200 schrieb Thomas Petazzoni:

>> +Downloaded from https://bugs.gentoo.org/654628#c11
> 
> I am a bit worried about this patch, see below.
> 
>> +-  params.padding = FF_INPUT_BUFFER_PADDING_SIZE;
>> ++  params.padding = AV_INPUT_BUFFER_PADDING_SIZE;
> 
> Is AV_INPUT_BUFFER_PADDING_SIZE defined in ffmpeg 3.x that we
> currently have ? If not, then this change is going to break the build.

Yes, it was added to ffmpeg 2.8 back in 2015:
http://git.videolan.org/?
p=ffmpeg.git;a=commitdiff;h=29d147c94dd40a78ca3981f39365cc77dae9a0da

>> ++#if 0
>> +   pspec = g_param_spec_float ("rc-qsquish", "Ratecontrol Limiting 
Method",
>> +       "0 means limit by clipping, otherwise use nice continuous 
function",
>> +       0, 99.0f, 1.0f, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
>> +   gst_ffmpeg_add_pspec (pspec, config.rc_qsquish, FALSE, mpeg, NULL);
>> ++#endif
> 
> Is it OK to just remove all this code ?

To get gst1-libav 1.14.2 compiled, yes, it seems so.

The alternative would be to bump gstreamer1 to its current git master 
branch like Debian did:

http://metadata.ftp-master.debian.org/changelogs//main/g/gst-libav1.0/gst-
libav1.0_1.15.0.1+git20180723+db823502-1_changelog

Regards, Bernd
