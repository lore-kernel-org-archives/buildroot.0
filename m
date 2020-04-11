From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sat, 11 Apr 2020 11:06:05 -0400
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <20200411161903.7b007feb@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
 <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
 <20200411161903.7b007feb@windsurf.home>
Message-ID: <CAB4xu_15BFXQ3VFnrp8j5b8ivr=pGN2HN5UarW8dz-R+XRk5Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 11, 2020 at 10:19 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 11 Apr 2020 09:41:47 -0400
> Philippe Proulx <eeppeliteloop@gmail.com> wrote:
>
> > Replying for patch 6/8 and this one.
> >
> > Is the `show-info` target considered a public API?
>
> Somewhat yes: the goal of show-info is that people can craft their own
> tooling on top of it. Breaking the show-info output would break such
> tools.
>
> > If so, without a
> > version, it means it can never break. So let me suggest another layout
> > which breaks `show-info` (name it `show-info-2` if you will).
> >
> > Output example (using YAML only for clarity here):
>
> [...]
>
> This could certainly work, and reduces a bit the duplication of
> information.
>
> However, I still don't understand why your tool is not capable of
> having this knowledge about the stamp files. This is something that
> rarely changes. I think we haven't changed the stamp files since... 5
> years? More? If your tool is in the Buildroot tree itself, it can
> simply be updated if there is ever a change in the sequencing of steps.

Yes of course.

I was only trying to improve Yann's solution considering your comments
about data redundancy.

If you tell me that things such build step order and stamp file names do
not change for many years and as such can be considered as interfaces,
I'm fine with this.

It's always a balance between adding the same logic to all the viewers
and generating less data.

My tool could be part of the Buildroot project, but I doubt you'll want
something that depends on PyQt5 in there. However, I could certainly
contribute a Python module which offers utilities over the `show-info`
output so as to have a versioned, object-oriented API, and then import
it from an external tool. This way, even if `show-info` changes, the
Python module can continue to offer the same (non-breaking) interface.

I still think we somewhat need the `build_dir` entry though.

Phil

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
