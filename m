From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 29 Jun 2011 11:12:41 +0200
Subject: [Buildroot] [RFC PATCH v2]kernel-patch.sh: script changed to
	support archives in a proper way
In-Reply-To: <1968dad8075f5f4a269aa905e5e07d1138acd7a0.1305713224.git.ludovic.desroches@atmel.com>
References: <1968dad8075f5f4a269aa905e5e07d1138acd7a0.1305713224.git.ludovic.desroches@atmel.com>
Message-ID: <1309338762-17200-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the second version of this script. Sadly the first one was not working from a from scrath build ie downloading buildroot source code, patching it andrunning the build. The first patch was tested only with a make clean and the behavior was not the same since filesystem build was ok.

So this new patch has been tested from a clean buildroot directory and corrected the errors of the previous one. It was used to compile the crosstool chain, a root file system and a kernel whose patches were into a tar.gz archive. This last point was the purpose of this patch. Without it, the patches into the archive were not applied in the right order.

I am far to be a bash guru so if you see any improvements please tell me. Thanks.

Regards,

Ludovic
