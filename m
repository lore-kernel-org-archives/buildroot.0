From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 18 Oct 2007 22:36:07 +0200
Subject: [Buildroot] svn At revision 20289 breakage
References: <4717A47F.4000908@asist.si> <4717C93A.3080401@promwad.com>
	<0c3501c811c4$63522850$01c4af0a@Glamdring>
	<4717D0BA.1050300@promwad.com>
Message-ID: <0c5901c811c6$8aecca30$01c4af0a@Glamdring>
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

Why not try the "Advanced Linux configuration" recently added
This should allow you to do "make xconfig" to create the needed file.


> BR,
> Ivan
>


Best Regards
Ulf Samuelsson
