From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Mon, 6 Jan 2014 12:48:05 +0200
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline
	January 5)
In-Reply-To: <CAAXf6LUnqAYQZoQ9-npV0nyDezec__sfnZrvYJY0PouNujE3HQ@mail.gmail.com>
References: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
 <CAAXf6LVVi6d=xRjsqW8eSMAf1CpKyU-qUTQ2dbfCPU=EF__jcA@mail.gmail.com>
 <20140106130503.2df2a9ef@skate>
 <CAAXf6LUnqAYQZoQ9-npV0nyDezec__sfnZrvYJY0PouNujE3HQ@mail.gmail.com>
Message-ID: <CAKu+J9340tMY2TfLwfJdh8Et=5ASJgxf4B4n_MYW0Z8u+yTbZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Regarding the http://patchwork.ozlabs.org/patch/207431 patch.
GStreamer switched from ffmpeg to libav a while ago and newer versions
don't have the ffmpeg package.
http://gstreamer.freedesktop.org/releases/gst-libav/0.11.90.html
http://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-1.x-README.txt

gst-ffmpeg was last updated almost two years ago.

Even though irrelevant, the situation of ffmpeg and libav is explained here:
http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html

The patch was used in production so it's tested.

I think it would be a step back if this patch is discarded.

Best regards,
Bogdan


On Mon, Jan 6, 2014 at 12:16 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Thomas,
>
> On Mon, Jan 6, 2014 at 6:05 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> >> > [07/10] libffi: make thread support optional
> >> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >> > http://patchwork.ozlabs.org/patch/199883
> >>
> >> No feedback, marked as rejected.
> >
> > It's weird because I don't see libffi build failures in the
> > autobuilders, even though there is one no thread ARM toolchain in the
> > configurations.
> >
>
> It's weird indeed, maybe this has been changed in a newer version of
> libffi?
> In any case, if there are no failures anymore, we could forget about
> this patch, until this problem would pop up again.
>
> >> > libatomic_ops version update 7.3alpha2 old version 1.2 does not
> >> > compiles with modern gcc and utils
> >> > Alexander Khryukin <alexander@mezon.ru>
> >> > http://patchwork.ozlabs.org/patch/198133
> >>
> >> No feedback, marked as rejected.
> >
> > I think bumping the version of a package is often useful, so I'm not
> > sure I would mark this patch as rejected. Or if no one is pushing to
> > bump libatomic_ops, then we should just assume no one cares, and
> > therefore there's no point in keeping the patch around?
> >
> >> > [4/4] gstreamer: replace gst-ffmpeg with gst-libav
> >> > bogdan at nimblex.org
> >> > http://patchwork.ozlabs.org/patch/207431
> >>
> >> No feedback, rejected.
> >
> > I'm a little bit concerned about how we reject patches here. Maybe
> > replacing gst-ffmpeg by gst-libav makes sense and should be done? If we
> > don't keep the patch around, we'll have no way to remember that it
> > should be done at some point in the future. I admit that by doing
> > this, we'll never shrink the list of pending patches, but I have the
> > feeling that we might be missing useful ideas.
>
> I grouped these two because the bottom line is the same: what to do
> with patches that did not receive feedback?
>
> It's true that simply rejecting these patches just to make the list
> smaller is not the best solution.
> I think we need some kind of adopt-a-patch principle if we ever want
> these patches to be integrated. For some of the patches from the
> cleanups, I marked it as 'delegated to me' so we wouldn't forget. This
> was either because the original author gave feedback, or in the case
> of wpa_supplicant because I felt that we should keep the patch. I hope
> to find some time sooner or later (ideally within the 2014.02 cycle)
> to verify them and resubmit.
>
> However, I cannot do this for all patches. For example, I'm not
> familiar with gstreamer at all, so I couldn't tell whether the
> replacement of gst-ffmpeg with gst-libav makes sense or not, which
> side-effects it may have for users, etc. If there are other developers
> that have a better view on it, then please step forward. It would
> indeed be a pity to lose these patches if they are relevant for
> someone.
>
> For this cycle, there was no response on these patches, hence the
> rejection.
> Based on your latest feedback, we could change this rejection into a
> delegation, to you or someone else. What do you say?
>
> Specifically for libatomic_ops: it seems there is a github repo now:
> https://github.com/ivmai/libatomic_ops/
> where a 7.4.0 version is available. What about going that route then?
> Are you, or someone else, interested in taking this delegation?
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140106/c3c04121/attachment-0001.html>
