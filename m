From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Sep 2013 12:58:14 +0200
Subject: [Buildroot] [PATCH] vsftpd: Fix dependency for needs mmu
In-Reply-To: <1378534043.18257.3.camel@phoenix> (Axel Lin's message of "Sat,
 07 Sep 2013 14:07:23 +0800")
References: <1378534043.18257.3.camel@phoenix>
Message-ID: <87ppsfsjzt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Commit 2eb995759 "vsftpd: needs mmu" adds "depends on BR2_TOOLCHAIN_HAS_THREADS".
 Axel> The build error is:
 Axel> sysutil.c:(.text+0x37ac): undefined reference to `fork'

 Axel> Thus it should depend on BR2_USE_MMU rather than BR2_TOOLCHAIN_HAS_THREADS.

Indeed:

grep -rls pthread output/build/vsftpd-3.0.2/

grep -rls fork output/build/vsftpd-3.0.2/
output/build/vsftpd-3.0.2/Changelog
output/build/vsftpd-3.0.2/SPEED
output/build/vsftpd-3.0.2/sysdeputil.h
output/build/vsftpd-3.0.2/ssl.c
output/build/vsftpd-3.0.2/ptracesandbox.c
output/build/vsftpd-3.0.2/twoprocess.c
output/build/vsftpd-3.0.2/postprivparent.c
output/build/vsftpd-3.0.2/sysutil.h
output/build/vsftpd-3.0.2/SECURITY/TRUST
output/build/vsftpd-3.0.2/standalone.c
output/build/vsftpd-3.0.2/sysdeputil.c
output/build/vsftpd-3.0.2/sysutil.c

Committed, thanks.

-- 
Bye, Peter Korsgaard
