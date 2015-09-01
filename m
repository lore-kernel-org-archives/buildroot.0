From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Tue, 1 Sep 2015 17:32:04 +0530
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8tfzK28zoRr2s7R856vgPdgzeVA2Zn6HUuLOsmG+b1gvQ@mail.gmail.com>
References: <CAKpDV8uVJjtssJDEx4knqtATvjXzy+kdKtwBoWWLcv-9v4cikg@mail.gmail.com>
 <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C344F7@svr-wa-exch1.atg.lc>
 <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
 <CAKpDV8stME3N6uU8n_DVUYp=sgLGr9RDk_563FCy8XQqRQSL5Q@mail.gmail.com>
 <20150901085841.3b90dd93@free-electrons.com>
 <CAKpDV8tfzK28zoRr2s7R856vgPdgzeVA2Zn6HUuLOsmG+b1gvQ@mail.gmail.com>
Message-ID: <CAKpDV8tR9JRSQAqHFNYRyeNoFXwA2AwjT5-VpDCvyJL4g=0EbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First build is successful. Some questions from my side.

Following images are generated :--
/output/images
rootsfs.tar
rootsfs.tar.gz


1> Why this fakeroot is downloaded ?
2>  Also in the name of the crosscompiler tool chain their is word "686-pc"
does it means tool chain for intel 686 PC ?
3> How to configure the busybox ? Build root make menuconfig does not
provide entry to configure the busy box ?
/dl
arm-2014.05-29-arm-none-linux-gnueabi-1686-pc-linux-gnu.tar.bz2
fakeroot_1.18.4.orig.tar.bz2
busybox-1.23.2.tar.bz2


4> Is this the place where toolchain is unzipped ?
/output/host/opt/ext-toolchain  location contains :--
arm-none-linux-gnueabi
bin
i686-pc-linux-gnu
lib
libexec
share

Regards,
Katoch

On Tue, Sep 1, 2015 at 4:55 PM, Dinesh Guleria <din.gulu.er@gmail.com>
wrote:

> Thanks Thomas for your reply. I will use Sourcery CodeBench 2014.05 for
> time being.
>
> Build is taking some time. Will Get back to you.
>
> Thanks & Regards,
> Katoch
>
>
>
> On Tue, Sep 1, 2015 at 12:28 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear Dinesh Guleria,
>>
>> On Tue, 1 Sep 2015 06:39:34 +0530, Dinesh Guleria wrote:
>>
>> > One more question from my side if i use " Sourcery
>> > CodeBench 2014.05"  toolchain then buildroot will download it for me or
>> i
>> > have to download it manually ?
>>
>> Buildroot will download it for you.
>>
>> > Also if buildroot will download it then in
>> > this case will it be a one time process or if i make a new build for my
>> > rootfile system, then every time tool chain will be downloaded ?
>>
>> It is a one time process. Buildroot keeps a cache of the downloaded
>> files into the dl/ sub-directory (which can be customized using the
>> BR2_DL_DIR configuration option, which is also an environment variable).
>>
>> > What exactly the diffrence between using external tool chain like
>> Sourcery
>> > CodeBench 2014.05"  & building toolchain using crosstool-ng ?
>> >
>> http://www.bootc.net/archives/2012/05/26/how-to-build-a-cross-compiler-for-your-raspberry-pi/
>>
>> Sourcery CodeBench 2014.05 is a pre-built toolchain, used by a lot of
>> people. It's already there and available, hopefully quite well tested.
>> However, since it's pre-built, you cannot customize it.
>>
>> Using crosstool-ng to build your toolchain allows to generate a
>> completely custom toolchain, tailored for your platform.
>>
>> > >> Building the rootfilesystem into zImage resolves the rootfilesystem
>> > loading/linking issue clearly.
>> >
>> > Will uboot be able to understand that my rootfilesystem is inside my
>> zimage
>> > ? Or i have to tell uboot explicitly ?
>>
>> If you're using an initramfs bundled inside the zImage, then U-Boot
>> does not even need to know about it. Just load the zImage in U-Boot,
>> start the kernel, and that's it.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150901/700a1c9d/attachment.html>
