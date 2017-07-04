From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 13:32:16 +0200
Subject: [Buildroot] [PATCH v2 next 05/11] gst1-plugins-bad: bump
	version to 1.12.0
In-Reply-To: <20170512101807.42378-5-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Fri, 12 May 2017 11:18:01 +0100")
References: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
 <20170512101807.42378-5-Vincent.Riera@imgtec.com>
Message-ID: <87a84k4ev3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Remove non-existant configure options:
 >   --disable-mimic:
 >     https://github.com/GStreamer/gst-plugins-bad/commit/ad661999ad2c79a5d7721f0eb1e7f1f83a304224

 >   --enable-dataurisrc:
 >     https://github.com/GStreamer/gst-plugins-bad/commit/de4bb6e1d4793637fd72d7316d06ebba4148583e

 >   --enable-videomeasure:
 >     https://github.com/GStreamer/gst-plugins-bad/commit/ca3020cf46d49d8e3fd54ec323b3a17cd389d780

 >   --enable-apexsink, --disable-nas, --disable-linsys, --enable-sdl,
 >   --disable-sdltest, --disable-libvisual, --disable-timidity,
 >   --disable-sndio, --disable-wininet, --disable-xvid,
 >   --enable-cdxaparse, --enable-dccp, --enable-hdvparse, --enable-mve,
 >   --enable-nuvdemux, --enable-patchdetect, --enable-sdi, --enable-tta,
 >   --disable-pvr:
 >     https://github.com/GStreamer/gst-plugins-bad/commit/9b5de053995488d5ddc78c1bf4df651101271d70

 > Fix wrong configure options:

 >   --disable-webrtc doesn't exist. The right option is called
 >   --disable-webrtcdsp, and the gstreamer plugin is also called
 >   webrtcdsp, so make the appropriate changes to Config.in and
 >   gst1-plugins-bad.mk.

This is not related to the version bump, so I've split this out to a
separate commit.

 
 >  ###############################################################################
 > +comment "Legacy options removed in 2017.08"
 > +
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE
 > +	bool "cdxaparse removed"
 > +	select BR2_LEGACY
 > +
 > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC
 > +	bool "dataurisrc removed"
 > +	select BR2_LEGACY

dataurisrc has in fact moved to gstreamer1 and it is always built, so
I've tweaked the prompt added help text.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
