From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 10:24:08 +0200
Subject: [Buildroot] [PATCH v3 02/10] uclibc: context functions are not
	Thumb-compatible
In-Reply-To: <1459450815-6494-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 31 Mar 2016 21:00:07 +0200")
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vb3spkyf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > On platforms that do support the ARM instruction set, there is no
 > problem, as the context functions are built unconditionally in ARM
 > mode.

 > However, on platforms that only support the Thumb instruction set, the
 > context functions cannot be built since the assembler code is not
 > Thumb-ready. Therefore, these functions must be disabled on such
 > platforms. All Thumb1 platforms support ARM instructions, so this is
 > only relevant for Thumb2-only platforms (i.e., Cortex-M).

 > Note that some packages require the context functions, so these will
 > fail to build on these platforms. It is worth mentioning that musl
 > also doesn't provide the context functions, and those are rarely
 > used. Affected packages will be handled in later patches.

Reworded the commit message slightly and committed, thanks.

-- 
Bye, Peter Korsgaard
