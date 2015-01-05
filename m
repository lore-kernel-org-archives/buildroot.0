From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 05 Jan 2015 17:19:34 +0100
Subject: [Buildroot] [PATCH 00/14] Add support for U-Boots Kbuild &
 Kconfig build system
In-Reply-To: <20150105145933.07f39dba@free-electrons.com>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
 <20141221234006.311fcde0@free-electrons.com>
 <20150102172208.7a2ef5f1@free-electrons.com>
 <1420463640.2905.8.camel@posteo.de>
 <20150105145933.07f39dba@free-electrons.com>
Message-ID: <1420474774.7357.3.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2015-01-05 at 14:59 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Mon, 05 Jan 2015 14:14:00 +0100, J?rg Krause wrote:
> 
> > > > So we clearly need to continue to support older versions of U-Boot,
> > > > that don't have the kconfig stuff. I just gave a try, and it seems like
> > > > the old U-Boot way of configuring/building things apparently still
> > > > works with U-Boot 2014.10. So your PATCH 01/14 is probably OK. However
> > > > starting from 02/14, I believe you'll be breaking things for U-Boot
> > > > versions older than 2014.10.
> > 
> > U-Boot 2014.10 still supports the old <board_name>_config build system.
> > So it should be safe to update the version number only (in case the
> > board is still supported).
> 
> Yes, that's why I've applied your patch bumping the version to 2014.10:
> http://git.buildroot.net/buildroot/commit/boot?id=143119c0ef58b04bd7109bcb7b095ef98cc5311c.
> 
> > I can do this. Do you have any suggestion for providing backward
> > compatibility? I have a config option for the U-Boot menu in mind, e.g.:
> >             U-Boot Version (2014.10) --->
> >         [ ] Use Kconfig build system (NEW)
> 
> Yes, at this point, I don't really see any other solution than having a
> Config.in option: since we support fetching U-Boot from custom
> location, only the user can tell if the U-Boot version uses the old
> build system, or the new Kconfig/Kbuild based build system.
> 
> Of course, if 2014.10 is selected, you can automatically enable the
> usage of the Kconfig build system, but for custom
> versions/repositories, we have no other solution than having such a new
> Config.in option.
> 
> Can you work on this idea?

Yes, I can. I'll try to get it submitted this week.

J?rg
