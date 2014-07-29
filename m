From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Jul 2014 16:14:03 +0200
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.7.
In-Reply-To: <20140329093208.GA3227@free.fr> (Yann E. MORIN's message of "Sat, 
 29 Mar 2014 10:32:08 +0100")
References: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140329093520.5318ada7@skate> <20140329093208.GA3227@free.fr>
Message-ID: <87lhrc8d78.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Are you sure Linux headers >= 3.7 are sufficient? I'm looking at the
 >> build failure at
 >> http://autobuild.buildroot.org/results/ad3/ad3b4003dc50582a493f1156234d83652104a6bf/build-end.log,
 >> and it looks like missing kernel definitions, even though the toolchain
 >> apparently uses 3.7 kernel headers, as far as I can see.

 > No, they were introduced in 3.8.

 > What's confusing is that the changesets were done on a v3.7-rc* tree,
 > so when one git-blames the affected file, checkouts the changeset with
 > the chagnes, and looks at Makefile, one will see 3.7-rc1. But they
 > eventually landed in 3.8.

Old mail, but I only got to read it now.

You need to use git describe --contains <hash> to see the first git tag
containing that change, E.G.:

git describe --match v3.\*  --contains  0974658da47cb399b76794057823bf3cd22acf3
v3.8-rc1~139^2~384

(I have a linux-next remote here, so it would match on the next
tag instead unless I use --match).

E.G. this was merged 139 commits before 3.8-rc1 was tagged.

-- 
Bye, Peter Korsgaard
