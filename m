From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:37:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with expat
In-Reply-To: <CAPi7W81GM5+T7iaqAFajZzjn_NWVLQfi=z8vGxpGAU67KX7M4w@mail.gmail.com>
References: <20190929084004.21350-1-fontaine.fabrice@gmail.com>
 <20190930234632.697b127d@windsurf.home>
 <CAPi7W81GM5+T7iaqAFajZzjn_NWVLQfi=z8vGxpGAU67KX7M4w@mail.gmail.com>
Message-ID: <20191005223747.4cdc2ee9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Oct 2019 08:42:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Maybe it's because it's late and I'm no longer thinking properly, but
> > do you understand how disabling expat prevents the cldr program from
> > being built, and therefore the tbl2hex utility tool from being built ?
> > They seem to be unconditionally built by Programs/Makefile.in.  
> cldr.c is mostly an empty shell without expat as most of the code is
> protected by ifdef HAVE_EXPAT blocks, see
> https://github.com/brltty/brltty/blob/aba3d8cc2dc765a0933aabb609928e568e085d39/Programs/cldr.c.

OK, but where is the logic that links with -lexpat when it's available,
and doesn't link with -lexpat when not available ? I'm a bit confused
by the build logic of this package I must say.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
