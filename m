From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 09:35:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/gstreamer/gst-plugins-base:
 Fix build on x86 if emmintrin.h is available but can't be used
In-Reply-To: <87y4b49ljj.fsf@dell.be.48ers.dk>
References: <1454177927-13601-1-git-send-email-bernd.kuhls@t-online.de>
 <87y4b49ljj.fsf@dell.be.48ers.dk>
Message-ID: <56B06A36.60505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 22:18, Peter Korsgaard wrote:
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
[snip]
> > diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
>  > index e1374ed..902ee05 100644
>  > --- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
>  > +++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
>  > @@ -7,6 +7,8 @@
>  >  GST_PLUGINS_BASE_VERSION = 0.10.36
>  >  GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
>  >  GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
>  > +GST_PLUGINS_BASE_PATCH = \
>  > +  
>  http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-base0.10/sse.patch
>
> Thanks, but I'm not too happy about these git.alphinelinux.org
> downloads as:
>
> - We have no guarantees that the URL stays valid (E.G. doesn't specify
>   any git version).
>
> - The filename is very generic (sse.patch), so we end up with that on
>   sources.buildroot.net and basically have to keep it "forever".
>
> As these patches are very small and already in upstream git I have
> instead picked them (it turned out the alphinelinux patch was a squash
> of two commits) from the upstream git repo and added them in buildroot.

 Hi Bernd,

 I told you earlier that we prefer to download patches rather than include them
in Buildroot, but I was wrong about that, sorry. It seems we (= Peter :-) only
prefer to download patches when they're really large.

 Again, sorry for misinforming you.

 Regards,
 Arnout


>
> Committed with that fixed, thanks.
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
