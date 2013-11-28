From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 28 Nov 2013 06:09:33 -0600
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <20131128123359.6341f14e@skate>
References: <20131128094342.3f6c84e4@skate>
 <1745239489.15294056.1385631446992.JavaMail.root@openwide.fr>
 <20131128123359.6341f14e@skate>
Message-ID: <OF48FFD9A9.EDDCA00F-ON86257C31.0040FD2E-86257C31.0042CA75@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Jeremy, 

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/28/2013 
05:33:59 AM:

> Dear Jeremy Rosen,
> 
> On Thu, 28 Nov 2013 10:37:27 +0100 (CET), Jeremy Rosen wrote:
> 
> > my idea was more along the line of "if we are setting BR2_EXTERNAL
> > and the file doesn't exist, then create an empty "Config.in" file
> > so the next call to make doesn't fail" 
> > 
> > this would be to avoid leaving the build system in a broken 
> > configuration after a call that sets up the build system for the
> > user.
> > 
> > I can see pro and cons on this idea, there is a risk in touching
> > a file the user is supposed to edit and the breakage itself could
> > be considered a good way to make sure the user go look into the 
> > file
> > 
> > but on the other hand, for simple use cases where the user doesn't
> > want to add new packages, but simply overlay a couple of config
> > files, creating a valid infrastructure from the start might be 
> > a good idea...
> 
> Ok, I think I see what you mean: creating
> $(BR2_EXTERNAL)/package/Config.in automatically if it doesn't exist. I
> don't have a really strong feeling about this, but my initial reaction
> is that it's better to let the user do that by himself. BR2_EXTERNAL is
> part of the user source tree, and I hate when tools mess up with my
> source tree by creating files here and there automatically.

I'm in agreement with Thomas on this issue. I would prefer it if the user 
has to create the file (even with it being blank). However, maybe we could 
a test within the main makefile that if BR2_EXTERNAL is used and there is 
no "package/Config.in" present we through a make error prompt the user to 
create this file. I prefer this method since it would be teaching the user 
how to correctly use this feature instead of doing some hidden 
"auto-magic".

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131128/0eabd6b0/attachment.html>
