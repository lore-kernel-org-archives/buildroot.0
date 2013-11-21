From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Nov 2013 23:19:10 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <20131121230011.040fe161@skate>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
 <20131121181248.3c606028@skate> <528E8110.10406@mind.be>
 <20131121230011.040fe161@skate>
Message-ID: <528E86DE.7020307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/11/13 23:00, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 21 Nov 2013 22:54:24 +0100, Arnout Vandecappelle wrote:
>
>>    You can give AC_TRY_RUN a fourth argument with actions to take when
>> cross-compiling. These actions are taken when compilation was successful.
>> Basically, the following patch should work:
>>
>> ----------------------------------
>> Fix support for cross-compilation.
>>
>> The check for posix_fallocate doesn't handle the cross-compilation case.
>> Assume that it works, because cross-compilation for AIX or old glibc is
>> unlikely.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> diff -Nrup lftp-4.4.10.orig/m4/lftp.m4 lftp-4.4.10/m4/lftp.m4
>> --- lftp-4.4.10.orig/m4/lftp.m4 2013-03-19 13:25:50.000000000 +0100
>> +++ lftp-4.4.10/m4/lftp.m4      2013-11-21 22:46:27.776820935 +0100
>> @@ -271,6 +271,8 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
>>           i_cv_posix_fallocate_works=yes
>>         ], [
>>           i_cv_posix_fallocate_works=no
>> +     ], [
>> +       i_cv_posix_fallocate_works=yes
>>         ])
>>       ])
>>       if test x$i_cv_posix_fallocate_works = xyes; then
>> ----------------------------------
>
> Seeing this, I believe that passing i_cv_posix_fallocate_works=yes in
> the ./configure environment is a better solution.

  But that wouldn't detect the uClibc case when posix_fallocate isn't 
available...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
