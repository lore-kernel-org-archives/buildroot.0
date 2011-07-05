From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 09:28:50 +0200
Subject: [Buildroot] [PATCH 06/28] package: fix patching procedure for
 host packages
In-Reply-To: <201107050001.50292.yann.morin.1998@anciens.enib.fr>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <3f344e77a60fbd473b25eb91fd7a6a270197b01d.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107050001.50292.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110705092850.48d9e235@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 5 Jul 2011 00:01:50 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> I might say something stupid, but what abouta package that is named
> 'foohost-bar'? The 'host-' part will be stripped, and we'd get
> 'foobar'. And that'd be wrong, I think.
> 
> I'd use: $(patsubst host-%,%,$(1))

Ah, good idea, thanks! I've updated my patch with this.

> And even in that case, that does not prevent a target package that
> is named 'host-utils' from matching, and be renamed to just 'utils'.
> 
> But it's been a while I looked at the generic infra, so I might be
> just saying cracks here...

I would say that we don't allow a package to have a name that starts
with "host-". I think even without this patch, having such a package
could cause troubles.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
