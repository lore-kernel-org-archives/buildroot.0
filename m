From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 08:02:28 +0100
Subject: [Buildroot] [PATCH] package/binutils: xtensa: fix
 shrink_dynamic_reloc_sections
In-Reply-To: <20190329015133.9535-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Thu, 28 Mar 2019 18:51:33 -0700")
References: <20190329015133.9535-1-jcmvbkbc@gmail.com>
Message-ID: <87zhpejh8b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > This fixes the following build error caused by link-time relaxation
 > removing copies of literals that reference undefined weak symbols with
 > PLT entries created due to -rdynamic option passed to g++ link command:

 >   ld: BFD (GNU Binutils) 2.31.1 internal error, aborting at
 >   elf32-xtensa.c:3292 in elf_xtensa_finish_dynamic_sections

 > Fixes:
 > http://autobuild.buildroot.net/results/d41/d41aae8a448c316187f9fbde40f1d077182bb244/
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
