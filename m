From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jul 2016 00:13:59 +0200
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on
	distclean
In-Reply-To: <20160711202206.GA5122@free.fr> (Yann E. MORIN's message of "Mon, 
 11 Jul 2016 22:22:06 +0200")
References: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
 <20160711032615.GJ3870@tarshish> <20160711163446.GB3734@free.fr>
 <87a8ho9c2p.fsf@dell.be.48ers.dk> <20160711202206.GA5122@free.fr>
Message-ID: <87furf961k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > ... we could (should?) consider that dl/ is a special case. It really
 > holds content that can be difficult to retrieve.

 > Think of a tarball made from a git clone from a Linux kernel for
 > example. This can be really costly to download, especially on slow
 > links. For example:

 > Downloaded  Repo
 > -----------------------------------------------------------------------------
 > 1.02 GiB    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 > 1.43 GiB    git://github.com/raspberrypi/linux.git


 > But Oh well... I'm not impacted as I have BR2_DL_DIR in my environment
 > pointing somehwere else and reliable... I find it just sad that
 > unsuspecting users, especially newcomers) would hit that when told to
 > start over from scratch...

But aren't those people using 'make clean' instead of 'make distclean'?
They should.

-- 
Venlig hilsen,
Peter Korsgaard 
