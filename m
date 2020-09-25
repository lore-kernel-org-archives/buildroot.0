From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2020 15:31:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-base:
 gl needs api, platform and window
In-Reply-To: <20200915204753.682027ce@windsurf.hq.k.grp> (Thomas Petazzoni's
 message of "Tue, 15 Sep 2020 20:47:53 +0200")
References: <20191112193756.32212-1-fontaine.fabrice@gmail.com>
 <20200915204753.682027ce@windsurf.hq.k.grp>
Message-ID: <871riq0yq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 12 Nov 2019 20:37:56 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Build will fail if gl is enabled without an api, a platform and a
 >> window:
 >> 
 >> Message: No OpenGL Platforms found or requested
 >> Message: No OpenGL Window systems found or requested
 >> 
 >> gst-libs/gst/gl/meson.build:948:2: ERROR: Problem encountered: GStreamer OpenGL integration required via options, but needed dependencies not found.
 >> 
 >> This requirement is already specified in Config.in through a simple
 >> comment:
 >> 
 >> comment "The opengl library needs an API, a platform and a window system"
 >> depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/d171059801adf8dea1a2116d7c729a2aa5767ac8
 >> - http://autobuild.buildroot.org/results/b1bfa505bba534440d331c4948eea5eb2d165c97
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> .../gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 11 +++++++----
 >> 1 file changed, 7 insertions(+), 4 deletions(-)

 > Thanks, I've applied to master, but I still think that the Config.in
 > file of this package needs some review/improvement of the OpenGL
 > handling. However, in the current situation, your patch indeed seemed
 > like the most immediate solution.

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
