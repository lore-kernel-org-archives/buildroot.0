From: Pascal K <pascalkrauth@gmail.com>
Date: Fri, 18 May 2018 09:31:27 +0200
Subject: [Buildroot] Migrating from buildroot-2016-08 to -2018-02
In-Reply-To: <CANQCQpZ4rmixSsSVBad9obWVDwLxeT1U5q1XpZw7fkzSOffc3w@mail.gmail.com>
References: <CADj18OWYtg91U=KqSuCyC8G5cp8zDD7z6p2Y+z-NxmhE4cpa3w@mail.gmail.com>
 <CANQCQpZ4rmixSsSVBad9obWVDwLxeT1U5q1XpZw7fkzSOffc3w@mail.gmail.com>
Message-ID: <CADj18OVFTSFuz=YKhm1nJZEOjLPPZBhpqHOKf9K+1vkQq6yKSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

I just started looking more into my issue, I had a conflict with the
folders I used.

My now nearly warning free working solution does support relative paths
like I used in the given line in my top post.
But the Config.In and external.mk file in the top folder needed further
adjustments.

For now I am left with a lot of warning like:
"arch/Config.in:28:warning: choice value used outside its choice group
arch/Config.in:36:warning: choice value used outside its choice group
arch/Config.in:44:warning: choice value used outside its choice group"

Best regards,
Pascal

Matthew Weber <matthew.weber@rockwellcollins.com> schrieb am Do., 17. Mai
2018 um 18:11 Uhr:

> Pascal,
>
> On Thu, May 17, 2018 at 10:40 AM, Pascal K <pascalkrauth@gmail.com> wrote:
> >
> > Hello everyone,
> >
> > I just tried to replace our buildroot-2016-08 environment with
> buildroot-2018-02 and run into a small problem.
> >
> > Usually I tried to create a new out-of-Tree, out-of-Source build using:
> > "make BR2_EXTERNAL=../ O=../../beaglebone_build beaglebone_defconfig"
> from the buildroot main directory, which did create the directory
> "beaglebone_build" and took care of the configuration.
>
> I can get you a bit further.  Need to use absolute paths for your
> BR2_EXTERNAL and for good measure I do the same for O= but I'm not
> sure that one is required.  Also any place you used BR2_EXTERNAL you
> now need to use the new name based on your external.desc file's
> defined name.
>
> Matt
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180518/dcf16df0/attachment.html>
