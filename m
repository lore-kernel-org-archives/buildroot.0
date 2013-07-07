From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 21:36:55 +0200
Subject: [Buildroot] [PATCH] iptables: fix build after linux-headers
	changes
In-Reply-To: <1373123930-15389-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Jul 2013 17:18:50 +0200")
References: <1373123930-15389-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li5ii2lk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As reported by 'scanf' on IRC, the iptables now fails to build
 Thomas> because of a missing <asm/cache.h> header in the kernel
 Thomas> headers. The package directly uses $(LINUX_HEADERS_DIR), which
 Thomas> is not correct: this is the source directory of the kernel, not
 Thomas> where they are installed, and in addition, this directory is
 Thomas> empty/does not exist when using external toolchains.

 Thomas> Instead, we use $(STAGING_DIR)/usr, which contains the kernel
 Thomas> headers, as part of the toolchain headers.

Committed, thanks.

-- 
Bye, Peter Korsgaard
