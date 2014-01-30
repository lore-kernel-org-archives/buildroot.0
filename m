From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 30 Jan 2014 15:10:03 +0100 (CET)
Subject: [Buildroot] Project layout : where to put the .config files
In-Reply-To: <20140130075406.3782cb77@core2quad.morethan.org>
Message-ID: <780030598.4903299.1391091002877.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> > I would gladly submit my projet to upstream too, but once again
> > buildroot (so far) only takes minimal configuration to set up
> > boards, not complete projects.
> >
> 
> Agreed on that point -
> 
> Buildroot is only a project component, one that builds a
> populated, root file system.
> 
> So far in the evolution of Buildroot, the other project
> components required to fully define a project have been
> user supplied.
> 
> It has never been a complete project build system.
> 
> Which is the use case that you want to consider.
> One that certainly deserves conversation.

yup, I like the way you present it.

you can have a look at the project I mentionned above,
with post-install scripts and overlays I am able to 
make a complete project managed with buildroot, that's
why I focused on the .config aspect which is the part
I am not entirely happy with


> 
> If my summary above is even close to an understanding
> of the use case you are proposing, then - - -
> 
> Prior to your question of "where to put the .config files?",
> I think there is a higher level question:
> "How to support project definition files?"
> 

the Makefile in my project fills that role (iiuc 
what you mean) it is where I define where I want my buildfiles
to go (by defining O=) and where I want my config files to go
(by defining BR2_EXTERNAL and BR2_DEFCONFIG)

> I.E: To make Buildroot the central control point for the
> other components that make up a complete project.
> 
> Perhaps a: BR_EXTERNAL/sub-tree ?
> Perhaps a: BR_PROJECT tree ?
> 
> Keeping in mind that we do not want to upset the world
> of users that use Buildroot commercially.
> 

yes, but i'm pretty sure most of us would be glad to have a 
"clean way" to do a complete project under buildroot


> For instance:
> The subject of "are the .config files 'required public' files?"
> The current set-up leaves that answer to the end user with
> commands that will include them in the 'public' buildroot tree.
> 

I'm not sure what you mean here... I'm mainly thinking in term
of project organisation. if the .config is considered derived 
from buildroot then the exact position doesn't matter. I have
to make it public, and usually in another way than by upstreaming
since this is a complete project and not a board defconfig...


> Mike
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
