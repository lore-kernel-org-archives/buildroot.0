Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A199AC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 18:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2A784583;
	Fri, 31 May 2024 18:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hrbHpwbKXMu; Fri, 31 May 2024 18:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0554A84584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0554A84584;
	Fri, 31 May 2024 18:52:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCFCD1D4808
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 18:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C94C961170
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 18:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rl4twUv4wHBe for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 18:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F8B66075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F8B66075D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F8B66075D
 for <buildroot@buildroot.org>; Fri, 31 May 2024 18:52:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.89]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1s72Y32hhO-0051O9; Fri, 31
 May 2024 20:52:01 +0200
Message-ID: <2a1e7f0e-e845-40a7-99f7-8d85791c0a81@gmx.de>
Date: Fri, 31 May 2024 20:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240531095441.2506287-1-fiona.klute@gmx.de>
 <Zlm1gvwHFVeVJTDR@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Zlm1gvwHFVeVJTDR@landeda>
X-Provags-ID: V03:K1:54kvZBKUt0aTXQlQFST5cFl0joztDzy1DjkSTRXtNCwVc6Witbe
 1+7ykZFg/TwNEB3szYEK1uLdysbkgZHAD54oLCWSzof7eemV6gmqkQeXwEaz7PRrXtaZJds
 IScshldymiGxGvTJUXJHoeZyU0gKPS+7Zf8PLvay0SqLBsyC2SmHJRKDjFNcsWUrXiEJ0qz
 9Xn3nx7nXMBDPxm7Zn91g==
UI-OutboundReport: notjunk:1;M01:P0:3IaR2GImG/Y=;7eYNQGkwi26Y2UzkxLCSNY7E+El
 APLSPq/xeJrgh7QuMSdhXRVPBgzTxoSZsT1qMvAFKrZuMau9vZw+0AzeYmUIy4VX8UL2aMMnq
 58WD9eV/bSjurNmT/rv72CN15XBtqWt1s7v/wQzR178P+49YASm22FHt/UdSk2EPUgviZRAqB
 W6oaZuXw6SL3TtjSjxDxdvIA1pQBBu6vzJmDwATBFNen21d1lwVewgqRvZyCozb/QY6r/7WZE
 Nal9QF8ObptOQk8AYHs9bcMSFYhmEoMu0sKSY3Yxt3oa8m1M8OXiXkP/S0Qz9OQqNjnmYGloT
 7bHqo3ZlOi2Trfg9zbmHgSHvJKIejFFxYOGU3UbNSTIZnVzs7tHX4DapUEHDTbVMInNRiflN1
 5ijOUD2Dj274Jz3Vo3X8SFVw1VbEMYVrHAXKeVuH1oChQf/Trp22xA3yqNe3DoTmKjTNNZrUM
 FzTQ3yvsteLhGAZYXla//pwfB92u/G+Eq3nvhbVNwwYnHcsJjr5+V/ewOuqDxgny5nZDqNwY4
 0IzV+Yt91OtzULagM0CvShy1SQ8AfF3/R1RfZQHX4YhXupgmak5OJ/D757CXd1VLdloqJTN12
 zUqM7g4LtciTjeBws9FqHXIOMlFvzLcK0YwRsEHr7rObP2/Vca3UjAB7B3A1dg8YjI0r8bsu2
 ebhNNp3fiPSge+3KZ/y9cx4LvXxM4UqYhXrOf5ovZltA4GCVB6MD3ONKMkbLAqbx6mdi2INdJ
 AU95J+mhZWtpk3WkwKXqek+dCYmNxIqb1jeNxynh4V11MhaFzdxsxOGugTRJFSJoZn0Iv2xes
 iCLP+AVzHKkOVOCVdFGgyVOMWGJMXvVEr4gnnU/8AwRDE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717181521; x=1717786321; i=fiona.klute@gmx.de;
 bh=NcSyuOXbSy18LqLOcj8kKBFGo28oZ/F1SpIiEBV6aWQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=S0Ti45SDk2IMUhf0BnffgEiwWyphb2rq/SfJw6w1DhMLz59B3+Mymj4Yt5bmDsVR
 gWtAcbHGWEltk1NnS/QTz5w3lUEq3D4FI+JLMlzUIRYcp2bwhPbopsQRDlg/aquwl
 jlgRpgEYxt0tLfUCq8EDs621TfDEzeaupWqCDeeJgW6ATJaxECoL4xV7nqN06PQ6A
 RwqtmbfPCJjM0Zs7rMJiK+W2HHmKYCow89w7/rGK7/K1bPfAoxq8+/FGMeRu7btrQ
 dIRgy0/A4qZfvaoObKc+jnTXYDlk11FY8qkYXGWnKaMPuf4DJUbrECGQ5IMhEJfl4
 24OdTbrDwcc5QxMPTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=S0Ti45SD
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: Fix init script
 restart command
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 31.05.24 um 13:33 schrieb Yann E. MORIN:
> Fiona, All,
>
> On 2024-05-31 11:54 +0200, Fiona Klute via buildroot spake thusly:
>> I have had constant issues restarting dnsmasq. Stop works, start fails
>> because the new instance can't bind the socket. Another restart
>> immediately after works just fine:
>>
>> # /etc/init.d/S80dnsmasq restart
>> Stopping dnsmasq: OK
>> Starting dnsmasq:
>> dnsmasq: failed to create listening socket for 192.168.128.1: Address in use
>> FAIL
>> # /etc/init.d/S80dnsmasq restart
>> Stopping dnsmasq: FAIL
>> Starting dnsmasq: OK
>>
>> Solve this by waiting for process to actually stop before returning
>> from the stop command. Clean up the PID file after to avoid potential
>> issues with the PID being reused after stop. The wait could also be
>> placed inside the restart block, but putting it into the stop block
>> has the advantage that it also avoids similar issues for any other
>> callers.
>>
>> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
>> ---
>>   package/dnsmasq/S80dnsmasq | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
>> index 175daf9d26..f957af3594 100644
>> --- a/package/dnsmasq/S80dnsmasq
>> +++ b/package/dnsmasq/S80dnsmasq
>> @@ -16,6 +16,11 @@ case "$1" in
>>   		printf "Stopping dnsmasq: "
>>   		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
>>   		[ $? = 0 ] && echo "OK" || echo "FAIL"
>> +		# wait for dnsmasq process to be gone
>> +		while [ -f "$PIDFILE" ] && [ -d "/proc/$(cat "$PIDFILE")" ]; do
>
> So what happens if PIDFILE disapears between the two checks? /proc will
> still exist, so cat will spew an error on stderr, but the -d /proc will
> succeed, we'll sleep a little while, and restart the loop. Not too bad,
> but still not very clean.
>
> I would have suggested to use the --retry option of start-stop-daemon,
> but the busybox implementation does not support it... :-/
>
> What about:
>
>      while true; do
>          pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
>          ( [ "${pid}" ] && [ -d "/proc/${pid}" ] ) || break
>          sleep 0.1
>      done

That's a good point, thank you. I'll send a v2 with the modified loop in
a moment, I've just added "-n" to the test if $pid is empty to make it
slightly more explicit.

Best regards,
Fiona

>> +			sleep .1
>
> In my times, busybox' sleep did not always support sub-second durations,
> but that has changed since 1.30.0, released in 2018, so that's OK. TIL.
>
> Regards,
> Yann E. MORIN.
>
>> +		done
>> +		rm -f "$PIDFILE"
>>   		;;
>>   	restart|reload)
>>   		$0 stop
>> --
>> 2.45.1
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
