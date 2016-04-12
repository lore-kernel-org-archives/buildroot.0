From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 13 Apr 2016 01:09:01 +0200
Subject: [Buildroot] [PATCH] mtd-utils: ubinize: fix return code on error
In-Reply-To: <570D57A0.4090304@mind.be>
References: <1460390298-25739-1-git-send-email-luca@lucaceresoli.net>
 <570D57A0.4090304@mind.be>
Message-ID: <570D800D.4030606@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

On 12/04/2016 22:16, Arnout Vandecappelle wrote:
> 
>  Hi Luca,
> 
> On 04/11/16 17:58, Luca Ceresoli wrote:
>> ubinize 1.5.2 (currently packaged in Buildroot) returns 0 in case of
>> some errors. This can lead to unnoticed errors in the middle of a
>> build.
>>
>> Fix by adding a patch from upstream, which is not yet present in any
>> released verison.
>>
>> Fetch from:
>> http://git.infradead.org/mtd-utils.git/commit/5f50207231414bfdbac8f0f974a2824f24177d6e
>>
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>   ...binize-Always-return-error-code-at-least-.patch | 63
>> ++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644
>> package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
>>
>>
>> diff --git
>> a/package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
>> b/package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
>>
>> new file mode 100644
>> index 0000000..772ab78
>> --- /dev/null
>> +++
>> b/package/mtd/0001-mtd-utils-ubinize-Always-return-error-code-at-least-.patch
>>
>> @@ -0,0 +1,63 @@
>> +From 5f50207231414bfdbac8f0f974a2824f24177d6e Mon Sep 17 00:00:00 2001
>> +From: Enrico Jorns <ejo@pengutronix.de>
>> +Date: Fri, 11 Sep 2015 15:28:13 +0200
>> +Subject: [PATCH] mtd-utils: ubinize: Always return error code (at
>> least -1) in
>> + case of an error
>> +
>> +ubinize should not fail silenty, this can be very annoying when using
>> +it from other tools that rely on the exit code for determining the
>> +success of their operation.
>> +
>> +Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
>> +Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
>  You forgot to add you SoB.

My bad... v2 on the way!

> 
>  Otherwise looks good to me.

Thanks.

-- 
Luca
