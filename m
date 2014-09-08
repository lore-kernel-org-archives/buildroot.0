From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 11:27:03 +0200
Subject: [Buildroot] [PATCH 1/2] libtirpc: add dependency on atomic
	operations
In-Reply-To: <1410168181.4784.16.camel@abrodkin-8560l.internal.synopsys.com>
References: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
 <1410157964-8422-2-git-send-email-abrodkin@synopsys.com>
 <20140908092306.12308c5a@free-electrons.com>
 <1410168181.4784.16.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140908112703.2f405e2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 8 Sep 2014 09:23:02 +0000, Alexey Brodkin wrote:

> > I already tried to solve this thing, but it's much more complicated
> > than just adding a bunch of "depends on".
> 
> So I assume there's no sense for me to try fixing comments, right?
> I mean if this won't work either or introduce new problems as you meant.

There is definitely some sense in fixing this stuff. I'm not sure yet
on how to do this. I had some discussion with Thomas DS a week ago or
so on IRC about this.

> This is especially important for ARC where these ops are optional.
> The simplest solution could be to enable BR2_ARCH_HAS_ATOMICS for ARC by
> default, but this will just attempt to escape from real problem.
> 
> And as I saw from other autobuild results other architectures are
> affected like Blackfin for example.

Yes, sure, we need to fix the problem. It's just not as simple as
adding more "depends on", unfortunately :-(

> If this is that complicated we may try to discuss it in person on
> Buildroot summit in few weeks.

Ah, you're planning on coming to the Buildroot meeting? If so, could
you register to http://elinux.org/Buildroot:DeveloperDaysELCE2014, or
confirm me that you are coming so that I can add your name to the list
of participants?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
