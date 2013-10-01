From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 09:32:49 +0200
Subject: [Buildroot] [PATCH 1/2] logrotate: nees mmu
In-Reply-To: <1380594702.9353.1.camel@phoenix>
References: <1380594702.9353.1.camel@phoenix>
Message-ID: <20131001093249.6a135a15@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Tue, 01 Oct 2013 10:31:42 +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Fix below build error:
> 
> logrotate.o: In function `switch_user_permanently':
> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:129: undefined reference to `fork'
> logrotate.o: In function `removeLogFile':
> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:431: undefined reference to `fork'
> logrotate.o: In function `mailLog':
> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:597: undefined reference to `fork'
> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:615: undefined reference to `fork'
> logrotate.o: In function `compressLogFile':
> /opt/test/buildroot/buildroot/output/build/logrotate-3.8.4/logrotate.c:533: undefined reference to `fork'
> collect2: ld returned 1 exit status
> make[1]: *** [logrotate] Error 1

It's a minor comment, but I believe the log of the error could go
within the commit log itself (i.e, before the --- separator). It really
is part of the explanation of why the change is needed.

Note that there is no need to resend this patch just for this reason,
it was merely a suggestion for future patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
