From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 10:00:57 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <74d445b1-0c5b-95d0-652b-7f403e9ccff0@mind.be>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
 <20191206085900.6df9f25a@windsurf>
 <74d445b1-0c5b-95d0-652b-7f403e9ccff0@mind.be>
Message-ID: <20191206100057.56544d6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 6 Dec 2019 09:58:15 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> >> And a number of other packages as well,
> >> e.g. the Python sysconfig refers to the Python per-package dirs.  
> > 
> > For sysconfig, I have a pending patch that I will submit soon to fix
> > the problem. It is in fact worse for sysconfig because if you don't
> > tweak it during the build, the build simply fails. While for the global
> > meson cross-compilation.conf, it is less dramatic as it is not used by
> > Buildroot itself, just provided as a convenience.  
> 
>  Just to be entirely clear: it actually works as long as you keep the build
> directory around, it just doesn't work in the context of the SDK, right?

A final pass in staging-finalize will be needed indeed to fixup the
sysconfigdata for the SDK.

I think I tried to come up with a solution that involved using relative
paths, but didn't get it to work. But it's been a while I looked into
this, so I don't remember exactly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
