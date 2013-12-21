From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Dec 2013 18:20:02 +0100
Subject: [Buildroot] [PATCH 1/4] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <20131221094905.2641a84f@skate>
References: <cover.1387578655.git.yann.morin.1998@free.fr>
 <64a7e3a995100104cdebd681621a9abb510a1820.1387578655.git.yann.morin.1998@free.fr>
 <20131221094905.2641a84f@skate>
Message-ID: <20131221172002.GB3481@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-21 09:49 +0100, Thomas Petazzoni spake thusly:
> On Fri, 20 Dec 2013 23:32:54 +0100, Yann E. MORIN wrote:
> 
> > +Requirements on host packages
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Depending on what types of partitioning and filesystems are used by your
> > ++partition table layout description+, you may have to enable some
> > +host-packages in the +Host utilities+ sub-menu.
> > +
> > +Since the content of a +partition table layout description+ is very
> > +specific to a board and/or a project, there is no way for Buildroot to
> > +automatically select those host packages, and thus it is your
> > +responsibility to select the appropriate ones.
> > +
> > +For example, for an MBR partitioning, you will have to enable the +host
> > +genpart+ package. For FAT filesystems, you will have to enable both of
> > ++host dosfstools+ and +host mtools+.
> 
> I'll have other comments about the genimages stuff later on,

Hey! You can't let us all waiting like that! Speak up, now! ;-)

> but I got an idea this night

I don't know what you usually do at night, but I, for one, sleep. ;-)

> about this specific problem. I don't really like the
> fact that the user has to manually enable in menuconfig the relevant
> host tools, depending on his genimage .ini configuration file.
> 
> What about doing something like:
> 
> ROOTFS_CUSTOM_DEPENDENCIES = $(shell fs/custom/genimages --show-depends \
> 				'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'
[--SNIP--]
> What do you think?

I was initially thinking about something like it, but found it a bit
dubious. But since you suggested it (and now Peter concurred), I have
now (re-)implemented it, and it works nicely.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
