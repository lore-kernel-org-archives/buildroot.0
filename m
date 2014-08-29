From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Aug 2014 09:16:21 +0200
Subject: [Buildroot] [PATCH 2/3] ruby: should not use dl_iterate_phdr()
	on Blackfin
In-Reply-To: <1409264259-13058-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 29 Aug 2014 00:17:38 +0200")
References: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1409264259-13058-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4u7rcje.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The dl_iterate_phdr() C library function on Blackfin returns a
 > non-conventional structure format compared to other architectures,
 > which makes Ruby unable to use it. Since it's just an optional feature
 > of Ruby apparently used to generate more fancy backtraces, this commit
 > simply disables the usage of dl_iterate_phdr() on this architecture.

 > Fixes:

 >   http://autobuild.buildroot.org/results/1b0/1b0e2f5f95889eb26846927da45d128247d0ed89/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
