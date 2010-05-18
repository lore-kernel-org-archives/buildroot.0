From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 May 2010 13:43:14 +0200
Subject: [Buildroot] [PATCH 09/12] lvm2: do not override CC and similar
	variables
In-Reply-To: <c942391bf42f025ad15a7401e753d72a4b40d1b3.1273965305.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 16 May 2010 01:15:34 +0200")
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<c942391bf42f025ad15a7401e753d72a4b40d1b3.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739xpzb8t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since lvm2 uses autoconf, there's no point in overriding CC and
 Thomas> other variables at build time. This causes build breakage as
 Thomas> CFLAGS aren't used at link time, therefore --sysroot lacks,
 Thomas> which breaks the build with external toolchains.

Thanks. Is there anything stopping us from converting it to
Makefile.autotools.in format?

-- 
Bye, Peter Korsgaard
