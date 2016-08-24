From: Stanislav Vlasic <svlasic@gmail.com>
Date: Wed, 24 Aug 2016 18:14:42 +0200
Subject: [Buildroot] [BUG] eglibc and Kodi Krypton
In-Reply-To: <20160824151032.53124166@free-electrons.com>
References: <npjure$ucu$1@blaine.gmane.org>
 <20160824151032.53124166@free-electrons.com>
Message-ID: <CADYw_JLONZMC8c4=+W0D37+aQN1QHdDYY0Jdja-DDzsczddTkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 08/24/2016 03:10 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 24 Aug 2016 13:02:07 +0200, Stanislav Vlasic wrote:
>
>> Kodi Krypton causes random crashes when using eglibc (2.18 or 2.19,
>> doesnt matter - from 2016.05).
>>
>> GDB output:
>> (gdb) kodi.bin: pthread_mutex_lock.c:347: __pthread_mutex_lock_full:
>> Assertion `(-(e)) != 35 || (kind != PTHREAD_MUTEX_ERRORCHECK_NP && kind
>> != PTHREAD_MUTEX_RECURSIVE_NP)' failed.
>>
>> I rebuilt with glibc 2.23 which fixed issue. Platform is aarch64, custom
>> 3.14 kernel (Amlogic), not sure if same happens with armel and armhf
>> (did not test it).
>
> We no longer support eglibc in Buildroot, and therefore only support
> glibc 2.22 and 2.23 in the upcoming 2016.08 release, and 2.22/2.23/2.24
> in the next 2016.11 release.

Thank you for confirmation/information. I was not following what was
going on with upcoming 2016.08 release. Was just a bug I ran into and
shared my fix :)

> Thomas
>

Stane1983
