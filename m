From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 17:27:26 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <CAB4xu_15BFXQ3VFnrp8j5b8ivr=pGN2HN5UarW8dz-R+XRk5Dw@mail.gmail.com>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
 <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
 <20200411161903.7b007feb@windsurf.home>
 <CAB4xu_15BFXQ3VFnrp8j5b8ivr=pGN2HN5UarW8dz-R+XRk5Dw@mail.gmail.com>
Message-ID: <20200411172726.555e75b8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Apr 2020 11:06:05 -0400
Philippe Proulx <eeppeliteloop@gmail.com> wrote:

> > However, I still don't understand why your tool is not capable of
> > having this knowledge about the stamp files. This is something that
> > rarely changes. I think we haven't changed the stamp files since... 5
> > years? More? If your tool is in the Buildroot tree itself, it can
> > simply be updated if there is ever a change in the sequencing of steps.  
> 
> Yes of course.
> 
> I was only trying to improve Yann's solution considering your comments
> about data redundancy.

Sure, and your proposal makes sense if we believe we need to have this
build sequencing information exposed in the JSON output.

> If you tell me that things such build step order and stamp file names do
> not change for many years and as such can be considered as interfaces,
> I'm fine with this.

I don't think we can really consider these as stable interfaces, but it
is sufficiently stable to rely on it.

> It's always a balance between adding the same logic to all the viewers
> and generating less data.
> 
> My tool could be part of the Buildroot project, but I doubt you'll want
> something that depends on PyQt5 in there.

I don't see why we couldn't have it in the tree. It's not a mandatory
tool, so it's fine to have something that depends on PyQt5.

> However, I could certainly contribute a Python module which offers
> utilities over the `show-info` output so as to have a versioned,
> object-oriented API, and then import it from an external tool. This
> way, even if `show-info` changes, the Python module can continue to
> offer the same (non-breaking) interface.
> 
> I still think we somewhat need the `build_dir` entry though.

Yes, for the build_dir entry, I definitely agree, it is useful and
needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
