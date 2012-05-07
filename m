From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 May 2012 21:41:47 +0200
Subject: [Buildroot] [PATCH] gdb: fix target gdb build when host-gawk is
	built before
In-Reply-To: <1336397308-7195-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 7 May 2012 15:28:28 +0200")
References: <1336397308-7195-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874nrrkcck.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When the crosstool-ng backend is used, host-gawk is built as a
 Thomas> dependency of the crosstool-ng package, and therefore an host 'gawk'
 Thomas> binary is installed in $(HOST_DIR).

 Thomas> When the target gdb package is also selected, this unfortunately leads
 Thomas> to a build failure, as reported on
 Thomas> http://buildroot.humanoidz.org/results/f19c0499d08212d8b5100fa9434e1197092957db/build-end.log.

 Thomas> The problem is that the ./configure of gdb detects gawk in the PATH,
 Thomas> but at compile time, it gdb fails to find gawk. This is due to the

I've dropped 'gdb' from this line. Committed, thanks.

-- 
Bye, Peter Korsgaard
