From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:58:43 +0200
Subject: [Buildroot] [PATCH v2] libpfm4: needs NPTL support
In-Reply-To: <1411040960-24270-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 18 Sep 2014 15:49:20 +0400")
References: <1411040960-24270-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87egv866q4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Fixes following build failure:
 ---> ---
 > self_smpl_multi.c: In function 'my_thread':
 > self_smpl_multi.c:354:2: error: implicit declaration of function 'pthread_barrier_wait' [-Werror=implicit-function-declaration]
 >   pthread_barrier_wait(&barrier);
 >   ^
 > self_smpl_multi.c: In function 'main':
 > self_smpl_multi.c:450:2: error: implicit declaration of function 'pthread_barrier_init' [-Werror=implicit-function-declaration]
 >   pthread_barrier_init(&barrier, 0, max_thr+1);
 >   ^
 > cc1: all warnings being treated as errors
 ---> ---

 > And since xtensa, avr32 and bfin don't support NPTL we may remove arch
 > dependencies as well.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>
 > ---

 > In v2 architecture dependencies were removed as suggested by Baruch.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
