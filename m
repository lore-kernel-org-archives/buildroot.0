From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:43:20 +0200
Subject: [Buildroot] [PATCH] rabbitmq-c: openssl/popt sub-options don't
	work in stat_ic linking
In-Reply-To: <1494796962-24132-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 May 2017 23:22:42 +0200")
References: <1494796962-24132-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h90j43kn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > rabbitmq-c currently fails to build in a number of static linking
 > situations, due to two issues:

 >  - CMake FindOpenSSL module is buggy. Even though it uses pkg-config,
 >    it doesn't use the information returned by pkg-config, and
 >    therefore doesn't know about second order libraries that need be
 >    part of the link for static linking to succeed. Due to this, -lz is
 >    not passed, and therefore rabbitmq-c fails when linking against
 >    libssl/libcrypto. This issue has been reported to upstream CMake at
 >    https://gitlab.kitware.com/cmake/cmake/issues/16885.

 >  - popt might use libintl, but CMake doesn't know about that. For
 >    autotools based packages, we typically work around this by passing
 >    LIBS=, but CMake apparently has no equivalent to LIBS=.

 > To workaround this, we only use the OpenSSL and Popt optional
 > dependencies in dynamic linking situations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/798dbe5e5fd0463bb2066cb115656795144c327f/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
