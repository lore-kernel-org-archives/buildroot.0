From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 11 Apr 2007 22:07:23 +0200
Subject: [Buildroot] busybox-1.5.0 miscutils/taskset.c compile errors
References: <010001c77c24$e9ee8ba0$254565d5@atmel.com>
	<200704112118.19272.vda.linux@googlemail.com>
Message-ID: <031901c77c75$55f6e450$254565d5@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On Wednesday 11 April 2007 12:29, Ulf Samuelsson wrote:
>> It seems that there is some undefined defines's in the "taskset.c"
>> 
>> CPU_ISSET
>> CPU_SETSIZE
>> CPU_ZERO
>> CPU_SET
>> 
>> They are supposed to be set in "sched.h", and they are present in 
>> 
>> /usr/include/sched.h 
>> 
>> on my OpenSuse PC, but they are not present in linux-2.6.20.4 tarball
>> 
>> I could not find them in the toolchain includes...
> 
> my copy of glibc 2.4 supplies /usr/include/sched.h, and it does contain
> those defines.
> --
> vda
>

The buildroot toolchain is built using uclibc so maybe it is an uclibc problem then?
Then definitely, buildroot busybox configs should not enable building "taskset.c"...


Best Regards
Ulf Samuelsson
