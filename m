From: Cam Hutchison <camh@xdna.net>
Date: Tue, 9 Apr 2019 10:22:19 +1000
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <20190408090458.49e1e5cc@windsurf>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in> <20190408090458.49e1e5cc@windsurf>
Message-ID: <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 8 Apr 2019 at 17:05, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sun, 07 Apr 2019 19:00:20 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > > I don't know in which context it might be useful in buildroot.
> >
> > I don't see a reason for it either.
>
> Thanks for the feedback, I'll mark the patch as Rejected for now.

Well that's rather demoralising - waiting 9 months for some feedback
and given only 10 hours to respond before the patch is rejected.

My use case for this was for building Kubernetes, which builds some
components with CGO_ENABLED=0 and others without it. If I tried to
build some components with without it, I got linker errors. Since I
didn't feel like trying to debug/understand the whole Kubernetes build
process, I just went with building it the same way in buildroot as it
builds outside it. But for that I needed to be able to selectively
control CGO_ENABLED on a per-target basis.

But never mind. I can maintain this patch in my local buildroot patch
queue. I just thought it might be useful for others.
