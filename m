From: =?UTF-8?Q?Refik_Tuzakl=c4=b1?= <refik.tuzakli@savronik.com.tr>
Date: Wed, 6 Jun 2018 08:27:24 +0300
Subject: [Buildroot] [BUILDROOT][PATCHv2 1/3] balena: new package
In-Reply-To: <20180605152819.6950ef99@windsurf>
References: <651f579d-07ad-afc4-4515-0061016dfc02@savronik.com.tr>
 <20180605152819.6950ef99@windsurf>
Message-ID: <f4687e68-4cb0-4804-6679-cb06a8a780c2@savronik.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello


On 05-06-2018 16:28, Thomas Petazzoni wrote:
> Hello Refik,
>
> On Tue, 5 Jun 2018 16:16:17 +0300, Refik Tuzakl? wrote:
>>   From 65b90eefab3fd936b5eec0e3004e5ec370c7d3b9 Mon Sep 17 00:00:00 2001
>> From: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
>> Date: Tue, 5 Jun 2018 15:58:39 +0300
>> Subject: [PATCHv2 1/3] balena new package v2
>>
>>
>> This patch adds balena; Moby-based Container Engine for Embedded, IoT,
>> and Edge uses.
>>
>> Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
> Thanks for this new iteration. Unfortunately, it is now sent with
> Thunderbird, so it is still badly line wrapped.
I am really sorry for this I can not solve the problem about SSL 
Certificate.
>> +BALENA_LDFLAGS += -extldflags '-static'
> Same.
I think we need it because in the pkg-golang. mk there is if clause 
about it;
ifeq ($(BR2_STATIC_LIBS),y)
$(2)_LDFLAGS += -extldflags '-static'
endif
in our dependencies BR2_STATIC_LIBS should be "n"
>
> All this stuff is done by the golang-package infrastructure. I suggest
> that you read package/pkg-golang.mk so that you can get a feeling of
> what the golang-package infrastructure already does for you.
>
> Thanks!
>
> Thomas
Thanks a lot

-- 

Refik Tuzakl?
Embedded Software Engineer
IT and Simulation Group

Savronik A.?.

Organize Sanayi B?lgesi

20. Cadde No: 19 26110

Eski?ehir Turkey

Tel   : (+90 222) 236 1590

Faks: (+90 222) 236 1589
www.savronik.com.tr

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180606/8be0671a/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: refik_tuzakli.vcf
Type: text/x-vcard
Size: 4 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180606/8be0671a/attachment.vcf>
