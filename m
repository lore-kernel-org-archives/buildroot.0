From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jul 2009 22:41:11 +0200
Subject: [Buildroot] [PATCH 1/2] target/ubifs: fix compilation
In-Reply-To: <20090720122227.GW13236@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 20 Jul 2009 14\:22\:27 +0200")
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<87fxcsg41p.fsf@macbook.be.48ers.dk>
	<20090720122227.GW13236@buzzloop.caiaq.de>
Message-ID: <87hbx7dr4o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> We'll also need to remove the 'depends on BROKEN' from Config.in

 Daniel> Ok, done.

Great.

 >> Why the backslashes? Wget here adds them to the URL:
 >> 
 >> --2009-07-19 15:54:50--
 >> http://git.infradead.org/mtd-utils.git?a=snapshot%5C;h=HEAD%5C;sf=tgz
 >> 
 >> Which obviously fails.

 Daniel> Argh. Done, thanks.

You're welcome.

 >> We have MAKE1 for this.

 Daniel> Fixed.

Ok.

 >> The build breaks if you don't have liblzo development headers on the
 >> build host:

 Daniel> Hmm. What's your propose to check that? We can't depend on a
 Daniel> config flag to be set, and building that liblzo-dev package
 Daniel> manually doesn't seem to be the right ay to go either.

I propose we do exactly the same as we do for mkfs.jffs2 - E.G. use
the source selection / infrastructure from package/mtd/mtd-utils.mk
and build lzo for the host.

 >> I really think the proper solution is to build the ubifs tools for the
 >> host in the mtd-utils package like we do for mkfs.jffs2. Now, if the
 >> mtd guys would put out a 1.3 release with all the new stuff it would
 >> be even better.

 Daniel> Which wouldn't solve the above problem, right? When there's a new
 Daniel> release, I'll have another look at it :)

It would. Please have a look at how it is done for mkfs.jffs2. It's
currently a bit messy as we support 2 mtd-utils versions, which would
get solved if they would do a proper release with ubifs support.

 >> Care to fix this and resend?

 Daniel> See the patch below.

Thanks. I would still like to see the logic moving to package/mtd so
we don't duplicate the download step / selection logic here.

-- 
Bye, Peter Korsgaard
