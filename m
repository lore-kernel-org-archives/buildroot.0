From: Daniel Crowe <daniel.crowe@resolution.systems>
Date: Wed, 17 Feb 2021 09:27:15 +1030
Subject: [Buildroot] [PATCH 1/1] support/scripts/size-stats: increase
 number of files that can be linked to a source
In-Reply-To: <20210216221037.36b7e48c@windsurf.home>
References: <20210210110518.24817-1-daniel.crowe@resolution.systems>
 <CAAXf6LXXEV3PZ1rQ58nJhR7g-Jgra71wtkWmbo8t9ihAruum9Q@mail.gmail.com>
 <20210216221037.36b7e48c@windsurf.home>
Message-ID: <CA+dVm3OwQ=S6GW5KL_YyX5SwxZ7s9BBfT9XgZDoXQpfx7+XUAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback. Happy to rework it as suggested.


On Wed, 17 Feb 2021 at 07:40, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Tue, 16 Feb 2021 15:06:39 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > Please extend your commit message with more information: what is the
> > problem you're fixing, and how are you fixing it.
> > Right now, we can only guess what it is doing based on the code.
> >
> > It looks like the change is extending the size information to
> > rootfs-overlays, while today only real packages are considered.
> > But if that is correct, then the title "increase number of files that
> > can be linked to a source" is confusing to me.
>
> The change is not just about the rootfs overlay, but also about taking
> into account .pyc files compiled from .py files:
>
> +            # account for python file compilation
> +            if fpath.endswith('.py'):
> +                add_file(filesdict, fpath + 'c', fullpath + 'c', pkg)
>
> This should at least be separated in another patch. I'm not a huge fan
> of this approach, but I don't really have a good suggestion. Ideally,
> we should byte-compile each package independently, so that it's part of
> the install step of the package. But that would be vastly less
> efficient than just byte-compiling everything in one go at the end of
> the build, like we're doing.
>
> Daniel: could you rework your patch a bit, splitting it into several
> patches, with a slightly improved commit log ? I think it makes a lot
> of sense to have these improvements to size-stats.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
*Daniel Crowe | Senior Embedded Developer*

Resolution Systems Pty Ltd | L1 214 Greenhill Road, Eastwood South
Australia, 5063, Australia
m. +61 400 014 688
e. daniel.crowe at resolution.systems | www.resolution.systems
[image: Resolution Systems]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210217/80cfd2ed/attachment.html>
