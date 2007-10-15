From: don <don_reid@comcast.net>
Date: Mon, 15 Oct 2007 16:49:55 -0700
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues
	[was	svncommit:trunk/buildroot: target/device
	target/device/Atmel	targetetc...]
In-Reply-To: <059501c80f79$dd1305d0$01c4af0a@Glamdring>
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
	<02c301c80f72$254d2400$01c4af0a@Glamdring>
	<20071015221718.GA15524@reid1.localdomain>
	<059501c80f79$dd1305d0$01c4af0a@Glamdring>
Message-ID: <20071015234955.GA18119@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2007 at 12:22:03AM +0200, Ulf Samuelsson wrote:
> link: www.avrfreaks.net
> ----- Original Message ----- From: "don" <don_reid@comcast.net>
> To: "Ulf Samuelsson" <ulf@atmel.com>
> Cc: "Thiago A. Corr?a" <thiago.correa@gmail.com>; <buildroot@uclibc.org>
> Sent: Tuesday, October 16, 2007 12:17 AM
> Subject: Re: [Buildroot] AVR32 4.1.2 toolchain build issues [was 
> svncommit:trunk/buildroot: target/device target/device/Atmel targetetc...]
>
>
>> On Mon, Oct 15, 2007 at 11:25:52PM +0200, Ulf Samuelsson wrote:
>>>>   That commit introduced gcc 4.2.1 to avr32, which builds ok, but the
>>>> compiler still has some bugs, specially the C++ compiler and the
>>>> template engine.
>>>
>>>
>>> I tested with
>>>
>>> make atngw100_defconfig
>>> make
>>>
>>> which manages to build both the linux and the root fs.
>>
>> It failed for me twice.  First with the libtool error I posted
>> recently, then in uboot.
>>
>> ...
>> rm -rf 
>> /home/dev/AVR32/Buildroot/buildroot/project_build_avr32/atngw100/buildroot-config
>> mkdir -p /home/dev/AVR32/Buildroot/buildroot/project_build_avr32/atngw100
>> cp -dpRf package/config/buildroot-config 
>> /home/dev/AVR32/Buildroot/buildroot/project_build_avr32/atngw100/buildroot-config
>> cp target/device/Atmel/atngw100/u-boot/atngw100.h 
>> /home/dev/AVR32/Buildroot/buildroot/build_avr32/u-boot-1.2.0-atmel/include/configs/.
>> cp: cannot stat `target/device/Atmel/atngw100/u-boot/atngw100.h': No such 
>> file or directory
>> ...
>>
>> -- 
>> Don
>
>
> Don't know why the libtool stuff fails, but the u-boot was never supported 
> for ngw100.
> It might be as simple as adding the file:
>
> ...
>
> Is U-Boot on by default?
> Maybe I turned it off, before I built it.
>
> There is a later u-boot at the u-boot home page.

I just did a clean buildroot checkout and then

	make atngw100_defconfig
	make

If U-Boot shouldn't be build for the atngw100_defconfig then that
config should turn it off.

-- 
Don
