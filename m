From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 May 2017 14:20:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-12
In-Reply-To: <20170513063125.BA761220BB@mail.free-electrons.com>
References: <20170513063125.BA761220BB@mail.free-electrons.com>
Message-ID: <dc955255-c483-c69b-588f-be53ad896fe3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 13/05/2017 ? 08:31, Thomas Petazzoni a ?crit :
> Hello,
> 
> Build statistics for 2017-05-12
> ================================
> 
>       successes : 232
>        failures : 22 
>        timeouts : 0  
>           TOTAL : 254
> 
> Classification of failures by reason
> ====================================
> 
>                  opencv3-3.2.0 | 8 
>                   libcdio-0.94 | 3 
>              rabbitmq-c-v0.8.0 | 2 
> uclibc-ng-test-c9b9876cefc1... | 2 
>                domoticz-3.5877 | 1 
>                     ffmpeg-3.3 | 1 
>                   libcec-4.0.2 | 1 
>                  mplayer-1.3.0 | 1 
> openblas-f04af36ad0e85b64f1... | 1 
>                       qt-4.8.7 | 1 
>                qt5webkit-5.8.0 | 1 
> 
> 
> Detail of failures
> ===================
> 

>        nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/d61c8d169fc070271114a515159650f7a0f333c0 |     
>          arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/22295711046c519df44d5d976e0bfcae1f006e5a |     

uclibc-ng broken with glibc 2.25 due to pthread_cond_t changes introduced by [1].
Waldemar has disabled this test (tst-cond22) with glibc based toolchain [2] but
the current uclibc-ng-test package doesn't contain this patch.

[1]
https://sourceware.org/git/?p=glibc.git;a=commit;h=ed19993b5b0d05d62cc883571519a67dae481a14
[2]
https://gogs.waldemar-brodkorb.de/linux/uclibc-ng-test/commit/787e584f18afc967d91cfe1a8443df2657579ecb

Best regards,
Romain

> 
