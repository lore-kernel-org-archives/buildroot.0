From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Jan 2011 16:23:44 +0100
Subject: [Buildroot] [PATCH 1/1] tcpdump,
	libpcap: simplify and fix ac_cv_linux_vers
In-Reply-To: <397ba8b1856a2465105b4a12e7500e50cc11768c.1295945207.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 25 Jan 2011 09:46:58 +0100")
References: <cover.1295945207.git.thomas.petazzoni@free-electrons.com>
	<cover.1295945207.git.thomas.petazzoni@free-electrons.com>
	<397ba8b1856a2465105b4a12e7500e50cc11768c.1295945207.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739ohovlr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For some reason, tcpdump and libpcap need to have some information
 Thomas> about the kernel version being used. This information is passed using
 Thomas> the ac_cv_linux_vers autoconf variable.

 Thomas> However, the current value is determined using
 Thomas> BR2_DEFAULT_KERNEL_HEADERS which is only defined when an internal
 Thomas> Buildroot toolchain is used. So it would break with an external
 Thomas> toolchain or the Crosstool-NG backend.

 Thomas> According to Mike Frysinger at
 Thomas> http://lists.busybox.net/pipermail/buildroot/2011-January/040861.html,
 Thomas> this value is only used to determine if the kernel version is 0.x, 1.x
 Thomas> or 2.x, so passing ac_cv_linux_vers=2 is sufficient since Buildroot
 Thomas> only supports the 2.6 kernel anyway.

Committed, thanks.

-- 
Bye, Peter Korsgaard
