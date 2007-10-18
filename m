From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 18 Oct 2007 22:33:23 +0200
Subject: [Buildroot] svn At revision 20289 breakage
References: <4717A47F.4000908@asist.si> <4717C93A.3080401@promwad.com>
	<0c3501c811c4$63522850$01c4af0a@Glamdring>
	<4717D0BA.1050300@promwad.com>
Message-ID: <0c5601c811c6$7d98ecb0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
>> Key question:
>>
>> What does
>>
>> $ cp a
>>
>> do?
>>
>> Best Regards
>> Ulf Samuelsson
>>
>
> target/linux/Makefile.in : line 148
>
> $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
>        cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
>        $(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
>
>
> and LINUX26_KCONFIG is "" because BR2_PACKAGE_LINUX_KCONFIG=""
>
>

Gotcha!

> BR,
> Ivan
>


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57 
