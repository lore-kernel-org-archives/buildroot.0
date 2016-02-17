From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 08:55:09 +0100
Subject: [Buildroot] copy-package infrastructure [was: Re: [PATCH 1/1]
 new package: jsen]
In-Reply-To: <56C3B1C3.7060807@mind.be>
References: <1455605293-1869-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <20160216222540.64878554@free-electrons.com>
 <56C3B1C3.7060807@mind.be>
Message-ID: <20160217085509.370548df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Feb 2016 00:33:23 +0100, Arnout Vandecappelle wrote:

> > As a side note, I am wondering if we shouldn't create some common
> > infrastructure to simplify all those packages that just need to "copy"
> > stuff. Either a special variable in the generic-package infrastructure,
> > or a separate "copy-package" infrastructure that provides a special
> > variable that allows the package to list "stuff to be copied" and
> > another listing "where to copy". But that's clearly beyond the scope of
> > your patch, so don't worry about this.
> 
> 
>  It fairly often happens that other stuff is needed as well, so the copy-package
> infrastructure doesn't sound like a good idea. A variable is also not so simple,
> because you need to specify the source and the target directories.

Yes, it is indeed common that a few other things need to be done.

>  So I think it should be a function, like
> 
> define JSEN_INSTALL_TARGET_CMDS
> 	$(call copy-dirs,dist lib index js,/usr/share/jsen)
> endef
> 
>  However, I think it's not really worth it. We're saving just a little bit of
> code, and hiding what's really happening. I prefer to keep things explicit.

Yeah, that's an opinion. I don't have a strong opinion either way, but
I can certainly understand the opinion that things should remain
explicit, and to not needlessly introduce new infrastructures.

>  BTW in the same vein, we should also get rid of the github helper. It was
> introduced because the github URLs were changing all the time, but that's no
> longer the case now.

Right. It would make it clearer for anyone reading the code that when
fetching from Github, we're actually doing an http download and not a
git clone.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
