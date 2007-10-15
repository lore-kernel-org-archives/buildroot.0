From: don <don_reid@comcast.net>
Date: Mon, 15 Oct 2007 15:17:18 -0700
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues [was
	svn	commit:trunk/buildroot: target/device target/device/Atmel
	target	etc...]
In-Reply-To: <02c301c80f72$254d2400$01c4af0a@Glamdring>
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
	<02c301c80f72$254d2400$01c4af0a@Glamdring>
Message-ID: <20071015221718.GA15524@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 15, 2007 at 11:25:52PM +0200, Ulf Samuelsson wrote:
>>   That commit introduced gcc 4.2.1 to avr32, which builds ok, but the
>> compiler still has some bugs, specially the C++ compiler and the
>> template engine.
>
>
> I tested with
>
> make atngw100_defconfig
> make
>
> which manages to build both the linux and the root fs.

It failed for me twice.  First with the libtool error I posted
recently, then in uboot.  

...
rm -rf /home/dev/AVR32/Buildroot/buildroot/project_build_avr32/atngw100/buildroot-config
mkdir -p /home/dev/AVR32/Buildroot/buildroot/project_build_avr32/atngw100
cp -dpRf package/config/buildroot-config /home/dev/AVR32/Buildroot/buildroot/project_build_avr32/atngw100/buildroot-config
cp target/device/Atmel/atngw100/u-boot/atngw100.h /home/dev/AVR32/Buildroot/buildroot/build_avr32/u-boot-1.2.0-atmel/include/configs/.
cp: cannot stat `target/device/Atmel/atngw100/u-boot/atngw100.h': No such file or directory
...

-- 
Don
