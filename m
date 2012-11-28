From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Nov 2012 11:37:04 -0800
Subject: [Buildroot] [PATCH] gdb: properly pass the PATH when building
	gdb for the host
In-Reply-To: <1354120492-17059-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 28 Nov 2012 17:34:52 +0100")
References: <1354120492-17059-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738ztzfhb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When building gdb for the host, we properly pass the PATH (through
 Thomas> HOST_CONFIGURE_OPTS) during the configure step, but we forget to do so
 Thomas> for the compilation step.

 Thomas> The result of this is that when the Crosstool-NG backend is used, gawk
 Thomas> is built and installed in $(HOST_DIR), as a dependency of the
 Thomas> crosstool-ng package.

 Thomas> Then, the host gdb configure script detects this gawk binary
 Thomas> ($(HOST_DIR) is in the PATH), and assumes gawk is
 Thomas> available. Unfortunately, during the compilation step, it fails to
 Thomas> find the expected gawk binary, because $(HOST_DIR) is no longer in the
 Thomas> PATH. This causes the following build failure:

 Thomas>   http://autobuild.buildroot.org/results/067d0c2ea01673ba98ec11de2426f1ab92dac800/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
