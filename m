From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 09:59:59 +0200
Subject: [Buildroot] [PATCH 1/3] ladspa-sdk: new package
In-Reply-To: <53E14394.2030309@barkynet.com>
References: <1398374384-8814-1-git-send-email-martin@barkynet.com>
 <20140804222345.65aacf17@free-electrons.com>
 <53E14394.2030309@barkynet.com>
Message-ID: <20140806095959.7b634542@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Tue, 05 Aug 2014 21:50:28 +0100, Martin Bark wrote:

> > Sorry for the lack of feedback until now on these patches. See below
> > for a number of comments.
> 
> That's fine, to be honest I forgot I submitted these patches :)

Yeah, it's been a while, but I'm trying to do some clean up of the
patch backlog.

> Originally I started this because I wanted an equaliser for some work i 
> was doing with acoustic echo cancellation. alsaeqaul was a quick easy 
> way to add a equaliser i could change real time.  alsaequal needs caps 
> which is an ladsp module hence the 3 patches.

Ok.

> I don't know if ladsp is under active development.  Really it's just the 
> definition of an API in a C header file so I think it's not meant to 
> change.  It's the packages like caps which implement the interface which 
> i expect to be active.

Ok, makes sense. I was a bit worried about the lack of upstream
activity, but it is indeed just an API definition, so probably it
doesn't make sense for it to move very often.

> caps is self contained (it includes a copy of ladsp.h) and does not need 
> this ladsp-sdk package, i added it for completeness.

Ah, ok.

> Is the lack of development activity an issue?  I could drop ladsp-sdk if 
> you like.  Please let me know your thoughts.

Well, if it's not needed for caps, I'd say leave it aside for now.

And for both packages, if you do patches on them to make them work in
Buildroot, we generally prefer when some patches are submitted
upstream. So that one day, maybe, we can drop those patches when
upstream releases a new version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
