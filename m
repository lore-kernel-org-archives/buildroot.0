From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Wed, 20 Mar 2019 09:39:18 +0000
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
In-Reply-To: <20190319153823.GB2702@scaer>
References: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
 <20190319125040.GA2702@scaer>
 <940dcdca-91e1-9460-35f7-782959a7ad02@ideasonboard.com>
 <20190319153823.GB2702@scaer>
Message-ID: <221a9844-15e9-5d36-b446-c220dc8fc945@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 19/03/2019 15:38, Yann E. MORIN wrote:
> Kieran, All,
> 
> On 2019-03-19 14:12 +0000, Kieran Bingham spake thusly:
>> On 19/03/2019 12:50, Yann E. MORIN wrote:
>>> On 2019-03-19 11:03 +0000, Kieran Bingham spake thusly:
>>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>>> index c91325e28486..5bcdf208a62b 100644
>>>> --- a/DEVELOPERS
>>>> +++ b/DEVELOPERS
>>>> @@ -1260,6 +1260,9 @@ F:	package/ramsmp/
>>>>  N:	Kevin Joly <kevin.joly@sensefly.com>
>>>>  F:	package/libgphoto2/
>>>>  
>>>> +N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>>>> +F:	package/libcamera/
>> Is it possible to put the libcamera mailinglist as a 'cc' target here as
>> well? or is it only individuals.
> 
> The problem is that libcamera-dev is subscription-based too, so people
> who are not subscribed get a "pending-approval" message, which is not
> very interesting...

libcamera-dev is indeed a mailman instance, but we do not require a
subscription to post.

As you note, to prevent spam the first post from anyone will require
moderation - but once approved all further posts from that person will
be accepted, and the initial post does not need to be resent. It will
hit the list once approved.



>> If someone (other than me) updates the package, It would be nice for
>> that notification to go to the list.
> 
> Well, the goal of the DEVELOPERS file is that someone-not-you update the
> package, they do Cc you. For example, with your patch applied, run:
> 
>     ./utils/get-developers -p libcamera
> 
> Or:
> 
>     git show |./get-developers -
> 
> which will reprt you as the person to Cc on patches touching the
> libcamera package.

Yes, I like that :) but I might not always be the best contact for the
libcamera package, which is why I thought the list would be more
appropriate.

I can just leave the developer entry as me for now. If it ever became an
issue it could be updated easily.


>>> Also, as you already discovered, it's nice to pass a new package through
>>> utils/test-pkg as well (and although not mandatory, it's nice to provide
>>> that report after the --- line.)
>>
>> I was going to ask how to do this - as it was skipping all 6, and then
>> all 43 toolchains with -a. But I've worked it out, so for the benefit of
>> others:
> 
> From the manual:
> 
>     https://buildroot.org/downloads/manual/manual.html#_tips_and_tricks
> 
>     17.23.3. How to test your package
> 
>> I had to create a libcamera.config and specify the EUDEV dependency:
>>
>>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y>>   BR2_PACKAGE_LIBCAMERA=y
>>
>> Then:
>>  ./utils/test-pkg -c libcamera.config -p libcamera
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Regards
--
Kieran
