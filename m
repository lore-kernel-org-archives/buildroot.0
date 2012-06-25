From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jun 2012 10:50:21 +0200
Subject: [Buildroot] [PATCH] php: force cross-compilation
In-Reply-To: <20120625100641.7850a1a2@skate> (Thomas Petazzoni's message of
 "Mon, 25 Jun 2012 10:06:41 +0200")
References: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y5ndbxgl.fsf@macbook.be.48ers.dk> <20120625091219.539a3740@skate>
 <87k3yv95r9.fsf@macbook.be.48ers.dk> <20120625100641.7850a1a2@skate>
Message-ID: <877guv93n6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 25 Jun 2012 10:04:42 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> True. Looking at the autobuilder results it seems htop has a similar
 >> problem (I don't quite understand why it cannot find /proc/stat on your
 >> builder though):
 >> 
 >> http://autobuild.buildroot.net/results/7d670efa247dfcbcbf6cd088d1157779af441333/build-end.log

 Thomas> I'm building in a chroot, and I don't have /proc mounted. I'm
 Thomas> not sure it's a useful scenario to support?

Hmm, we could fix this particular problem similar to how you did for
php, but chances are other native tools would want to poke in /proc. Any
specific reason you cannot mount /proc to get a more representative
setup?

-- 
Bye, Peter Korsgaard
