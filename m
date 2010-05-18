From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 May 2010 13:47:04 +0200
Subject: [Buildroot] [PATCH 12/12] netsnmp: disable build with external
	toolchain
In-Reply-To: <0b3a9a65f581c1cc9998e491dfd54cd5aa407448.1273965305.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 16 May 2010 01:15:37 +0200")
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<0b3a9a65f581c1cc9998e491dfd54cd5aa407448.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y6fhxwhz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> There is a build problem with netsnmp on external toolchain that isn't
 Thomas> easy to fix: libtool strips the --sysroot that we are passing it,
 Thomas> which make the link step fail.

 Thomas> In preparation for the release, just make sure this package isn't
 Thomas> visible to external toolchain users. Of course, on the long run, we
 Thomas> should fix this.

Hmm, yeah. We'll need to do the same for BR2_PACKAGE_QUAGGA_SNMP then.

Maybe a comment "netsnmp is broken with external toolchain" would be
good.

-- 
Bye, Peter Korsgaard
