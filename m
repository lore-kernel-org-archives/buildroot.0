From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 28 Aug 2007 10:21:19 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/device/Atme	l:	atngw100/target_skeleton	atngw100/target
	etc...
In-Reply-To: <N6xhSnyYKJlG.yp1Ms24M@mailout.dof.se>
References: <N6xhSnyYKJlG.yp1Ms24M@mailout.dof.se>
Message-ID: <1188289279.7412.1.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 2007-08-28 at 10:10 +0200, Ulf Samuelsson wrote:
> > Added:
> >    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/
> 
> What is up with all the directories? Is not defining them
> in .../<board>/device_table.txt enough? I find it far better defining
> them there since the access permissions can be defined as well.
> 
> 
> Some stuff are needed
> during the build and
> the device table is only
> used when you convert
> $(TARGET-DIR) to
> rootfs-avr32.$(fs) which
> is too late.
> 
> It can probably be done
> better

Indeed, the packages failing with an "empty" skeleton should have some
mkdir -p actions in them IMHO. That way not all targets needs to be
fixed, but just one package.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
