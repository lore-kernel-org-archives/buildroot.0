From: Martin Bark <martin@barkynet.com>
Date: Wed, 9 Mar 2016 10:23:41 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/connman: fix crash due to
 iptables 1.6.0 update
In-Reply-To: <CAFGQKxex64N_Eg8v=hXvFsu4hNJpNASCpj7tpvQV1qtB7M_Nsw@mail.gmail.com>
References: <1457345950-2793-1-git-send-email-martin@barkynet.com>
 <20160308211834.5d768caa@free-electrons.com>
 <CAFGQKxex64N_Eg8v=hXvFsu4hNJpNASCpj7tpvQV1qtB7M_Nsw@mail.gmail.com>
Message-ID: <CAFGQKxd9=Hpzv-DOOiXqpgnwovEv5jvU-8YvoG-SFGEN=pA=AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 9 March 2016 at 10:01, Martin Bark <martin@barkynet.com> wrote:
> Thomas,
>
> On 8 March 2016 at 20:18, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Martin Bark,
>>
>> On Mon,  7 Mar 2016 10:19:10 +0000, Martin Bark wrote:
>>> iptables was updated to version 1.6.0 in commit
>>> https://git.busybox.net/buildroot/commit/?id=35dc775 however, connman
>>> 1.31 crashes when iptables 1.6.0 is used.
>>>
>>> This issues has already been fixed upstream but is not currently available
>>> in a release.  To fix connman include the upstream patch. See
>>> http://git.kernel.org/cgit/network/connman/connman.git/commit/?id=acea08a
>>>
>>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>>
>>> ---
>>
>> Applied to master, thanks. Since you already contributed this patch to
>> connman, could you also submit upstream the patch
>> package/connman/0001-configure-check-for-execinfo.h.patch ?
>
> Yes I'm happy to can do that.

Actually there is no need, Yann has already had his patch committed to
connman, see http://git.kernel.org/cgit/network/connman/connman.git/commit/?id=61b0b13.
So the next release of connman should remove both patches.

Thanks

Martin

>
> Just to be clear, I did not contribute that patch to connman, it was
> contributed by Wu Zheng <wu.zheng@intel.com> here
> http://git.kernel.org/cgit/network/connman/connman.git/commit/?id=acea08a.
> I don't want to take credit for someone else's work.
>
> Thanks
>
> Martin
>
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
