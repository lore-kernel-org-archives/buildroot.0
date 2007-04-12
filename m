From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 12 Apr 2007 09:12:05 +0200
Subject: [Buildroot] busybox-1.5.0 miscutils/taskset.c compile errors
In-Reply-To: <031901c77c75$55f6e450$254565d5@atmel.com>
References: <010001c77c24$e9ee8ba0$254565d5@atmel.com>
	<200704112118.19272.vda.linux@googlemail.com>
	<031901c77c75$55f6e450$254565d5@atmel.com>
Message-ID: <20070412071205.GC4244@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 11, 2007 at 10:07:23PM +0200, Ulf Samuelsson wrote:
>
>
>> On Wednesday 11 April 2007 12:29, Ulf Samuelsson wrote:
>>> It seems that there is some undefined defines's in the "taskset.c"
>>> 
>>> CPU_ISSET
>>> CPU_SETSIZE
>>> CPU_ZERO
>>> CPU_SET
>>> 
>>> They are supposed to be set in "sched.h", and they are present in 
>>> 
>>> /usr/include/sched.h 
>>> 
>>> on my OpenSuse PC, but they are not present in linux-2.6.20.4 tarball
>>> 
>>> I could not find them in the toolchain includes...
>> 
>> my copy of glibc 2.4 supplies /usr/include/sched.h, and it does contain
>> those defines.
>> --
>> vda
>>
>
>The buildroot toolchain is built using uclibc so maybe it is an uclibc problem then?
>Then definitely, buildroot busybox configs should not enable building "taskset.c"...

The user should not choose to use stuff that does not work for their
config. taskset works perfectly well with uClibc trunk, so, as said, if
you need taskset then use uClibc-trunk otherwise turn it off.
Keep in mind that buildroot's config is supposed to be set by the user
depending on their needs. It's really a "doctor, it hurts when i.."
(non-)issue.

kind regards,
