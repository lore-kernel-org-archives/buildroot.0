From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 13 Feb 2009 11:10:00 +1100
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <20090212132945.GA30222@zelow.no>
References: <49907BAE.3020509@ethertek.ca> <20090212132945.GA30222@zelow.no>
Message-ID: <20090213001000.GA22653@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 12, 2009 at 02:29:45PM +0100, Thomas Lundquist wrote:
> On Mon, Feb 09, 2009 at 10:53:34AM -0800, Dan Pattison wrote:
> > 
> > Hello List:
> > 
> > I've been getting used to the buildroot development environment using 
> > 2009.02-RC2 for ARM AT91SAM9g20-EK. I have made lots of changes and 
> > additions that suit our project (config files, packages, etc.) We have 
> > successfully compiled and included some of our own programs.
> > 
> > What is the recommended method to upgrade to the newest build 
> > environment so we don't have to re-do everything? Is this possible?
> 
> Ulf introduced local/ when he started to commit and this was a good idea.
> 
> It got booted out some time later, by someone.
> 
> The point is that you can put your config files and non-included 
> packages there and keep that out of the rest of the tree.
> 
> I like the idea and would like to put it back in.

I'm using local/ a lot in my own development. I have config files
(buildroot, busybox, linux, uClibc), the device table and the
target_skeleton in there.

There wasn't any support for additional packages via local/ although it
would be useful - I had to modify the top level makefiles to add such a
section here, making maintenance more difficult.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
