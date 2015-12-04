From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 4 Dec 2015 08:30:27 +0100
Subject: [Buildroot] Add missing config to RPM target package
In-Reply-To: <55E89D2B.4090804@gmx.de>
References: <55D70AF3.3050604@gmx.de>
 <20150823200604.0c1e00cb@free-electrons.com> <55DCC1F6.4060008@gmx.de>
 <20150831163223.67982cd3@free-electrons.com> <55E89D2B.4090804@gmx.de>
Message-ID: <56614113.50102@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
unfortunately it took some time, but finally I cross-checked this topic.
With the change from rpm5 to rpm the problem does not exist anymore and 
there is no need for a patch.
Thanks for your support.

Regards,
Andreas


Am 03.09.2015 um 21:19 schrieb Andreas Ehmanns:
> Thomas,
> I will first check if and how the change from rpm5 to rpm affects this 
> topic.
> If the patch is then still necessary I will send it again. Since I'm 
> going on holiday right now it will take some time until you hear from 
> me again.
>
> Regards,
> Andreas
>
>
> Am 31.08.2015 um 16:32 schrieb Thomas Petazzoni:
>> Dear Andreas Ehmanns,
>>
>> On Tue, 25 Aug 2015 21:28:54 +0200, Andreas Ehmanns wrote:
>>
>>> in my first try I had no pcre support, so rpm package was built with
>>> --with-pcre=none
>>> Trying to install a binary rpm just containing one file on my target
>>> system failed at the very beginning when rpm was checking package
>>> dependencies. Setting --with-pcre=internal solved this problem. So it
>>> seems to me that pcre is necessary to to dependency checks which is in
>>> my opinion one of the main features or rpm. Isn't it?
>> If that's indeed the case, then pcre support is really mandatory for
>> RPM to be useful. Therefore, can you send a patch to make the pcre
>> dependency a mandatory one? Don't forget to add a comment explaining
>> why we're making it mandatory even if RPM makes it an optional
>> dependency.
>>
>> Thanks,
>>
>> Thomas
>
