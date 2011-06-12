From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jun 2011 21:59:29 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
	disable}-{shared, static} automatically
In-Reply-To: <dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 30 May 2011 23:57:02 +0200")
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87k4cq7rdq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For target packages, depending on BR2_PREFER_STATIC_LIB, add the
 Thomas> correct combination of --{enable,disable}-{shared,static} flags to
 Thomas> ./configure calls.

 Thomas>   * When BR2_PREFER_STATIC_LIB is enabled, we pass --enable-static
 Thomas>   --disable-shared.

 Thomas>   * When BR2_PREFER_STATIC_LIB is disabled, we pass --enable-static
 Thomas>   --enable-shared. We enable static libraries since they can still be
 Thomas>   useful to statically link applications against some libraries
 Thomas>   (sometimes it is useful for size reasons). Static libraries are
 Thomas>   anyway only installed in the STAGING_DIR, so it doesn't increase in
 Thomas>   any way the size of the TARGET_DIR.

But it does mean that autotools stuff now gets built twice, increasing
the build time..

-- 
Bye, Peter Korsgaard
