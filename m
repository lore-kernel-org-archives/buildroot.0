From: Mike Zick <minimod@morethan.org>
Date: Thu, 30 Jan 2014 08:42:13 -0600
Subject: [Buildroot] Project layout : where to put the .config files
In-Reply-To: <780030598.4903299.1391091002877.JavaMail.root@openwide.fr>
References: <20140130075406.3782cb77@core2quad.morethan.org>
 <780030598.4903299.1391091002877.JavaMail.root@openwide.fr>
Message-ID: <20140130084213.2dcae4c9@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Jan 2014 15:10:03 +0100 (CET)
Jeremy Rosen <jeremy.rosen@openwide.fr> wrote:

> > I.E: To make Buildroot the central control point for the
> > other components that make up a complete project.
> > 
> > Perhaps a: BR_EXTERNAL/sub-tree ?
> > Perhaps a: BR_PROJECT tree ?
> > 
> > Keeping in mind that we do not want to upset the world
> > of users that use Buildroot commercially.
> >   
> 
> yes, but i'm pretty sure most of us would be glad to have a 
> "clean way" to do a complete project under buildroot
> 

Ah, another point of agreement then.

The current "put them in 'public' tree and move if required"
and the current "put them in the 'private' tree and move if
required" is becoming a bit messy.

So without trying to answer my own questions above -

Start with adding some infra-structure for 'project related'
files; and
Then using that to support the collection of .config files.

That would be of general use to the Buildroot system and
consistent with the "keep it clean, keep it simple" objective.

The end-user could still decide on the 'ship/don't ship' question
by including the 'project related' stuff or not.

It could also help answer the question of: "BR provides hooks
to external scripting - but where do I put them in an organized
manner?"

> 
> > For instance:
> > The subject of "are the .config files 'required public' files?"
> > The current set-up leaves that answer to the end user with
> > commands that will include them in the 'public' buildroot tree.
> >   
> 
> I'm not sure what you mean here... I'm mainly thinking in term
> of project organisation. if the .config is considered derived 
> from buildroot then the exact position doesn't matter. I have
> to make it public, and usually in another way than by upstreaming
> since this is a complete project and not a board defconfig...
> 

There has already been (years ago) a Buildroot fork from those
that wanted it to become a complete project system.

So just providing the basic organizational infra-structure is
probably a good idea now.

- - - -

Let us pause here for others to comment.

Mike
