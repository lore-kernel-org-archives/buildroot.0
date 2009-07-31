From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Jul 2009 15:32:40 +0200
Subject: [Buildroot] [PATCH 3/3] coreutils: add TODO note about
	stripping the installed binaries
In-Reply-To: <385e9e4ea5d66bb6d7189f818f6b28c3df32f277.1249045363.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	31 Jul 2009 15\:02\:47 +0200")
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<385e9e4ea5d66bb6d7189f818f6b28c3df32f277.1249045363.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871vnxugef.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> +- coreutils: use make install-strip to install the
 Thomas> +packages. For now, it fails beause even if we pass
 Thomas> +STRIP="/path/to/$(ARCH)-strip", the coreutils build system
 Thomas> +uses the host strip to strip target binaries. The
 Thomas> +./configure execution done by Buildroot properly detects the
 Thomas> +cross-strip, but when running make, build-aux/missing gets
 Thomas> +run, complains about aclocal-1.10c and atuomake-1.10c not
 Thomas> +being present, and rerun the configuration... with the wrong
 Thomas> +environment variables (STRIP= is missing). An autoreconf on
 Thomas> +this package is probably necessary.

We should actually rework the strip stuff as it doesn't make much
sense to both do strip at package install time and just before
generating the file systems.

We would probably simplify stuff a bit to always use install /
install-exec and only strip at the end if wanted.

-- 
Bye, Peter Korsgaard
