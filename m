From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 12 Mar 2013 09:12:12 +0100 (CET)
Subject: [Buildroot] [PATCH] change default location for local.mk to
 $(CONFIG_DIR)
In-Reply-To: <20130311222630.5a75029d@skate>
Message-ID: <1706669320.395518.1363075932486.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Dear J?r?my Rosen,
> 
> On Thu,  7 Mar 2013 11:49:23 +0100, J?r?my Rosen wrote:
> > the previous default of $(TOPDIR) broke the philosophy of builds
> > with O=
> > which try to keep all configuration files within the $(CONFIG_DIR)
> > subtree
> 
> Hum, that's an interesting vision of things. I think I would tend to
> agree with this idea.
> 
> What do others think?
> 

A bit of context : 

I am trying to keep my buildroot project in git, but I am trying to 
cleanly separate "changes made to git" and "changes due to my project.

that basically means that all config file needs to be out of the 
buildroot/ subdirectory to be able to easily generate patches against
mainline and still keep my changes in git. I do that using git-subtree

I also change the location of the kernel config file for the same reason
and would do that for ctng and busybox if I needed to change them from
their default config

    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim
