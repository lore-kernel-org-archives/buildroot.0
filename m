From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 13 Jan 2020 18:42:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: update user generation
In-Reply-To: <20200113170148.32a46621@windsurf>
References: <20200113153415.486032-1-nolange79@gmail.com>
 <20200113170148.32a46621@windsurf>
Message-ID: <CADYdroP=7zUHsZ70+-9w98qVwENnFTvmLP-Z61oaEjYu0TmmkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 13. Jan. 2020 um 17:01 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Norbert,
>
> On Mon, 13 Jan 2020 16:34:15 +0100
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > since V235 the "gateway" and "upload" services use DynamicUsers,
> > requiring no entries in /etc/passwd.
> > This functionality requires option nss-systemd, which is always
> > enabled in buildroot.
> >
> > the "bus-proxy" user was removed in V244.
> >
> > thre "remote" user will now only be generated if the feature is
> > enabled.
> >
> > Description is matched to the ones in the upstream sysusers.d
> > files. home is set to /run/systemd.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> Thanks for your patch. However, it fixes numerous different problems,
> and as such, should be split into several patches, one fixing each
> issue.
>
> Could you send an updated version, split into multiple patches ?

There are alot ways to split them?
Is this enough, or do you need more splits:

first 3 points
description
home

the home part is actually a bit of a nuisance, as mkusers then creates
the folder /run/systemd and it ends up in the image.
I would have another patch to clean out /run before running the image
creation command.

Norbert
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
