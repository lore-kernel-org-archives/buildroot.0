Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F208BC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 23:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 788794F1FA;
	Thu,  2 Nov 2023 23:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 788794F1FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTSNboc92_0v; Thu,  2 Nov 2023 23:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 980EF4EE30;
	Thu,  2 Nov 2023 23:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 980EF4EE30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E55B1BF398
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 23:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAB3085090
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 23:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAB3085090
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgmxXRSa4sMr for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 23:16:44 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A248A85089
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 23:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A248A85089
Received: from [192.168.50.162] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ygvYqJN7SpdQyygvYqMy6u; Fri, 03 Nov 2023 00:16:41 +0100
Message-ID: <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
Date: Fri, 3 Nov 2023 00:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231101152114.GE114892@scaer>
X-CMAE-Envelope: MS4xfH8vXkJQ+1SXBN8VJCD1zXw6Lukf6XpOL1SY8JFo+ro8gsRWrSQ4I4E4IlkdNycD35hAFMO0jfny6ZhF78DsjbofaOu3BsiymBWEAEYO7NLKbcAM+/4v
 jC9+9JFV8d9EsZkKI7qL4aqB3ZFyG5Epw/SJ5wKf/Y0g6O65E/hsVCwIlhYHORMLJnCvTL+7kj1HLDji9g7j89hwuaqWqGtPlAhAQVtH3X+6hNCcrf9ymQ6W
 fR3IjjWPSETcztoTAllzzbg40uX5KRLPeTCA+hPgpywotgMv5I7SS/bYE0xsAepVP4iuAWSntz3UMtAG36Jx7pgRlWHOxFzT6RepUigOFPz0ZhqtTjJ2Wisi
 SQFt2Dk+
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698967001; bh=iyX4TnhoS8gKYTnRjzKqaJHcmEZpovvyIW1feenw2dg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kZBuyQ7byvvwguYOgI0yy3j3N/UNE7agTRcFgRaPa1ATkhpN6Z1ouy7pqjBm2qd2U
 24SJNAuAeQ8o53YwcS6cgeNhmoNjGF7ycRQAiVtXaznlgc6XEQrJmhAgOgQkV7T4TQ
 +oVwsQ08RqFtrQD8jVlLddBXX7ox1GE4jpFqPCvfZR6YZ/K51BPVajjcvIlgzJCarq
 iyXosndvM8H12IuH0Blfyk2PGWiub/BfGJbz0rgXT0Df/jKeDFg7XCaRvnvTJV8ttF
 bqth5cLqIme5nkYPh+ihNcPFgbbdKdNFhmHts0TBzFuLGcYEj6qI96J2CfwsgmeJT3
 /bRK/RiSwjK2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kZBuyQ7b
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 01/11/23 16:21, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2023-10-31 13:07 +0100, Giulio Benetti spake thusly:
>> Actually nodejs-src fails to build when additional modules with prebuilt
>> .node files are added. This is due to Buildroot's check-bin-arch that
>> checks for executable files and libraries that have different architecture
>> from the one we're building for. So let's go through all .node files in
>> $(TARGET_DIR)/usr/lib/node_modules and check if the architecture is
>> different or not found and in case delete the .node file.
> 
> Unfortunately, this is not going to work correctly.
> 
> For example, the module failing in #15823 is reported to be serialport,
> but really the failing one is the scoped @serialport/bindings-cpp
> module.
> 
> That module has "prebuilds" binaries for various systems, here's the
> list:
> 
>      $ find prebuilds/ -type f
>      prebuilds/android-arm/node.napi.armv7.node
>      prebuilds/darwin-x64+arm64/node.napi.node
>      prebuilds/android-arm64/node.napi.armv8.node
>      prebuilds/win32-ia32/node.napi.node
>      prebuilds/linux-arm/node.napi.armv7.node
>      prebuilds/linux-arm/node.napi.armv6.node
>      prebuilds/linux-x64/node.napi.musl.node
>      prebuilds/linux-x64/node.napi.glibc.node
>      prebuilds/linux-arm64/node.napi.armv8.node
>      prebuilds/win32-x64/node.napi.node
> 
> and running readelf -h on each will report many modules actually matching
> the current machine. For example, those two will both match AArch64,
> while obviously we only want to keep the latter:
> 
>      prebuilds/android-arm64/node.napi.armv8.node
>      prebuilds/linux-arm64/node.napi.armv8.node

