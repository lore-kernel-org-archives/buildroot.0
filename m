From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:30:49 +0200
Subject: [Buildroot] [PATCH 5/6] package/checksec: new package
In-Reply-To: <CANQCQpY2V8pnzkro2-Y4DnDXFTC0DnwsD8JX6f1xpj_YxbhajA@mail.gmail.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-6-matthew.weber@rockwellcollins.com>
 <20180810225855.4cb005dc@windsurf>
 <CANQCQpY2V8pnzkro2-Y4DnDXFTC0DnwsD8JX6f1xpj_YxbhajA@mail.gmail.com>
Message-ID: <20180811123049.16cac0d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Fri, 10 Aug 2018 19:57:06 -0500, Matthew Weber wrote:

> > When I look at this and the comment from the maintainer at [0], I am
> > not sure about the usefulness of such a tool in the context of
> > Buildroot. Chrooting into the target filesystem is generally not
> > possible, because the target architecture is different than the build
> > system architecture. To me, this limitation makes the tool essentially
> > useless in the context of Buildroot. Could you comment on this a bit
> > more ?  
> 
> The tool tests a lot of items related to hardening and we were
> originally trying to get the full set working.  In reality we only
> needed the core items that show us ASLR related items.  The tool is
> made up of scripts and uses readelf for the ASLR piece.  Thus it works
> fine for a host (offline)target filesystem check of executable ALSR
> requirements.  However, I can add a note stating what doesn't work
> correctly.  There are test cases it has that use live proc information
> and the system libraries, etc.

Yes, something more specific than the vague explanation in the proposed
Config.in help text would be good.

> > Also, the formulation "requires discretion of which the test may not
> > report consistently vs chroot/on-target" doesn't make any sense to me.  
> 
> I can make a list do this is definitive.

OK, good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
