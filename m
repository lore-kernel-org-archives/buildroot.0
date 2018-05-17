From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 May 2018 11:11:21 -0500
Subject: [Buildroot] Migrating from buildroot-2016-08 to -2018-02
In-Reply-To: <CADj18OWYtg91U=KqSuCyC8G5cp8zDD7z6p2Y+z-NxmhE4cpa3w@mail.gmail.com>
References: <CADj18OWYtg91U=KqSuCyC8G5cp8zDD7z6p2Y+z-NxmhE4cpa3w@mail.gmail.com>
Message-ID: <CANQCQpZ4rmixSsSVBad9obWVDwLxeT1U5q1XpZw7fkzSOffc3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal,

On Thu, May 17, 2018 at 10:40 AM, Pascal K <pascalkrauth@gmail.com> wrote:
>
> Hello everyone,
>
> I just tried to replace our buildroot-2016-08 environment with buildroot-2018-02 and run into a small problem.
>
> Usually I tried to create a new out-of-Tree, out-of-Source build using:
> "make BR2_EXTERNAL=../ O=../../beaglebone_build beaglebone_defconfig" from the buildroot main directory, which did create the directory "beaglebone_build" and took care of the configuration.

I can get you a bit further.  Need to use absolute paths for your
BR2_EXTERNAL and for good measure I do the same for O= but I'm not
sure that one is required.  Also any place you used BR2_EXTERNAL you
now need to use the new name based on your external.desc file's
defined name.

Matt
