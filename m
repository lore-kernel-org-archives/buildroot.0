From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 5 Oct 2012 14:20:59 +0100
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk>
 <87boghzdjc.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
Message-ID: <CAG2jQ8jMZ=PQEd=YJipP1cH=6-CyHD01YWsMYxZs67Rb5Wd2PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 5, 2012 at 9:20 AM, Markos Chandras
<markos.chandras@gmail.com> wrote:
> On Fri, Oct 5, 2012 at 6:35 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>>
>>>>>>>   <markos.chandras@gmail.com> writes:
>>  >> From: Markos Chandras <markos.chandras@imgtec.com>
>>  >> This also fixes a compilation problem with kernel headers 3.5
>>  >> http://autobuild.buildroot.net/results/bb66a3a06d26f558e1c4c0593bb68e7af1d82398/build-end.log
>>
>>  Peter> Committed, thanks.
>>
>> It unfortunately seems to be broken on largefile configurations:
>>
>> http://autobuild.buildroot.net/results/db48ce61cdb53669958b8b301fd24d7ecc33b236/build-end.log
>>
>> Any idea how to fix?
>>
>> --
>> Bye, Peter Korsgaard
>
> Hi Peter,
>
> I will have a look and I will let you know.
>
> --
> Regards,
> Markos

Hi Peter,

This also happens with the latest strace git code. It seems like
-D_FILE_OFFSET_BITS=64 is causing it. But there are also some other
problems in the LFS support. I will see if I can write some patches
and send them upstream.

-- 
Regards,
Markos
