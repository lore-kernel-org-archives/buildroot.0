From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 16 Jan 2019 17:08:43 -0600
Subject: [Buildroot] [PATCH] package/gst1-plugins-bad: fix build with
 fdk-aac 2.0
In-Reply-To: <87d0ow9r9y.fsf@dell.be.48ers.dk>
References: <20190116214849.13417-1-peter@korsgaard.com>
 <CAMQcK5Jdu8rob8AjStcjdW4V3vJ8jY+7JzSvxVXvgMY7b10now@mail.gmail.com>
 <87d0ow9r9y.fsf@dell.be.48ers.dk>
Message-ID: <CAMQcK5KdCYknWemFYDmzJavLh=u3aaPdGu-iX3zK5zT04FrBVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 16, 2019 at 4:22 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:
>
>  > Peter,
>  > On Wed, Jan 16, 2019 at 3:49 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >>
>  >> Fixes:
>  >> http://autobuild.buildroot.net/results/343/343249ab34ab77be3b8077f544b9d1e2d4852796/
>  >> http://autobuild.buildroot.net/results/edc/edca961f2c4d1946385ac86a756308caaf22d79d/
>  >>
>  >> Fdk-aac 2.0 dropped some legacy APIs, breaking the build of the fdk-aac
>  >> plugin.  Add two upstream upstream patches to fix building against fdk-aac
>  >> 2.0.
>  >>
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >>
>  >> +++ b/package/gstreamer1/gst1-plugins-bad/0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch
>  >> @@ -0,0 +1,47 @@
>  >> +From 19d34f6b5e1633d5ec4bb2832c58470f0c829cab Mon Sep 17 00:00:00 2001
>  >> +From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
>  >> +Date: Wed, 5 Dec 2018 10:10:39 +0100
>  >> +Subject: [PATCH] fdkaacdec: Use WAV channel mapping instead of interleave
>  >> + setting
>  >> +
>  >> +The latter is going away in libfdk-aac 2.0.0. Instead, MPEG-style output
>  >> +is always non-interleaved and WAV-style output is always interleaved.
>  >> +Earlier libfdk-aac also defaults interleaving accordingly.
>  >> +
>  >> +Since our reordering looks at the associated PCE indices instead of the
>  >> +actual channel order, we're agnostic to the mapping.
>  >> +
>  >> +For https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/issues/825
>
>  > Minor nit - missing your "Signed-off-by" line here.
>
> Ups, indeed - I'll fix that when applying, thanks.
>
> I also didn't see your Reviewed-by in your reply :P

Here you go :)

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>


>
> --
> Bye, Peter Korsgaard
