From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 May 2013 13:13:01 +0200
Subject: [Buildroot] [PATCH 03/20] elf2flt: fix build when zlib is not
	installed on the host
In-Reply-To: <1369606110-8088-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:13 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y5b0d6bm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For a reason that's fairly unclear to me, Peter added a '-lz' link
 Thomas> flag to the elf2flt.mk build in d5664ee99 ("elf2flt: fix link").

I also don't recall the details anymore.

 Thomas> However, the zlib library may not necessarily be installed on the host
 Thomas> machine, so we should depend on host-zlib, and pass the appropriate
 Thomas> LDFLAGS. This is what this patch does.

Committed, thanks.

 Thomas> ---
 Thomas> Note: I already have a patch that converts elf2flt to the package
 Thomas> infrastructure, but I am waiting to have the patches to make the
 Thomas> entire internal toolchain logic use the package infrastructure to send
 Thomas> them.

Ok.

-- 
Bye, Peter Korsgaard
