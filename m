From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2013 21:33:03 +0200
Subject: [Buildroot] [PATCH v2 1/2] logrotate: needs mmu
In-Reply-To: <1380595993.4979.0.camel@phoenix> (Axel Lin's message of "Tue, 01
 Oct 2013 10:53:13 +0800")
References: <1380595993.4979.0.camel@phoenix>
Message-ID: <871u44vlao.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel> v2: Fix trivial typo in the subject line

 Axel> Fix below build error:

 Axel> logrotate.o: In function `switch_user_permanently':
 Axel> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:129: undefined reference to `fork'
 Axel> logrotate.o: In function `removeLogFile':
 Axel> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:431: undefined reference to `fork'
 Axel> logrotate.o: In function `mailLog':
 Axel> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:597: undefined reference to `fork'
 Axel> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:615: undefined reference to `fork'
 Axel> logrotate.o: In function `compressLogFile':
 Axel> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:533: undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[1]: *** [logrotate] Error 1

Committed with this added to the commit message, thanks.

-- 
Bye, Peter Korsgaard
