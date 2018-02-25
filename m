From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 25 Feb 2018 23:00:11 +0100
Subject: [Buildroot] Buildroot 2018.02-rc1 released
In-Reply-To: <CAAXf6LWR-NbdcsJe+H4tMgDvBmVqqBn44y7S5qvuaoaeXy0R4g@mail.gmail.com>
References: <87h8qvv2kz.fsf@dell.be.48ers.dk>
 <CAAXf6LWR-NbdcsJe+H4tMgDvBmVqqBn44y7S5qvuaoaeXy0R4g@mail.gmail.com>
Message-ID: <CAAXf6LU6ANbU7J7v=gm8cqkxcj-Pwt6Fauy1Y_upEzbgd3e0Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-02-25 22:45 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> Hi,
>
> 2018-02-05 17:11 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>> Hi,
>>
>> Buildroot 2018.02-rc1 is released - Go download it at:
>>
>> http://buildroot.net/downloads/buildroot-2018.02-rc1.tar.gz
>>
>> or
>>
>> http://buildroot.net/downloads/buildroot-2018.02-rc1.tar.bz2
>>
>> Or get it from Git:
>>
>> git://git.buildroot.net/buildroot
>>
>> Please give it a spin and report any problems to the mailing list or
>> bug tracker.
>>
>
>
> While I haven't been able to do much target testing yet, I have
> successfully merged 2018.02-rc1 with our local tree, and get
> successful compilation of all our defconfigs.
> Most of the issues I encountered were due to local (non-upstreamed)
> changes conflicting with upstream changes. For the rest I have sent
> patches.
> For the release notes I have no special suggestions. All relevant
> changes were already listed in the CHANGES file.
>
> Below I am listing the patches that have not yet been merged, with
> some analysis about their urgency/risk.
>
> - http://patchwork.ozlabs.org/patch/869757/
> core: rename FOO_BASE_NAME to FOO_BASENAME to avoid clashes
> --> this is actually a bug fix, relevant if you enable packages
> alljoyn-base, alljoyn-tcl-base or perl-xml-sax-base. The patch is not
> more urgent than before, but I would think it should at some point be
> part of the 2018.02 long-term series, either from the start or if you
> prefer in a dot release.
>
> - http://patchwork.ozlabs.org/project/buildroot/list/?series=29376
> uboot: better fix for host-dtc influence
> --> I bump into this issue with a u-boot tree provided by Cavium
> Networks. On mainline U-boot it seems this problem is not present. The
> patch has not been reviewed yet, so perhaps it is too risky to include
> in 2018.02 from the start, but should be deferred to a dot release?

It seems ThomasP and I had a race condition and this series is now
merged in master... Thanks!

>
> - http://patchwork.ozlabs.org/patch/875483/
> check-bin-arch: skip /lib/modules to allow 32-bit userland on 64-bit arch
> --> this is a small patch with no real risk. I would suggest to still
> apply it for 2018.02.
>
>
> Best regards,
> Thomas
