From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 12 Nov 2013 16:27:19 -0600
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <52829CD4.3080200@mind.be>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
 <52829CD4.3080200@mind.be>
Message-ID: <OF3FB215A2.518C604E-ON86257C21.007AC979-86257C21.007B59E4@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 11/12/2013 03:25:40 PM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 11/12/2013 03:25 PM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
> 
> On 12/11/13 21:31, Matt Weber wrote:
> >
<snip>
> >
> > +define OMNIORB_ENABLE_SERVICES
> > +   $(SED) 's:SUBDIRS += lib:SUBDIRS += lib services:g' 
$(@D)/src/dir.mk
> > +endef
> > +
> > +ifeq ($(BR2_PACKAGE_OMNIORB_WITH_SERVICES),y)
> > +   OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ENABLE_SERVICES
> 
>   We normally don't indent variable assignments within conditions (the 
> indentation of the sed statement is OK, because that's a shell command).
> 

Sure, I'll clean those up.

>   Also, wouldn't it be better to do this as post-patch hook?

In this case, yes.  The file is not modified during configure.  I'll 
update.

Thanks!
Matt Weber
mlweber1 at rockwellcollins.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/6e73bca7/attachment.html>