Yes. I've found it was a better solution compared to what we have now,
but I'd need to check for OS too, but...

> Same goes for arm, and similar goes for x64 musl vs. glibc.
> 
> Those last two are also very interesting: it means that modules need to
> be built properly against the correct C library, not just the target
> CPU.

...you're totally right, I haven't considered libc :-/

> Which means that, even a module matching the current arch is not
> necessarily applicable to said arch if it was built for another C
> library...

yes,

> Which leads to the question: what happens for such a module when there
> is no prebuilt binary for the current arch? Is it going to be compiled
> by npm when it installs the module? Thanks to Adam, I could inspect the
> tarball of @serial/bindings-cpp@12.0.1, and I could spot .cpp and h
> files in the src/ subidr:
> 
>      $ wget 'https://registry.npmjs.org/@serialport/bindings-cpp/-/bindings-cpp-12.0.1.tgz'
>      $ tar tzf bindings-cpp-12.0.1.tgz |grep src/
>      package/src/darwin_list.cpp
>      package/src/poller.cpp
>      package/src/serialport_linux.cpp
>      package/src/serialport_unix.cpp
>      package/src/serialport_win.cpp
>      package/src/serialport.cpp
>      package/src/darwin_list.h
>      package/src/poller.h
>      package/src/serialport_linux.h
>      package/src/serialport_unix.h
>      package/src/serialport_win.h
>      package/src/serialport.h
> 
> There's also binding.gyp that looks like it lists what to build under
> which condition.

yes, .gyp file is another build system, same Mozilla adopted for 
NSS(maybe something else):
https://gyp.gsrc.io/index.md

But NodeJS seems to deal with it without the need to add a gyp infra.

> In which case, how does npm decide that it can use one such prebuild, or
> whether it should compile from the source files? Can we force it to
> never use prebuilds and always compile?

I'm working on this after your review,

> I'm afraid the proposed patch just covers up a bigger issue by sweeping
> the dust under the rug... It will indeed make check-bin-arch happy
> because no binary will indeed match another arch, indeed, but that does
> not mean the module will be actually correctly installed...

exactly,

> So yes, npm is such a mess that maybe sweeping the dust under the rug is
> the only solution we can implement, but it is disappointing...

I think it's not the way to go because of libc, that changes everything,

> Maybe we can just also exclude the node modules from check-bin-arch
> altogether and be done with it:
> 
>      NODEJS_SRC_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/

This ^^^ doesn't fix the libc problem. If you nm:
target/usr/lib/node_modules/serialport/bindings-cpp/build/Release/bindings.node

you will see that NodeJS assume native code to be built with glibc, so
I really need to go with building from scratch. And this works using:
npm rebuild ...
but I'm dealing with installation that is not so easy.

Once I have it building natively with correct libc I will send a patch.

Thank you for the review!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>> https://bugs.busybox.net/show_bug.cgi?id=15823
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/nodejs/nodejs-src/nodejs-src.mk | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
>> index 3452c93728..bdbf0709c6 100644
>> --- a/package/nodejs/nodejs-src/nodejs-src.mk
>> +++ b/package/nodejs/nodejs-src/nodejs-src.mk
>> @@ -247,6 +247,18 @@ define NODEJS_SRC_INSTALL_MODULES
>>   	# npm install call below and setting npm_config_rollback=false can both
>>   	# help in diagnosing the problem.
>>   	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
>> +
>> +	# Remove prebuilt files which are not compatible with the architecture
>> +	# and OS(Linux) we're building for. NOTE: .node files that don't have a
>> +	# readelf output have different ABI(i.e. Windows, Darwin etc.)
>> +	for f in $$(find $(TARGET_DIR)/usr/lib/node_modules -type f -name "*.node"); do \
>> +		echo $$f; \
>> +		arch=`$(TARGET_READELF) -h "$$f" 2>&1 | \
>> +			sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1`; \
>> +		if [ "$$arch" != "$(BR2_READELF_ARCH_NAME)" ]; then \
>> +			rm -f $$f; \
>> +		fi \
>> +	done
>>   endef
>>   endif
>>   
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
