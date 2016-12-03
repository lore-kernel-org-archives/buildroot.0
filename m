From: Martin Bark <martin@barkynet.com>
Date: Sat, 3 Dec 2016 15:44:23 +0000
Subject: [Buildroot] [PATCH 2/3] package/zic: bump version to 2016j
In-Reply-To: <20161203163510.4b861211@free-electrons.com>
References: <1480775787-28111-1-git-send-email-martin@barkynet.com>
 <1480775787-28111-2-git-send-email-martin@barkynet.com>
 <20161203160256.60230c0f@free-electrons.com>
 <CAFGQKxef_8MHWq5LWHxmxyaVu03YV2xuOq0Bge1KjV_F_9f_zA@mail.gmail.com>
 <20161203163510.4b861211@free-electrons.com>
Message-ID: <CAFGQKxd+NF_JShY61QZP85y0dS9EX12EdEFDyYVw-0eAUkmUgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

On 3 December 2016 at 15:35, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat, 3 Dec 2016 15:16:10 +0000, Martin Bark wrote:
>
> > The release of the timezone database is split into 2 files. One is tzcode
> > that we use to build zic for the host, the other is tzdata which contains
> > the the actual timezone data needed for the target.  When be extract
> tzcode
> > to build zic we have not extracted tzdata (there is no need to), however,
> > recent changes to tzcode means VERSION_DEPS in Makefile depends on files
> > that are only in tzdata.  This breaks building zic when only using tzcode
> > as we do.
> >
> > The patch removes the dependency on VERSION_DEPS because it's not
> necessary
> > for us.  We are building released code so there is no need for
> dependencies
> > to check if the version number needs updating which is clearly only
> needed
> > for development.
>
> So it really is an upstream bug? Did you try to send the patch to the
> upstream developers?
>

Yes.  Not yet, i'm still thinking about a proper fix to suggest to them.
My patch is good enough for us but it's not a solution for upstream.


>
> > Hope that makes sense.  Sorry for the typos,  I'll resubmit with them
> > corrected


> No need to resend just to fix the typos, I can fix them while applying.
>

Thanks


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161203/b8e1c28e/attachment.html>
