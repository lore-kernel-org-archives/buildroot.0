From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Mon, 21 Sep 2015 01:59:49 +0200
Subject: [Buildroot] =?utf-8?q?problem_booting_from_ext2_=C2=B5sd_card?=
In-Reply-To: <CA+BsyQ7LQofzLgZKP_Zm4Ykbd+MOfWNw15qPRYAxXjURURuKVg@mail.gmail.com>
References: <55FA01A4.5070107@proximus.be>	<CA+BsyQ6yskQ6TFpZQCTMWtZka+TBNaNj2XzgWhu7RqskLN0HhA@mail.gmail.com>	<55FA73D9.6080800@proximus.be>
 <CA+BsyQ7LQofzLgZKP_Zm4Ykbd+MOfWNw15qPRYAxXjURURuKVg@mail.gmail.com>
Message-ID: <55FF4875.9030403@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan Heading schreef op 17/09/2015 om 13:20:
>> Then used cfdisk to create a single partition type 83 and maximum size as
>> suggested by cfdisk.
> What's the maximum size suggested by cfdisk ?
>
> Your script seems to be manually creating the ext2 filesystem and
> copying the files to it. buildroot can actually generate the ext2/3/4
> image for you, so you won't need the above script; you'd just need to
> copy the image directly to the sd (using dd).
>
>> The only thing i can think of is that my debian host is messing up the
>> partition.
>> and also tried  cfdisk /z
> Can you mount the partition on your debian host ? If it works there it
> should also work on your target.
>
> I see the output of mke2fs you sent. It appears to be creating a 2GB
> partition which is the maximum size of an ext2 filesystem, so that
> looks right.
>
> My best suggestion is to bring your Linux system up without mounting
> the SD card (ie use an initramfs or similar) and then see if you can
> mount it manually and dump out the partition tables from there.
>

Brendan ;
The problem was caused by an overloaded power controller on the boards,  
generating voltage dips on the 3V3 line
enough to corrupt sd-card communication but not enough to trigger a 
poweron reset ...
It's not always software causing trouble....

Regards , Johan
