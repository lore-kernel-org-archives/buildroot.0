From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 23:18:11 +0100
Subject: [Buildroot] [PATCH v2] gdb: specify where to find lzma libraries
In-Reply-To: <1457691393-48436-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 11 Mar 2016 10:16:33 +0000")
References: <1457691393-48436-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87twkadnto.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > As reported in...
 >   https://bugs.busybox.net/show_bug.cgi?id=8786

 > ..., gdb fails to build with xz and expat support at the same time when
 > using an external toolchain.

 > This is how the problem is shown:

 > checking for liblzma... no
 > configure: error: missing liblzma for --with-lzma

 > And having a deeper look in gdb/config.log we can se a message like this
 > one:

 > /lib64/liblzma.so.5: undefined reference to `clock_gettime at GLIBC_2.17'

 > As Thomas said in the bug report quoted above, that error is related to
 > the fact that it find the host's lzma.

 > Adding --with-lzma-prefix=$(STAGING_DIR)/usr to GDB_CONF_OPTS fixes the
 > problem.

 > Credit-to: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v1 -> v2:
 >  - Adding --with-lzma-prefix=$(HOST_DIR)/usr to GDB_CONF_OPTS is wrong.
 >    Instead, we should add --with-lzma-prefix=$(STAGING_DIR)/usr. Thanks
 >    to Peter Korsgaard for highlighting the mistake.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
