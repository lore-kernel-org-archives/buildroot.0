From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 May 2019 18:36:41 +0300
Subject: [Buildroot] [PATCH 4/5] package/wpewebkit: bump to version
 2.24.1
In-Reply-To: <20190516190703.GC2441@scaer>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-5-aperez@igalia.com>
 <CAB0FRstZPttVSDYzYGih2nfdTdZ7UKuipDGPKWSaBJf6h_LVSw@mail.gmail.com>
 <20190515145239.GB9191@momiji> <20190515160530.234d9212@windsurf>
 <20190515211139.GB26229@momiji> <20190515195334.GA2441@scaer>
 <20190516001516.GB4444@momiji> <20190516190703.GC2441@scaer>
Message-ID: <20190517183641.GB32359@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 May 2019 21:07:03 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Adrian, All,
> 
> On 2019-05-16 00:15 +0300, Adrian Perez de Castro spake thusly:
> > On Wed, 15 May 2019 21:53:34 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > On 2019-05-15 21:11 +0300, Adrian Perez de Castro spake thusly:
> > > Well, as you said previously, what good is a browser without support for
> > > one of the most prominent image format on the web?
> > > But please note that openjpeg is a JPEG 2000 codec, not a JPEG one.
> > > JPEG 2000 is much less used on the web:
> > >     https://en.wikipedia.org/wiki/Comparison_of_web_browsers#Image_format_support
> > > Only Konqueror, Midori, Omniweb, and Safari are said to support it.
> > 
> > ?and now WebKitGTK, and WPE WebKit :)
> > 
> > With my WebKit maintainer hat on, let me tell you a short story.
> 
> /me sits by the fire and listens carefully to stories from the
> trenches... :-)

:-D

> > We have been forced to add support for JPEG2000 [1] because our user-agent is
> > similar to that of Safari (because? our WebKit ports *are* using the same Web
> > engine as Safari?there is no point denying it!) and a few sites started over
> > a year ago to send JPEG2000 images replies, then a few more, and then some.
> > At some point Akamai's Image Manager [2] started serving JPEG2000 images
> > transparently: the HTML references an URL ending in ?.png? (for example),
> > and Akamai will return a JPEG2000 in the response (with an appropriate
> > Content-Type HTTP header, of course). At this point, if we don't support
> > JPEG2000, a good chunk of popular websites will just look broken because
> > the images returned by popular CDNs or the websites themselves cannot be
> > decoded.
> > 
> > This above is what I meant with ?many websites will silently fail to
> > show images without [OpenJPEG support] enabled?.
> 
> So, from what you are saying, I understand that support for jpeg 2000
> *is* de facto mandatory.

That's 101% correct.

> > I hope this helps understand why I am so insistent in having the OpenJPEG
> > support enabled unconditionally: preventing that the Web is broken when
> > browsing with a WebKit-based browser.
> 
> Yes, I understand that. Thanks for the explanations.

No problem. If there's any other questions regarding WebKit, feel free to
send them my way.

> > The rationale why we have in the CMake build files in WebKit an ?USE_OPENJPEG?
> > build-time option is to disable it when configuring for distributions which
> > either a.) do not ship an OpenJPEG package, or b.) ship an old version that
> > does not include some new API that WebKit needs (example: Ubuntu LTS).
> > Buildroot does not fall into any of the categories above, and therefore I
> > would argue that either we use ?select? to depend unconditionally on OpenJPEG,
> > or ?imply? to choose it by default while still allowing to deselect it by
> > hand.
> 
> I would not even give the option to disable it. Given the size of
> openjpeg as compared to that of *webkit, there is not even the slightest
> reason to make it configurable (IMHO).

I also like this option, so I will do that for v2 of the patch set.

> > > Also, Thomas, please note that NetSurf does not support it eitther. ;-]
> > Then again, NetSurf does not have an user-agent close enough to a WebKit
> > one as to be served JPEG2000 images }:-)
> 
> That was a partially-private joke with Thomas, as he is keen on removing
> netsurf after having lost countless hair trying to fix it. ;-)

Hehe, I figured :-]

> > I hope that my little store above might help you change your mind, if
> > only a little bit :-)
> 
> Yes, I changed my mind, from a conditional to mandatory dependency. ;-)
> Sorry, still no imply for me! ;-)

Well, imply or not imply... at least we have now an agreement on how to
go ahead with this. Thanks for your feedback!

?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190517/6bd3828a/attachment.asc>
