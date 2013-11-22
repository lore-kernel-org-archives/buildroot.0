From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 09:15:52 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <528E86DE.7020307@mind.be>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
 <20131121181248.3c606028@skate> <528E8110.10406@mind.be>
 <20131121230011.040fe161@skate> <528E86DE.7020307@mind.be>
Message-ID: <20131122091552.247012c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 21 Nov 2013 23:19:10 +0100, Arnout Vandecappelle wrote:

> > Seeing this, I believe that passing i_cv_posix_fallocate_works=yes in
> > the ./configure environment is a better solution.
> 
>   But that wouldn't detect the uClibc case when posix_fallocate isn't 
> available...

I thought there were two tests, with two different variables:

 * One testing if a program with posix_fallocate() can be *compiled*.
   This test we need to let it as it is.
 
 * One testing if a program with posix_fallocate() can *run*. This test
   we need to tell the configure script to just assume that
   posix_fallocate() works (but of course, making the assumption that
   a failure on the previous test will make the configure conclude that
   posix_fallocate is not available).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
