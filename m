From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 8 Apr 2021 18:08:53 +0300
Subject: [Buildroot] - Question: How to change safely /var/log --> /tmp
 in buildroot
In-Reply-To: <02af48b6-e128-6b75-5f38-220ff4b6ed67@gmail.com>
References: <c2d6ee0a-995c-b403-b21c-2dd642104c6b@gmail.com>
 <e7b52c9d-e255-21c8-26f2-8637e15868a6@inbox.ru>
 <02af48b6-e128-6b75-5f38-220ff4b6ed67@gmail.com>
Message-ID: <5b302df4-b83b-f46b-28cd-235c2779e851@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. You can implement your own skeleton (based on your current skeleton)
2. You can modify your target rootfs by rootfs-overlay (BR2_ROOTFS_OVERLAY)
3. You can modify your target rootfs by BR2_ROOTFS_POST_BUILD_SCRIPT

The easiest way is 2.
I would recommend you to create your own skeleton.

08.04.2021 17:39, Marko Stanisic ?????:
> Thank you for the fast response,
> 
> is it possible to overwrite that behaviour by introducing an overlay 
> filesystem and
> 
>  ??? (1) create a "relative" symlink /var/log --> ../tmp/LOG", and 
> afterwards
> 
>  ??? (2) mount /tmp/LOG --> /mmcblk0p9
> 
> I already? testet it manually on the board, but still not sure how to 
> implement (2) :
> 
>  ?? 2.1) postimage.sh (which i use to create the images)
> 
>  ??? 2.2) or as an init script in init.d
> 
> 
> (3) take your solution and chnage behaviour in skeleton-init-sysv or 
> skeleton-init-openrc package
> if that is possible
> 
> 
> Thanks again for everyy support!!!
> 
> 
> 
> On 08/04/2021 16:32, Maxim Kochetkov wrote:
>> Hi, Marko
>>
>> 08.04.2021 16:41, Marko Stanisic ?????:
>>> Hello,
>>>
>>> I have no clue how? the symlink? /var/log --> ../tmp is statically 
>>> defined. (in buildroot)
>>>
>>
>>
>> This link is created by skeleton-init-sysv or skeleton-init-openrc 
>> package
>>
