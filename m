From: Andreas Naumann <dev@andin.de>
Date: Wed, 15 Mar 2017 09:17:13 +0100
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <f785c386-075b-ac22-3114-d09a79dbeffc@mind.be>
References: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
 <20161004163555.7c8af28f@free-electrons.com>
 <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
 <d5b7097f-1af5-1130-21b2-fb3c1278a646@andin.de>
 <20170313133220.62892a21@free-electrons.com>
 <216f6108-da26-92cc-8177-07117d20092c@andin.de>
 <20170313163306.GA3680@free.fr> <20170314091615.2de4a05b@free-electrons.com>
 <adf0f72b-286b-e056-a2ed-24389f852472@andin.de>
 <180611cf-c61b-736d-c753-9df57bb29bc7@andin.de>
 <f785c386-075b-ac22-3114-d09a79dbeffc@mind.be>
Message-ID: <ece0d310-0f3d-9f1c-e045-70f0f5c4d777@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am 15.03.2017 um 01:20 schrieb Arnout Vandecappelle:
>
>
>  For the record, I can reproduce this on my side. I just do "fakeroot
> /bin/bash", then do the commands from the shell. Even an ls -l of the copied
> files within the fakeroot shell already shows the "arnout" instead of "root"
> user. My host fakeroot (Debian 1.21-3.1).
So are you saying you see this behaviour with your host fakeroot?

>
>  I have also tried removing the ac_cv_header_sys_capability_h=y, that doesn't
> make a difference.
>
>  I have not yet tried applying the Debian patches to the Buildroot-built fakeroot.
I have done this with the Ubuntu patches for 1.20.2 and Debian patches 
for 1.21-3.1 to no avail.


thanks and regards,
Andreas


>
>  Regards,
>  Arnout
>
>>
>> When done, a
>> tar -tvf rootfs.2.tar
>> shows changed permissions for everything and the original owner for files:
>>
>> drwx------ root/root         0 2017-03-14 13:37 ./
>> drwx------ root/root         0 2016-10-06 09:03 ./mnt/
>> drwxrwxrwt root/root         0 2017-03-10 14:44 ./tmp/
>> drwx------ root/root         0 2017-03-14 13:37 ./tmp/ldconfig/
>> -rw------- joe/somegroup     33 2017-03-14 13:37 ./tmp/ldconfig/aux-cache
>> drwx------ root/root             0 2017-03-10 14:35 ./tmp/fontconfig/
>> ...
>>
>> I tried to apply the patches that Ubuntu has for the host package, but that
>> doesnt help either. What else can I do? Can anybody shed some light on this?
>>
>>
>> thanks,
>> Andreas
>>
>>
>>
>>
>>
>>
>> Am 14.03.2017 um 12:04 schrieb Andreas Naumann:
>>> Hi,
>>>
>>>
>>> Am 14.03.2017 um 09:16 schrieb Thomas Petazzoni:
>>>> Hello,
>>>>
>>>> On Mon, 13 Mar 2017 17:33:06 +0100, Yann E. MORIN wrote:
>>>>
>>>>> I had a look at the diff between 1.20.2 (which we have right now) and
>>>>> 1.21, and the only noticeable delta is the change of a bufgfer size in
>>>>> mesage.h, the rest of the delta being the removal of the generated
>>>>> autostuff.
>>>>>
>>>>> So we can quite safely backport that single change.
>>>>
>>>> Andreas, could you test Yann's patch? Does it fix your problem?
>>>
>>> I just did, but unfortunately it does not help. However, even with plain
>>> 1.21 I no longer get the correct behaviour. Only thing that helps is
>>> going back to 1.18.4.
>>> It was late Friday when I thought 1.21 was working, but I may have
>>> tested an Ubuntu version of it (1.21-3.1 or so). I will try to track
>>> that down.
>>>
>>> regards,
>>> Andreas
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
