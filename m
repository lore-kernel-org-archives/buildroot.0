From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Nov 2013 10:20:51 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <20131122091552.247012c6@skate>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
 <20131121181248.3c606028@skate> <528E8110.10406@mind.be>
 <20131121230011.040fe161@skate> <528E86DE.7020307@mind.be>
 <20131122091552.247012c6@skate>
Message-ID: <528F21F3.9010904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/13 09:15, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 21 Nov 2013 23:19:10 +0100, Arnout Vandecappelle wrote:
>
>>> Seeing this, I believe that passing i_cv_posix_fallocate_works=yes in
>>> the ./configure environment is a better solution.
>>
>>    But that wouldn't detect the uClibc case when posix_fallocate isn't
>> available...
>
> I thought there were two tests, with two different variables:
>
>   * One testing if a program with posix_fallocate() can be *compiled*.
>     This test we need to let it as it is.
>
>   * One testing if a program with posix_fallocate() can *run*. This test
>     we need to tell the configure script to just assume that
>     posix_fallocate() works (but of course, making the assumption that
>     a failure on the previous test will make the configure conclude that
>     posix_fallocate is not available).

  Well, yes, there are two tests in configure, but only a single macro in 
lftp.m4. AC_TRY_RUN compiles the first argument and then tries to run it 
(if not cross-compiling). The second argument is executed if the run 
succeeds, the third argument if the compilation or the run fails, the 
fourth argument if compilation succeeds but it cannot be ran because 
you're cross-compiling.

  There are a number of other instances of AC_TRY_RUN in the lftp 
configure scripts, but the others all have the fourth argument.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
