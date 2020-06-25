From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 25 Jun 2020 20:09:12 +0200
Subject: [Buildroot] [PATCH 3/3] wireless-regdb: omit author info from
 private key in home directory
In-Reply-To: <20200618222836.5384fe64@windsurf.home>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
 <20200612053110.15316-4-dev.kurt@vandijck-laurijssen.be>
 <20200618222836.5384fe64@windsurf.home>
Message-ID: <20200625180912.GB23969@x1.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

On do, 18 jun 2020 22:28:36 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 12 Jun 2020 07:31:10 +0200
> Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> wrote:
> 
...
> > +-REGDB_PRIVKEY ?= ~/.wireless-regdb-$(REGDB_AUTHOR).key.priv.pem
> > ++REGDB_PRIVKEY ?= ~/.wireless-regdb.key.priv.pem
> > + REGDB_PUBKEY ?= $(REGDB_AUTHOR).key.pub.pem
> > + 
> > + REGDB_UPSTREAM_PUBKEY ?= sforshee.key.pub.pem
> 
> All patches need a description and Signed-off-by line. But what about
> passing REGDB_AUTHOR=buildroot from wireless-regdb.mk, or something
> like that ?

I'm in the process of discovering that the crda-less system
requires the keys in the kernel (a good choice) which can best
be accomplished by your suggestion here.

I have a few things for a rework
1. put some more comments
2. avoid a python3 patch and use python-m2crypto.
3. prepare for an explicit priv key for both wireless-regdb and kernel

Thanks for the review.
Kurt
