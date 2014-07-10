From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 11:33:18 +0200
Subject: [Buildroot] [PATCH] toolchain-external: remove experimental
	Blackfin toolchain
In-Reply-To: <1404940822-16564-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 9 Jul 2014 23:20:22 +0200")
References: <1404940822-16564-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbr5r21t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The 2014R1 toolchain is provided in two flavours by Analog Devices:
 > one based on gcc 4.3.x, which is considered stable, and one based on
 > gcc 4.5.x, considered experimental. In commit
 > 5a65b8e185fab38824da5e9b7b5b9e781e31d368 ("toolchain-external: add ADI
 > Blackfin 2014R1 toolchain, remove 2012R1") both variants were added.

 > However, after some testing in the autobuilders, and discussion with
 > the Analog Devices folks, it turns out that the experimental version
 > of the toolchain is too experimental. It causes numerous build
 > failures, and the Analog Devices folks clearly say that it's an early
 > release and that they expect quite a few problems to show up.

 > Therefore, this commit removes the experimental flavor and keeps only
 > the stable variant. Note that the removal/renaming of the Config.in
 > options is not a problem, since those options were added after the
 > 2014.05 release.

And the 2014R1 version is the default version, so .configs with
2014R1_GCC43 will automatically move to 2014R1.

Committed, thanks.

-- 
Bye, Peter Korsgaard
