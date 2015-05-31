From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 31 May 2015 12:37:34 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig
 and bootable microSD Bash script
In-Reply-To: <20150531091821.GG2282@tarshish>
References: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
 <20150529044005.GM2260@tarshish>
 <alpine.DEB.2.11.1505291022180.2289@tanhuma.tkos.co.il>
 <20150531062503.GC2282@tarshish>
 <alpine.DEB.2.11.1505311052260.1709@tanhuma.tkos.co.il>
 <20150531091821.GG2282@tarshish>
Message-ID: <alpine.DEB.2.11.1505311232290.1709@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 May 2015, Baruch Siach wrote:

> Date: Sun, 31 May 2015 12:18:21 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net, Rabeeh Khoury <rabeeh@solid-run.com>
> Subject: Re: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig and
>      bootable microSD Bash script
> 
> Hi Yonatan,
>
> On Sun, May 31, 2015 at 10:57:25AM +0300, Jonathan Ben Avraham wrote:
>> On Sun, 31 May 2015, Baruch Siach wrote:
>>> On Fri, May 29, 2015 at 10:56:14AM +0300, Jonathan Ben Avraham wrote:
>>>> 6. Having a separate script takes into account the fact that we are using
>>>> forked U-Boot repo whose bootcmd might change from the bootcmd in the
>>>> upstream repo.
>>>
>>> Which bootcmd you refer to? Is it the U-Boot autoboot environment variable?
>>
>> Yes. This script takes into account that Solid-Run could change the kernel
>> command line to use a rootfs in the first or third partition for example. to
>> do that with board/freescale/create-boot-sd.sh we would need to add extra
>> parameters or env vars.
>
> That's 'bootargs' I believe, isn't it? See my email on v2 for an alternative
> solution (boot.src).

Hi Baruch,
Let's do the boot.scr solution for general i.MX6 separately. At this point 
I want to get out something conservative and timely for Solid-Run boards. 
I hope to have the CuBox-i defconfig ready on Wednesday.

I think that the unified boot/root partition solution should at least at 
first be committed in parallel with and not in place of the current 
create-boot-sd.sh so as not to upset anyone.

  - yba


> baruch
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
