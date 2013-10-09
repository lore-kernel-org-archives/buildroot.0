From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:21:26 +0200
Subject: [Buildroot] [PATCHv3 08/20] toolchain-external: conditionalize
	the installation of libraries
In-Reply-To: <1381256237-27948-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:05 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqlm37hl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The external toolchain code makes the assumption that all C libraries
 Thomas> have a ld*.so, libc.so, libcrypt.so, libdl.so, libgcc_s.so, libm.so,
 Thomas> libnsl.so, libresolv.so, libutil.so, and when thread support is
 Thomas> enabled, libpthread.so, etc.

 Thomas> However, this is not the case with the musl C library, which
 Thomas> integrates all the functionalities in a single libc.so file. In
 Thomas> preparation of the support of the musl library, we make the current
 Thomas> value of LIB_EXTERNAL_LIBS conditional to glibc or uClibc.

 Thomas> The addition of additional libraries through
 Thomas> BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS is kept outside the condition, at
 Thomas> the end.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
