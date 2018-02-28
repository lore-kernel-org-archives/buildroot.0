From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 09:29:40 +0100
Subject: [Buildroot] Trouble with offline build
In-Reply-To: <20180228075533.564a23b7@windsurf.home> (Thomas Petazzoni's
 message of "Wed, 28 Feb 2018 07:55:33 +0100")
References: <CAMd7AX_bD6b4c2xhnsWPicPCETk9z3bDP4yT9k3Jpd9Op1F8tA@mail.gmail.com>
 <20180228045310.bugxi5bb3w2djjaa@tarshish>
 <20180228075533.564a23b7@windsurf.home>
Message-ID: <87a7vtldor.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > To be honest, I don't really see how to solve that problem. the
 > host-{cmake,lzip,xzcat,tar} issue could probably be solved by
 > downloading all of them even if some of them won't be needed (we may
 > have a "make all-source" that differs from "make source" to avoid "make
 > source" from downloading useless stuff). However, for the host
 > architecture difference, I'm not sure how to proceed, and I'm not sure
 > there is a reasonable solution.

 > Bottom line: should we document/make it clear that doing a "make
 > source" on machine A and then do a build on machine B is not
 > guaranteeing a fully offline build ? It's a bit of a pity, because I
 > know there are some environment where only a given machine has Internet
 > access, and the developer machines don't, but I don't see a good way of
 > solving this in Buildroot.

Me neither. Historically, make source was meant to ensure that
everything is downloaded now so you could go offline and continue
building _ON_THE_SAME_MACHINE_. This potentially does indeed break down
if you try to reuse the download directory on another machine, but I
don't quite see how we can solve this for all situations.

-- 
Bye, Peter Korsgaard
