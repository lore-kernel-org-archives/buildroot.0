From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Jun 2014 11:23:40 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <20140618105139.640b3a1f@free-electrons.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
 <20140617130025.664a1df6@free-electrons.com>
 <CAAXf6LVfQJvMQjHdvD+M_3HVLtD=h_bVoq=x8UP1WrPDYGc_Uw@mail.gmail.com>
 <20140618102531.34c6f3ea@free-electrons.com>
 <CAAXf6LU6nesDDXVMDDyHeOHR4A-YB_=KCwfbCs50BTM2bNgE_w@mail.gmail.com>
 <20140618105139.640b3a1f@free-electrons.com>
Message-ID: <CAAXf6LUfAFNGsAzu6vtXTFo428wyBcfNGDET+eLRcaBOmDuRNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jun 18, 2014 at 10:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>> > Wouldn't it be simpler to simply kill the build process when the time
>> > happens? So you have a cronjob that starts autobuild-run at 7 PM or 8
>> > PM in the evening, and another one that kills autobuild-run at 7 AM or
>> > 8 AM. I've tried to handle killing only the main autobuild-run script
>> > and make sure it kills the building sub-processes, but it doesn't work
>> > completely well so far. It needs to be investigated.
>>
>> It's easier, but it has the downside that the ongoing build at the
>> time of the kill is always lost (no results available). In the case it
>> happens to be a long build of two hours, it's a pity to lose these
>> results if the 'stop-time' is not very strict.
>
> That's true, but I find this thing really use-case specific. For
> example, maybe on week-ends you will be able to let the builds run even
> during day time? So we need to make the script more complex to handle
> this possibility, while cron is the perfect tool to do this kind of
> thing.
>
> *However* we could add something like a signal sent to the script that
> tells it to stop the builds when they are finished. Either a Unix
> signal like SIGUSR1, or the creation of a specific file in a specific
> location, or something like that. When the script receives this signal,
> it knows it should stop itself at the end of the current build. But the
> mechanism to generate this signal (cronjob or whatever) remains
> external to the script.
>
> What do you think?

Yes, that's a nice and clean solution.
A signal like SIGUSR1 seems easy enough to implement in Python, and
avoids the problem of removing the magic file afterwards.
I'll look at that when I have time.

Thanks,
Thomas
