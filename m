From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 22 Oct 2019 11:56:48 -0500
Subject: [Buildroot] [External] Re: [PATCH] package/tslib: update to 1.21
In-Reply-To: <1ff346cc-4249-fbbd-0175-92529952c549@posteo.de>
References: <20191022091949.22076-1-martink@posteo.de>
 <CANQCQpaaNhV+8typawpbuQT4gtWoiRKnda13_sbtq8hwWWi+rQ@mail.gmail.com>
 <1ff346cc-4249-fbbd-0175-92529952c549@posteo.de>
Message-ID: <CANQCQpbE_LTrkPNpBhQJ8mpA4JvyUJcp4P7zWfYkqb3aWXzhWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,

On Tue, Oct 22, 2019 at 11:50 AM Martin Kepplinger <martink@posteo.de> wrote:
>
> On 22.10.19 16:16, Matthew Weber wrote:
> > Martin,
> >
> > On Tue, Oct 22, 2019 at 4:20 AM Martin Kepplinger <martink@posteo.de> wrote:
> >>
> >> The release page https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_libts_tslib_releases&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=Ngp4_uYTXTfXG5abdDlMsK1NcXc-7kXgpJQnFKZelho&s=K9j94bqjmJ0MCbF_HLdm0xgiz1frpRShPuwyRjFCaHE&e=  has the short
> >> changelog overview and we include the added plugin when building statically
> >> linked.
> >>
> >> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> >
> > Ran through a quick test-pkg set of 6 targets.
> >
> > Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
> >
> >> ---
> >>  package/tslib/tslib.hash | 4 ++--
> >>  package/tslib/tslib.mk   | 5 +++--
> >>  2 files changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
> >> index b250783fda..521e6c94bf 100644
> >> --- a/package/tslib/tslib.hash
> >> +++ b/package/tslib/tslib.hash
> >> @@ -1,5 +1,5 @@
> >> -# https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_libts_tslib_releases_download_1.20_tslib-2D1.20.tar.xz.sha256&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=Ngp4_uYTXTfXG5abdDlMsK1NcXc-7kXgpJQnFKZelho&s=o6x-2IgRTrGElL9dlVO1Lo4KLPvJu7goz_KFnGplffQ&e=
> >> -sha256  fda8c088e348b40cc68269460d562778aa4ad8f8c2281f147b09f305ba714777  tslib-1.20.tar.xz
> >> +# https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_libts_tslib_releases_download_1.21_tslib-2D1.21.tar.xz.sha256&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=Ngp4_uYTXTfXG5abdDlMsK1NcXc-7kXgpJQnFKZelho&s=Xl8wc75VFbueqX26vWL6rxFYYXw8mC3jip6hLHgmCHI&e=
> >> +sha256  d2a57b823ea59e53a3b130eef05dfed1190b857854f886eec764e1ca1957cf56  tslib-1.21.tar.xz
> >>
> >>  # Locally computed
> >>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
> >> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> >> index 6d6e85033b..3a1b7a2188 100644
> >> --- a/package/tslib/tslib.mk
> >> +++ b/package/tslib/tslib.mk
> >> @@ -4,7 +4,7 @@
> >>  #
> >>  ################################################################################
> >>
> >> -TSLIB_VERSION = 1.20
> >> +TSLIB_VERSION = 1.21
> >>  TSLIB_SITE = https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_libts_tslib_releases_download_-24-28TSLIB-5FVERSION-29&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=Ngp4_uYTXTfXG5abdDlMsK1NcXc-7kXgpJQnFKZelho&s=S7zyRy8o0QvYITOnH9BWuF0kRpYgBqArQ8DXrGbhTDM&e=
> >>  TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
> >>  TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
> >> @@ -28,7 +28,8 @@ TSLIB_CONF_OPTS += \
> >>         --enable-debounce=static \
> >>         --enable-skip=static \
> >>         --enable-lowpass=static \
> >> -       --enable-invert=static
> >> +       --enable-invert=static \
> >> +       --enable-evthres=static
> >
> > Was this found as a build issue or something for your use case of the pkg?
> >
>
> We just make sure the same library modules that we build dynamically are
> being built statically too. Does that answer your question?

Sure. I was just curious if this was a bug/improvement/build
failure/etc.  Sounds like it was a standing bug that wouldn't have
been noticed until you  go to use a static build.

Matt
