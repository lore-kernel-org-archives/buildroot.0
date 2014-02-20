From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 19:07:33 +0100
Subject: [Buildroot] [PATCH] icu: not available when BR2_BINFMT_FLAT is
	used
In-Reply-To: <1392903165-8858-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Feb 2014 14:32:45 +0100")
References: <1392903165-8858-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvndy7x6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > icu does not recognize 'uclinux' as a supported platform. While making
 > it recognize uclinux is easy, there is another problem down the road:
 > icu does very weird things to generate an ELF library containing
 > static data (libicudata.a), and the generated library being ELF, it is
 > not compatible with the FLAT binary format expected by uclinux
 > platforms such as Blackfin in FLAT format.

 > Therefore, we simply disallow the selection of icu on FLAT
 > platforms.

 > Note that adding a dependency on BR2_BINFMT_ELF doesn't work, because
 > BR2_BINFMT_FDPIC is considered to be separate (even if technically
 > FDPIC is a derivative of ELF). That's why the dependency we're adding
 > is "depends on !BR2_BINFMT_FLAT" and not "depends on BR2_BINFMT_ELF".

 > Fixes:

 >   http://autobuild.buildroot.org/results/b41/b415fed7fae4012bad7d8b53a481bd71bdab716f/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
