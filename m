From: =?UTF-8?Q?Beno=c3=aet_Mauduit?= <bmauduit@beneth.fr>
Date: Tue, 26 Apr 2016 22:58:21 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
 version with rpi/rpi2
In-Reply-To: <20160426213916.241241c7@gmx.net>
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net>
Message-ID: <571FD66D.9050305@beneth.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On 04/26/2016 09:39 PM, Peter Seiderer wrote:
> Hello Peter, Oscar,
> 
> On Tue, 26 Apr 2016 19:51:46 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>>
>>>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>>  >> Hi Peter,
>>  >> The following models have been checked on a custom buildroot branch of mine
>>  >> (with a few changes), but it's based on the Latest stable release of
>>  >> buildroot: 2016.02 and before executing a defconfig I executed a make clean
>>
>>  >> I've changed:
>>  >> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
>>  >> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>>
>>  > Ok, can you please try current git to make sure? We've also updated the
>>  > version of rpi-firmware since 2016.02, so that might make a difference.
>>
>> FYI, I've built the 3 defconfigs using current git head (except that I
>> used precompiled toolchains) and put them online here for easy testing:
>>
>> https://buildroot.org/~jacmet/rpi/
>>
>> Just dd the sdcard.img matching your board variant to a sdcard. I've
>> verified the rpi1 version here.
>>
> 
> 
> https://buildroot.org/~jacmet/rpi/rpi1/sdcard.img
> Boots fine on a Raspberry Pi Model B Rev 2 board (console on HDMI and serial)
> 
> https://buildroot.org/~jacmet/rpi/rpi3/sdcard.img
> Boots fine on a Raspberry Pi 3 Model B Rev 1.2 (messages on HDMI,
> console on HDMI and serial after adding the 'dtoverlay=pi3-disable-bt' fix).
> 

For information, I have successfully built a working Linux kernel for
rpi2 on top of the branch rpi-4.4.y.

BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e63db5f23b77ba5e2fa7823e9b3254bb65358b69"
Do you think we can move to this branch ?

Thanks,
Beno?t.


> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Beno?t Mauduit
<bmauduit@beneth.fr>
XMPP (Jabber) : <bmauduit@im.beneth.fr>
