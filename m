From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Mar 2012 10:47:14 +0200
Subject: [Buildroot] [PATCH] Fix problem with undefined umode_t type in
	3.3 kernel headers
In-Reply-To: <1332580484-4489-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sat, 24 Mar 2012 09:14:44 +0000")
References: <1332580484-4489-1-git-send-email-spdawson@gmail.com>
Message-ID: <87wr63g5f1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> The 3.3 kernel headers define the umode_t type within a
 spdawson> __KERNEL__ preprocessor ifdef region. This results in a
 spdawson> broken kernel header in the buildroot toolchain.

Committed, thanks. It seems socat/syslinux should get updated to not
include this header, but as there's no upstream releases fixing this it
makes sense to add it for now.

-- 
Bye, Peter Korsgaard
