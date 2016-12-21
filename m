From: Linux User <newhorizons009@gmail.com>
Date: Wed, 21 Dec 2016 10:38:12 -0500
Subject: [Buildroot] logrotate error
In-Reply-To: <CA+12NBJ5z0KaFhBWGQ9XARzbuAwKCo5Px7ZZvL-OFxjz=O-pSQ@mail.gmail.com>
References: <CA+12NBJSywCO=azSzUtUdSS3irhXTUnhNpcRL6Rr-R=g_9UbHQ@mail.gmail.com>
 <20161221145757.727602a2@free-electrons.com>
 <CA+12NBJ5z0KaFhBWGQ9XARzbuAwKCo5Px7ZZvL-OFxjz=O-pSQ@mail.gmail.com>
Message-ID: <CA+12NB+qmsHK7oivjdhgg=RccKKgBEUE6dJhMZFg5u9Lbuc2hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Same results. I did "make clean all",

/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
unknown architecture of input file
`/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld'
is incompatible with arm output
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
error in
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld(.eh_frame);
no .eh_frame_hdr table will be created.
collect2: error: ld returned 1 exit status


On Wed, Dec 21, 2016 at 10:04 AM, Linux User <newhorizons009@gmail.com>
wrote:

> Certainly I will give it a go and post my findings. Thanks Thomas.
>
> On Wed, Dec 21, 2016 at 8:57 AM, Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com> wrote:
>
>> Hello,
>>
>> On Wed, 21 Dec 2016 08:22:34 -0500, Linux User wrote:
>>
>> > I enabled the logrotate package through the menuconfig, and my
>> compilation
>> > breaks. Can someone pls shed some light.
>>
>> This type of error really smells like you did a first build, then
>> changed your Buildroot configuration, and restarted the build, without
>> doing a "make clean".
>>
>> Can you please check if you can reproduce after a "make clean all" ?
>>
>> In any case, please read
>> https://buildroot.org/downloads/manual/manual.html#full-rebuild.
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161221/16348323/attachment.html>
