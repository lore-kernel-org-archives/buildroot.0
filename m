From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 11 Sep 2013 12:12:54 -0500
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <20130911170340.GA3410@free.fr>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
 <20130911170340.GA3410@free.fr>
Message-ID: <OF5204624D.2B85479D-ON86257BE3.005DF97C-86257BE3.005E90F0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@gmail.com> wrote on 09/11/2013 12:03:40 
PM:

> > One idea that I have, is for the make file that is genreated for the 
an
> > external output directory, if we could preserve the the value of 
> > BR2_EXTERNAL
> > as follows. I don't think my logic is fully there but there is more of 
a 
> > sudo implementation:
> > 
> > diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> > --- a/support/scripts/mkmakefile
> > +++ b/support/scripts/mkmakefile
> > @@ -27,6 +27,7 @@ makedir := \$(dir \$(call 
lastword,\$(MAKEFILE_LIST)))
> > 
> >  MAKEARGS := -C $1
> >  MAKEARGS += O=\$(if \$(patsubst 
/%,,\$(makedir)),\$(CURDIR)/)\$(patsubst 
> > %/,%,\$(makedir))
> > +MAKEARGS += BR2_EXTERNAL=\$(realpath \$(BR2_EXTERNAL))
> 
> Why realpath? I think we should pass the exact value of BR2_EXTERNAL.

I would agree, like I said when I suggested this I didn't think it all the
way through other than this feature would be very useful.

> Otherwise, I agree that this could be usefull.
> 
> Regards,
> Yann E. MORIN.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/5ef6fd3e/attachment.html>
