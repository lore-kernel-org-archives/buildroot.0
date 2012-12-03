From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 03 Dec 2012 09:57:03 +0100 (CET)
Subject: [Buildroot] [PATCH] [PATCH][RFC] new target: live filesystem
In-Reply-To: <CAJJ6jxvVkLmLmMiC+3bKEqokBUd1-LrJ8nJywzYmtVYxbXsSNQ@mail.gmail.com>
Message-ID: <2f772bd2-fecd-4aeb-9bbe-83316ac7deed@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

well, it's more a question of what you consider the live filesystem to be...

I see it a as just another filesystem format (basically a NFS target) which is why my original patch had it in output/images/live 

if you see it as a deployment, it does not really make sense to add it to buildroot (buildroot doesn't flash the filesystem directly) I can understand that both point of view make sense

however having this target makes things simpler in a very common use case (arguably the most common use case since it's the case where you use buildroot repeatedly to prepare the fs, not the case where you run it once to build the final FS)

yes it's a two line script, and yes it's a minor change, but I think it makes sense and it's simple enough for it not to be a big deal...



    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> De: "Steve Calfee" <stevecalfee@gmail.com>
> ?: "Arnout Vandecappelle" <arnout@mind.be>
> Cc: "J?r?my Rosen" <jeremy.rosen@openwide.fr>, buildroot at busybox.net
> Envoy?: Vendredi 30 Novembre 2012 22:46:53
> Objet: Re: [Buildroot] [PATCH] [PATCH][RFC] new target: live filesystem
> 
> On Fri, Nov 30, 2012 at 1:15 AM, Arnout Vandecappelle
> <arnout@mind.be> wrote:
> > On 30/11/12 01:04, Steve Calfee wrote:
> >>
> >> I don't understand why you need this. It is a one line "sudo tar
> >> -xf
> >> ..." to unpack the tarball into your nfs directory. Either type
> >> this
> >> line or add a one line script to your ~/bin directory to do it for
> >> each of your buildroot trees/environments. Don't add clutter to
> >> the
> >> buildroot makefile.
> >
> >
> >  If that is the reasoning, we can also remove the compression of
> >  the
> > .tar file, or the -dirclean targets, etc. etc.
> >
> >  In addition, this target also cleans up the NFS directory first,
> >  so
> > it's slightly more than just untarring.
> >
> Hi  Arnout,
> 
> I guess, but buildroot is all about building, not deploying. What is
> next, an automatic copy to my usb or sd drive? Stuff that is highly
> user specific should not be in the makefile, especially stuff that
> can
> easily be added to a simple script - my opinion only,
> 
> Steve
> 
