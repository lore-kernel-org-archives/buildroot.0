From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:45:03 +0200
Subject: [Buildroot] [PATCH] gdb: add fix for gdb 7.12 and gdb 8.0 build
	on noMMU platforms
In-Reply-To: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 3 Aug 2017 09:15:48 +0200")
References: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87pob4keg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This adds a patch to gdb 7.12 and gdb 8.x, which fixes the build on
 > noMMU platforms. It is not needed for older versions of gdb, since
 > it's related to the switch of gdb to C++ in the 7.12 release.

 > Fixes:

 > ../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
 > ../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
 >        child_stack = xmalloc (STACK_SIZE * 4);

 > The patch has already been merged upstream, as of commit
 > ffce45d2243e5f52f411e314fc4e1a69f431a81f, and will therefore be part
 > of future gdb releases.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x after dropping the gdb-8.x patch, thanks.

-- 
Bye, Peter Korsgaard
