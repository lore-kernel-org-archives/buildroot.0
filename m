From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Mar 2018 21:09:19 +0200
Subject: [Buildroot] RFC: gst1-plugins-good 1.14: enable-qt config option
In-Reply-To: <f148b224-5d1d-de86-91fe-13379549cd6a@ginzinger.com>
References: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
 <f148b224-5d1d-de86-91fe-13379549cd6a@ginzinger.com>
Message-ID: <d156a4f7-16d3-bc44-ed3d-dc3de048e3ce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-03-18 16:22, Martin Kepplinger wrote:
> TL;DR so far: How to configure in gstreamer-gl-1.0 ? see below.
> 
> On 2018-03-27 10:57, Martin Kepplinger wrote:
>> So the goal here is to optionally get gst1-plugins-good's qt module to
>> be built (and have the qmlglsink gstreamer element) with Qt and eglfs
>> platform.
[snip]
> So HAVE_QT_WINDOWING is never set to yes, which means
> GST_GL_HAVE_PLATFORM_EGL is not set to 1 :(
> 
> Well, this is set to 1, if the following string contains "egl":
>  GST_GL_PLATFORMS=`$PKG_CONFIG --variable=gl_platforms gstreamer-gl-1.0`
> 
> So I indeed also find:
> 
> checking for GST_GL... no
> 
> configure: Package gstreamer-gl-1.0 was not found in the pkg-config
> search path.
> Perhaps you should add the directory containing `gstreamer-gl-1.0.pc'
> 
> to the PKG_CONFIG_PATH environment variable
> 
> Package 'gstreamer-gl-1.0', required by 'world', not found
> 
> 
> So: How can I build this gstreamer-gl-1.0 library?
> https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-plugins-base-libs/html/gl.html

 I don't have good internet access now to check, but my guess is that there is a
(new?) --enable-gl option in gst1-plugins-base that we should add.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
