From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Feb 2018 16:49:49 +0100
Subject: [Buildroot] [PATCH 1/2] pkgconf: pkg-config.in: double quote $@
In-Reply-To: <20180221234854.u46pcpr4heesrzim@archlinux>
References: <20180221205555.2728-1-gael.portay@savoirfairelinux.com>
 <20180221221316.5ff3a77a@windsurf.lan>
 <20180221234854.u46pcpr4heesrzim@archlinux>
Message-ID: <20180222164949.7192bb6e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 18:48:54 -0500, Ga?l PORTAY wrote:

> > Could you give more details about what this is fixing, i.e a specific
> > scenario that is fixed by this patch ?  
> 
> In the case pkgconf, I can not see a real situation where this patch
> fixes an issue.
> 
> There is an important difference between $@ and "$@". The shell expands
> "$@" as "$1" "$2" "$3"... while it expands $@ as $1 $2 $3.
> 
> With the second form, we losts spaces in positional parameters.
> 
> As example, the following call
> 
> 	pkg-config --cflags "one two" three
> 
> is wrapped as
> 
> 	pkgconf --cflags one two three
> 
> while we are expecting
> 
> 	pkgconf --cflags "one two" three
> 
> "$@" is really useful when writing wrappers. It passes the positional
> arguments *as* they are given.

OK, thanks for the explanation, makes sense. A better commit log would
definitely help :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
