From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 29 Sep 2010 10:31:30 +0200
Subject: [Buildroot] [PATCH 2/4] Enable terminal type configuration for
 /etc/inittab
In-Reply-To: <20100928192828.2fb6ac19@surf>
References: <4C9C54A9.20803@visionsystems.de>	<4C9C54FC.4040609@visionsystems.de>	<4C9C553E.8040105@visionsystems.de>
	<20100928192828.2fb6ac19@surf>
Message-ID: <4CA2F962.7080004@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Am 28.09.2010 19:28, schrieb Thomas Petazzoni:
> On Fri, 24 Sep 2010 09:37:34 +0200
> Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:
>
>> diff --git a/target/generic/Config.in b/target/generic/Config.in
>> index 286b0a3..e7b2c9f 100644
>> --- a/target/generic/Config.in
>> +++ b/target/generic/Config.in
>> @@ -164,6 +164,12 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
>>  	bool "115200"
>>  endchoice
>>  
>> +config BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE
>> +	string "Terminal type"
>> +	default "vt100"
>> +	help
>> +		Specify a terminal type like vt100, linux etc.
> Need only one tab + 2 spaces for the indentation of the help text.
>
> Just out of curiosity, in what cases isn't vt100 an appropriate value ?

Good question. We just use TERM=linux for our Debian installations, so I wanted to do it also for Buildroot. But you're right vt100 should be sufficient, that's why I made it default, so the old behavior is preserved.

Best regards,
Yegor
