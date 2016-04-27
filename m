From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 27 Apr 2016 09:28:46 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
 version with rpi/rpi2
In-Reply-To: <CALtfCQZ5NWOoTA6PP+ZwXXTkTj=aUrP5PpVB6miiTxjo55ur8Q@mail.gmail.com>
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net>
 <CALtfCQZ5NWOoTA6PP+ZwXXTkTj=aUrP5PpVB6miiTxjo55ur8Q@mail.gmail.com>
Message-ID: <CALtfCQZvVXb-6e_2DHGEBGw=aad3KJGefK-ekBSc=r3+WK_c3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I made a git clone from buildroot with the last repo, and It works fine
with rpi1 and rp2. I want to check rpi3 too so I've tried to select DTB
overlays (Target packages > Hardware handling > Firmware > Install DTB
overlays) but it didn't generate the overlay folder in
output/images/rpi-firmware.

Does anyone knows why?

Best regards.

[image: photo] ?scar G?mez Fuente
Electronic Engineer & Degree in Physical Sciences
Mobile: 659.28.97.90
Email: oscargomezf at gmail.com
Website: www.oscargomezf.com
<http://facebook.com/oscargomezf>  <http://plus.google.com/oscargomezf>
<http://us.linkedin.com/in/oscargomezf>
<http://twitter.com/oscargomezf_com>

On 27 April 2016 at 08:58, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi everyone,
>
> I've checked rpi1 sdcard.img and rpi2 sdcard.img images and works fine.
> With the rpi3 sdcard.img I can't see the serial port working, I tried to
> add overlays/pi3-disable-bt-overlay.dtb and 'dtoverlay=pi3-disable-bt' to
> the config.txt file to the boot partition but it doesn't work.
>
> Best regards.
>
> [image: photo] ?scar G?mez Fuente
> Electronic Engineer & Degree in Physical Sciences
> Mobile: 659.28.97.90
> Email: oscargomezf at gmail.com
> Website: www.oscargomezf.com
> <http://facebook.com/oscargomezf>  <http://plus.google.com/oscargomezf>
> <http://us.linkedin.com/in/oscargomezf>
> <http://twitter.com/oscargomezf_com>
>
> On 26 April 2016 at 21:39, Peter Seiderer <ps.report@gmx.net> wrote:
>
>> Hello Peter, Oscar,
>>
>> On Tue, 26 Apr 2016 19:51:46 +0200, Peter Korsgaard <peter@korsgaard.com>
>> wrote:
>>
>> > >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>> >
>> > >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>> >  >> Hi Peter,
>> >  >> The following models have been checked on a custom buildroot branch
>> of mine
>> >  >> (with a few changes), but it's based on the Latest stable release of
>> >  >> buildroot: 2016.02 and before executing a defconfig I executed a
>> make clean
>> >
>> >  >> I've changed:
>> >  >>
>> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3de232825c9ba5989522b8691eb6ac5df6619458"
>> >  >> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>> >
>> >  > Ok, can you please try current git to make sure? We've also updated
>> the
>> >  > version of rpi-firmware since 2016.02, so that might make a
>> difference.
>> >
>> > FYI, I've built the 3 defconfigs using current git head (except that I
>> > used precompiled toolchains) and put them online here for easy testing:
>> >
>> > https://buildroot.org/~jacmet/rpi/
>> >
>> > Just dd the sdcard.img matching your board variant to a sdcard. I've
>> > verified the rpi1 version here.
>> >
>>
>>
>> https://buildroot.org/~jacmet/rpi/rpi1/sdcard.img
>> Boots fine on a Raspberry Pi Model B Rev 2 board (console on HDMI and
>> serial)
>>
>> https://buildroot.org/~jacmet/rpi/rpi3/sdcard.img
>> Boots fine on a Raspberry Pi 3 Model B Rev 1.2 (messages on HDMI,
>> console on HDMI and serial after adding the 'dtoverlay=pi3-disable-bt'
>> fix).
>>
>> Regards,
>> Peter
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160427/425ed6f8/attachment.html>
