From: Mike Zick <minimod@morethan.org>
Date: Thu, 30 Jan 2014 07:54:06 -0600
Subject: [Buildroot] Project layout : where to put the .config files
In-Reply-To: <123658967.4899331.1391085271159.JavaMail.root@openwide.fr>
References: <20140130053948.48587221@core2quad.morethan.org>
 <123658967.4899331.1391085271159.JavaMail.root@openwide.fr>
Message-ID: <20140130075406.3782cb77@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Jan 2014 13:34:31 +0100 (CET)
Jeremy Rosen <jeremy.rosen@openwide.fr> wrote:

> I would gladly submit my projet to upstream too, but once again 
> buildroot (so far) only takes minimal configuration to set up
> boards, not complete projects.
>

Agreed on that point -

Buildroot is only a project component, one that builds a 
populated, root file system.

So far in the evolution of Buildroot, the other project
components required to fully define a project have been
user supplied.

It has never been a complete project build system.

Which is the use case that you want to consider.
One that certainly deserves conversation.

If my summary above is even close to an understanding
of the use case you are proposing, then - - -

Prior to your question of "where to put the .config files?",
I think there is a higher level question:
"How to support project definition files?"

I.E: To make Buildroot the central control point for the
other components that make up a complete project.

Perhaps a: BR_EXTERNAL/sub-tree ?
Perhaps a: BR_PROJECT tree ?

Keeping in mind that we do not want to upset the world
of users that use Buildroot commercially.

For instance:
The subject of "are the .config files 'required public' files?"
The current set-up leaves that answer to the end user with
commands that will include them in the 'public' buildroot tree.

Mike
