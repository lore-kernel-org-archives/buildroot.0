From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 21 Mar 2012 14:26:26 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to
	apply patches in proper order
In-Reply-To: <87k42e5nt8.fsf@macbook.be.48ers.dk>
References: <87k42e5nt8.fsf@macbook.be.48ers.dk>
Message-ID: <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Please find a fix for the issue you have encountered.

At the beginning, recursivity was present into this set of patches but was
removed since I have no real case needing it. I was thinking at this kind of
tarball. So I put it again and do the corrections necessary for this feature:
- Only .patch* and .diff* files are considered as valid patches. The wildcard
at the end is for case such as .patch.arm for example.
- Remove strip-components option which is no more necessary since we no more
skip directories.

I have tested it with liblockfile and by building a rootfs for my target with
a tarball containing patches for the kernel.


Regards

Ludovic
