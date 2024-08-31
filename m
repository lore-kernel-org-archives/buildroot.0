Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784D5CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087A581D67;
	Sat, 31 Aug 2024 17:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlXc3-1EeLHC; Sat, 31 Aug 2024 17:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD4681D72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD4681D72;
	Sat, 31 Aug 2024 17:08:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEC01BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C8B841A27
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTbpatq0QxE5 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC3DF41883
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC3DF41883
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC3DF41883
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:08:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.38]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mFi-1s5psE0f1A-0159b0; Sat, 31
 Aug 2024 19:07:54 +0200
Message-ID: <bb232ed6-b875-45e2-ae01-9103b9dbf9da@gmx.de>
Date: Sat, 31 Aug 2024 19:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
 <20240713192207.873065-2-fiona.klute@gmx.de> <ZtI77POZD4CRpV5C@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZtI77POZD4CRpV5C@landeda>
X-Provags-ID: V03:K1:5bwR5QbBViP9pZNNrbt/RbfUB57ZyDapv2dotODAHEYGl6CI5qY
 7UXZqzm14Ip51w3/ZYziDio8K1ohK97ozBEq7mh8USEKq8HPfJ5ktDVg2OqYX3CVYqr7nHm
 rdQ1Akq1/guM8BnYTt/4Hj/Sx77BWHV/xm5YVlNjXmte3xvt64YuzL5XWYGpYo8zK9pYpzn
 YGxpUa2EPZCii9AHtrwpQ==
UI-OutboundReport: notjunk:1;M01:P0:HbgCmUhIof4=;1Iwahx/eN2CeFGu1SJaQEFUx1Og
 dD8Fmy3hgFSRWQ6xQD/KV4q89WEx8Yk7NG+Jcln5OuJYSFgY/SeEdxAqYmoPXMzw7jdZf5grH
 0nZ/2OM7t3jKKdriQge6bxQC8oU5ID5RsyXaKcyTI562YUplz1kc8A0zSydYUZ1PCeZEmYInv
 Sr6LK4QaBF3CQD06SbFklf3XHQq2J+FvbZIE1NLpfrW6bm344QBy/Tglr1afrqMyblfSnSqki
 JphWjWK8afBEWpqbEwElL3dOrK5lnaIaqIivGMAAG9Ms0A2uNDzLU28Aqu/4Nl3JUFHmv55p7
 jVEbf6AlveGDjbphtiwkxmFZGun5KyVysOAyMCJPdcn42YHv1A5kE49Qw4k/v088kaDp4ysnv
 cDdPXxiXrvZbckKbRxCbYBYX4ORI7dISwgFinsqTt2RNfQOezQEEZ0UCL1P3W2UN6XY5AUq+6
 gbBhvx5uGcpCupteNTGZnAq7XUdizLeYDDFMttJJUnKEyeLocAfkOi1qPRAy0hz4MbqDxldBz
 AUkMZn0FTwSkWK2p+m7DP6vLoUVuLWVtk77DQ/P16mqLJHr9xMI1Zk06s8ZZkp84YGtZ/+LMd
 l5YMEaZgaU/T10cXef6xuAouHzLFW3jXhsyihTzx4KtH++nla0ro7Bsa/R5zM5BPdvJKlpH9m
 pZh3pR5OwMKLqD2nZ3CdLpWNjb35DRV4G5YrFaHgmJl8CG+RNuxEriOvX1DjHghWdOP7qiKi3
 LBtpywILzhych3N4xAwHqinOKC/ssCw1Jt/qaTxRIordfhmM2UcoGyg7aG31mYbQ825M+uI2F
 UOOqHq5qqfes0O91/GZj1RHA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725124074; x=1725728874; i=fiona.klute@gmx.de;
 bh=Sj5V+jzjAXgdo1GJrLJJm6s2vX7wbctsI63Iuiy0lmU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=N/EyiRD+zLbyhR3/mZYxdbaT01MAy/2Cs3wtgraSRWWK3rVjx9wmgvqdWoAmCIOZ
 RXZFXgxsyVBGSd9Mt+tnStv+m8qwE6WSa8iWqnj/VoMye/tv366XLdCJugKzhssXB
 ooquAgZ01jRSIlfwxKAzDK7xBQwXVoRk6YDUhi4NU6y0dFW9Sj+TvMk7+WQZXkT0f
 4/SFtfvckCjcKygP6SFZ2kQ8uZ4UySDOlMVg3HmYsTE2u73WJDFxpu8NZJJzfNfV1
 hCYUqJoN0XR2lFjQmqgVkyR+LrJef6Z10Dr6hm5Pcl/koWBwPRvjKdr2boDX1GOXN
 Lo2eeya3up/J60NlcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=N/EyiRD+
Subject: Re: [Buildroot] [PATCH v3 2/2] support/scripts/br2-external: allow
 spaces in dirname
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 30.08.24 um 23:38 schrieb Yann E. MORIN:
> Fiona, All,
>
> On 2024-07-13 21:22 +0200, Fiona Klute via buildroot spake thusly:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>> "make list-defconfigs" and "make nconfig" work in the container used
>> by utils/docker-run with external trees with spaces in the directory
>> name. Other build steps may or may not work.
>
> As you state yourself, "Other build steps may or may not work". And
> indeed, that's probably not going to work, as BR2_EXTERNAL is expected
> to be a space-separated list, that will be split on spaces from Makefile
> context. So, no amount of quoting will make br2-external trees with
> spaces actually work (AFAICS).

BR2_EXTERNAL is colon separated, the current code simply replaces colons
with spaces and then applies word splitting:

do_validate "${outputdir}" ${@//:/ }

If writing the paths to the makefiles quoted isn't safe (it does work
e.g. with "make list-defconfigs", but I don't know what would happen
later in the build) then I think do_validate_one should check for spaces
in the paths and error out if there are any. Sure, the "does the path
exist" check is likely to fail anyway on a path split in the middle, but
the error message would equally likely be a bit confusing.

Best regards,
Fiona

> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>> This is mostly a proof-of-concept to show the previous patch works,
>> there might still be things that break in other parts of the build. I
>> have not checked if "printf '%q'" works in Bash 3.1 (like a comment
>> claims the script needs to support, not sure if still current).
>>
>> Changes v1 -> v2:
>> * Added this patch
>>
>>   support/scripts/br2-external | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
>> index 8aea479d20..b8b6179aa8 100755
>> --- a/support/scripts/br2-external
>> +++ b/support/scripts/br2-external
>> @@ -34,7 +34,8 @@ main() {
>>       trap "error 'unexpected error while generating ${ofile}\n'" ERR
>>
>>       mkdir -p "${outputdir}"
>> -    do_validate "${outputdir}" ${@//:/ }
>> +    IFS=":" read -r -a br2_extdirs <<< "${@}"
>> +    do_validate "${outputdir}" "${br2_extdirs[@]}"
>>       do_mk "${outputdir}"
>>       do_kconfig "${outputdir}"
>>   }
>> @@ -144,9 +145,9 @@ do_mk() {
>>               eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
>>               printf '\n'
>>               printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
>> -            printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
>> -            printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
>> -            printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
>> +            printf 'BR2_EXTERNAL_DIRS += %q\n' "${br2_ext}"
>> +            printf 'BR2_EXTERNAL_MKS += %q/external.mk\n' "${br2_ext}"
>> +            printf 'export BR2_EXTERNAL_%s_PATH = %q\n' "${br2_name}" "${br2_ext}"
>>               printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
>>               printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
>>           done
>> --
>> 2.45.2
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
