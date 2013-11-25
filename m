From: =?ISO-8859-1?Q?Arnaud_R=E9billout?= <rebillout@syscom.ch>
Date: Mon, 25 Nov 2013 14:06:00 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <528F21F3.9010904@mind.be>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
 <20131121181248.3c606028@skate> <528E8110.10406@mind.be>
 <20131121230011.040fe161@skate> <528E86DE.7020307@mind.be>
 <20131122091552.247012c6@skate> <528F21F3.9010904@mind.be>
Message-ID: <52934B38.1010905@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2013 10:20 AM, Arnout Vandecappelle wrote:
>
>  Well, yes, there are two tests in configure, but only a single macro 
> in lftp.m4. AC_TRY_RUN compiles the first argument and then tries to 
> run it (if not cross-compiling). The second argument is executed if 
> the run succeeds, the third argument if the compilation or the run 
> fails, the fourth argument if compilation succeeds but it cannot be 
> ran because you're cross-compiling.
>
>  There are a number of other instances of AC_TRY_RUN in the lftp 
> configure scripts, but the others all have the fourth argument.

I tried to add a 4th argument to the AC_TRY_RUN as you suggested in a 
previous mail:

> +     ], [
> +       i_cv_posix_fallocate_works=yes 

But in case of cross-compiation, it always returns yes, even if 
posix_fallocate is not defined by the libc: autotools don't even try to 
compile in case of cross-compile.
So it looks like a compile tested is needed in addition to the run test.


I just sent a second revision of the patch with the compile test added. 
I tried it on two different buildroot repo, one with posix_fallocate, 
and the other without posix_fallocate. It's working good.


Best regards,
Arnaud
