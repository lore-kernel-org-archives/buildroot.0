From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 08:05:11 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in> <20190408090458.49e1e5cc@windsurf>
 <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
Message-ID: <20190409080511.2bd20105@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cam,

On Tue, 9 Apr 2019 10:22:19 +1000
Cam Hutchison <camh@xdna.net> wrote:

> > Thanks for the feedback, I'll mark the patch as Rejected for now.  
> 
> Well that's rather demoralising - waiting 9 months for some feedback
> and given only 10 hours to respond before the patch is rejected.

Sorry for this. Taking a step back, I can understand how my very direct
decision can be disappointing.

However, as Christian explained, it's definitely not a "reject
forever", not at all. The status of patches in patchwork can always be
flipped back to whatever state we want.

As you have seen, we have a huge backlog of patches, so when the
feedback on a patch is fairly negative, I tend to immediately update
the patch state to not leave it pending forever. Otherwise, I forget
about it among the 200+ patches that are pending.

But clearly, if some additional explanation is given, either a new
iteration of the patch is sent, or alternatively we could apply the
original version after amending the commit log and/or adjusting the
implementation.

> My use case for this was for building Kubernetes, which builds some
> components with CGO_ENABLED=0 and others without it. If I tried to
> build some components with without it, I got linker errors. Since I
> didn't feel like trying to debug/understand the whole Kubernetes build
> process, I just went with building it the same way in buildroot as it
> builds outside it. But for that I needed to be able to selectively
> control CGO_ENABLED on a per-target basis.

So Christian said he would try to integrate Kubernetes, and see where
it goes. Would that work for you ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
