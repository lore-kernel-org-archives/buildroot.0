Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C96C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C9A40148;
	Sat, 13 Jul 2024 19:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7SsHyKYkiZc; Sat, 13 Jul 2024 19:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63671401D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63671401D8;
	Sat, 13 Jul 2024 19:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECEC1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AE1E40975
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUqwIk4jH544 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5379D408CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5379D408CF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5379D408CF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:27:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVN6j-1stu0j2DPr-00X35Q; Sat, 13
 Jul 2024 21:26:42 +0200
Message-ID: <0607bf8d-1064-4b24-8a90-0bcd6e310b13@gmx.de>
Date: Sat, 13 Jul 2024 21:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240713115244.848755-1-fiona.klute@gmx.de>
 <D2OJJE8XA10T.33AXPFIGRGL3L@collins.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <D2OJJE8XA10T.33AXPFIGRGL3L@collins.com>
X-Provags-ID: V03:K1:6hNSzxtLxyY71xKxBWbRwoBK2Fn5xxOy8FEnyt1JZVuc1kcWMwu
 OUr1G/MvRXwjRiFSGrcAtjDIZ3ftoU7eX0znjCuhxxMNY37zopIH0w0yUCl1HflDqRErNBp
 2eS7VCclvBJl8Yr9MLMplJrNiw7fgoW1KuaCim2ATDaS7HWw7xXQdLhH+WMC4Y9TeK34Tqk
 dRiExIblFAL0UF9ws00Fg==
UI-OutboundReport: notjunk:1;M01:P0:cyZog1YsFfQ=;HnxadSA4iE9bx0hxpTiOCnV9oNN
 zS/j56rNP2A1CkW+7UOm/SZXxij45329lZQnupJB3rne6/TT3Ws7TOjamUUbzH3VdIzLZwJZe
 Xh3SevN/KVlYcJzyWgiYNofNey34P2k12lWw065yiRf5Mpy+NUDEEN84JcJU268F/J9MMTVbj
 5rdLimFEmHK9CxxuUJMTxgHLp2Lj8L7kyjh198OUrF5FhrZBi5p0Kv3wMgNsZDMUL/3wecTpQ
 IJtAtNhv5QUvJS7ngggmv2IKwyiW8g04CxCyxPVuJyffKIidMc8k+XpXarj9N+j3wg6NXmB/9
 5PKVV6RwLDfHW/X3B6cXn7Dle5VdsM1PzG/CuB/w5jyztw0/E7ALlvCBBwzpD5lGgRgF1wA6k
 ST9zAo6ZeREVws8ELHrzOIklPGoQ2XVSkwWAK6bNYWjwUw9h8n01lu7SeEqEByPKBOnYJgfYK
 Bk8MkXCSIgHR1PWGXIG1yXGeZagy3y6nFUvkacuPojprCJElYc2Sk5OWSKc2RFn6KtTHC53Dp
 KrpJtGhCsbz4UjdQfVOewtSqKTRp0G3mcO8/Psqhn1f2d6JpoL0TQEVXFJKHVQyDn8k//87vC
 85oKd0YZroFGokCh+VP+cg7SZ9a9oE5/bpdKjSHbrbLk0n9p0CaJ9BclUPyFMOkkp+FSUR1oi
 LDsqSB1ItSuWdunI487NSCbTA0FviLZ1+NYcaNK1G2zc8wddGv+/cTcXeqRNUDuVbcguDH54D
 yNwdoDwImU3JwcLIcAhouNnzeGiUIIkcQ70pExIZ/VvKKO4jRDpY2rq6h/hzUzGdWBtNtZHpf
 1tYnZKubZP1ut/l8OHqlDzQw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720898802; x=1721503602; i=fiona.klute@gmx.de;
 bh=YGkRU8CtNxFmJXhlsU+eDmOsSVCpuWzhw/qjMowD6Jo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qONUwQeZkhVBUE5taQvgkU2hleCJXoS2HYd6HceSuzYPQLkqGl49FVxZSge0MF3d
 ZVrYWpM+Qsa9Mx+3GocMMsQbDWjDTqduvezW8oREfHhPAn8XcxQCdhZBI4Xx6Endj
 4+BXwvZ4CUNOSYMgXus1AvYhX9tlKB5+n8NcftlKZSmeNNdMvgbQ4x1H+69TZk4n/
 PyFJgqSZbfnM7FjDsU2fxHHVx9bJZATbuwET+q5auVaTwgkdp5LJK8PnKDpw5G9NK
 5u6ziBgRA5tj/My52ptgM3znILNB5UJxOIz4iYL0YfzZuOA9cN+O9idnQkMi+zRK6
 5+1EU2in4bF/bcvjNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qONUwQeZ
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.07.24 um 18:10 schrieb Brandon Maier:
> Hi Fiona,
>
> On Sat Jul 13, 2024 at 11:52 AM UTC, Fiona Klute via buildroot wrote:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> The BR2_EXTERNAL environment variable is passed into the container,
>> and each path listed in it mounted. This allows using external trees
>> when running a build using utils/docker-run. Testing the existence of
>> the variable instead of a non-empty value allows passing an empty
>> BR2_EXTERNAL variable to disable currently set external trees.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>> Changes v1 -> v2:
>> * Correctly handle spaces in external tree paths
>>
>>   utils/docker-run | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/utils/docker-run b/utils/docker-run
>> index 1adb02d74e..8024c2d3a3 100755
>> --- a/utils/docker-run
>> +++ b/utils/docker-run
>> @@ -90,10 +90,21 @@ if [ "${BR2_DL_DIR}" ]; then
>>       docker_opts+=( --env BR2_DL_DIR )
>>   fi
>>
>> +if [ -v BR2_EXTERNAL ]; then
>> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
>> +    for br2_ext in "${br2_ext_arr[@]}"; do
>> +        mountpoints+=( "${br2_ext}" )
>> +    done
>> +    docker_opts+=( --env BR2_EXTERNAL )
>> +fi
>> +
>> +# dir names might contain spaces, so split only on linebreaks for this loop
>> +IFS=$'\n'
>>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
>>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>
> This will invoke Bash glob on '*', '?', and '[...]'. We can fix that by
> parsing the lines with `read -r`, for example
>
>      while IFS=$'\n' read -r dir; do
>          docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>      done < <(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u)

Good point, thanks. I've added that in v3.

And I just realized I forgot to add your Reviewed-by to patch 2 during
respin, should I do another one or is it easier to add that on merge?

Best regards,
Fiona

>>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>>   done
>> +unset IFS
>>
>>   if tty -s; then
>>       docker_opts+=( -t )
>> --
>> 2.45.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
