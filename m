From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 23:00:11 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <528E8110.10406@mind.be>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
 <20131121181248.3c606028@skate> <528E8110.10406@mind.be>
Message-ID: <20131121230011.040fe161@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 21 Nov 2013 22:54:24 +0100, Arnout Vandecappelle wrote:

>   You can give AC_TRY_RUN a fourth argument with actions to take when 
> cross-compiling. These actions are taken when compilation was successful. 
> Basically, the following patch should work:
> 
> ----------------------------------
> Fix support for cross-compilation.
> 
> The check for posix_fallocate doesn't handle the cross-compilation case. 
> Assume that it works, because cross-compilation for AIX or old glibc is 
> unlikely.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> diff -Nrup lftp-4.4.10.orig/m4/lftp.m4 lftp-4.4.10/m4/lftp.m4
> --- lftp-4.4.10.orig/m4/lftp.m4 2013-03-19 13:25:50.000000000 +0100
> +++ lftp-4.4.10/m4/lftp.m4      2013-11-21 22:46:27.776820935 +0100
> @@ -271,6 +271,8 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
>          i_cv_posix_fallocate_works=yes
>        ], [
>          i_cv_posix_fallocate_works=no
> +     ], [
> +       i_cv_posix_fallocate_works=yes
>        ])
>      ])
>      if test x$i_cv_posix_fallocate_works = xyes; then
> ----------------------------------

Seeing this, I believe that passing i_cv_posix_fallocate_works=yes in
the ./configure environment is a better solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
