From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 19 Oct 2007 09:45:30 +0200
Subject: [Buildroot] svn At revision 20289 breakage
References: <4717A47F.4000908@asist.si>
	<4717C93A.3080401@promwad.com><0c3501c811c4$63522850$01c4af0a@Glamdring><4717D0BA.1050300@promwad.com><0c5901c811c6$8aecca30$01c4af0a@Glamdring>
	<4718510D.5030602@asist.si>
Message-ID: <008201c81224$6c96bd80$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Babarovic Ivica" <ivica.babarovic@asist.si>
To: <buildroot@uclibc.org>
Sent: Friday, October 19, 2007 8:39 AM
Subject: Re: [Buildroot] svn At revision 20289 breakage


> Ulf Samuelsson wrote:
>>>>
>>>> Key question:
>>>>
>>>> What does
>>>>
>>>> $ cp a
>>>>
>>>> do?
>>>>
>>>> Best Regards
>>>> Ulf Samuelsson
>>>>
>>>
>>> target/linux/Makefile.in : line 148
>>>
>>> $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
>>>        cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
>>>        $(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
>>>
>>>
>>> and LINUX26_KCONFIG is "" because BR2_PACKAGE_LINUX_KCONFIG=""
>>>
>>>
>>
>> Gotcha!
>>
>> Why not try the "Advanced Linux configuration" recently added
>> This should allow you to do "make xconfig" to create the needed file.
>>
> Wait! so we should now include our kernel .config files in buildroot
> build process?
> If so Why?


It is always the case that you have to provide a ".config" file for linux.

For some lucky souls Buildroot will do it for you.
This is when there is an appropriate definition somewhere in the target 
directory,
and if you have supplied the right kernel.

For some unlucky souls, they now have an option to start a "make xconfig"
to get a window allowing them to configure things instead of having a failed 
build.

>
> BR,
> I.


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com Best AVR
link: www.avrfreaks.net 
