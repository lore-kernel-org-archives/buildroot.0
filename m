Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A8C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 06:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE7040448;
	Wed, 19 Feb 2025 06:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGxnHoz12Bjq; Wed, 19 Feb 2025 06:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8535B404D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8535B404D2;
	Wed, 19 Feb 2025 06:36:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69DA5127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 06:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 497B7608AC
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 06:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uau-FWU4G_V for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 06:36:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.56;
 helo=send217.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF65160720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF65160720
Received: from send217.i.mail.ru (send217.i.mail.ru [95.163.59.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF65160720
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 06:36:30 +0000 (UTC)
Received: by exim-smtp-844687bc8-kcqfl with esmtpa (envelope-from
 <fido_max@inbox.ru>) id 1tkdh5-000000001Jo-2ito
 for buildroot@buildroot.org; Wed, 19 Feb 2025 09:36:28 +0300
Message-ID: <fa839ef3-adc3-4a72-a9ee-90f97e5d39e8@inbox.ru>
Date: Wed, 19 Feb 2025 09:36:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <Z7HdD63RHkaM8X8t@waldemar-brodkorb.de>
 <20250216151408.710943bf@gmx.net> <Z7Vv3vYTfVThyBXU@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <Z7Vv3vYTfVThyBXU@waldemar-brodkorb.de>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA04BC6EC4D9B4475EA3A2EBA8C4D08F9F5A00894C459B0CD1B9FB1B2639DCF4F18B9487ABAC94A94B542A9546C6784ED0FA860A06F99DBB7FDB4C6784DEA8096F07
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A8325FA649D0A450EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063781BF90BB6B3E56078638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C6F5FA8CA944A3FF8B3C4BF96D0E67465DE8BFF8CC1BCFC220879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C03F781F11CD20E21D8941B15DA834481FA18204E546F3947CD166953D3EA3826BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006373E1F328EEA58DAAF389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F7900637B8FA30D9455089A722CA9DD8327EE4930A3850AC1BE2E735444A83B712AC0148C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5A6A07D872BC3384C5002B1117B3ED69660403147275A95679E040399BDE4761E823CB91A9FED034534781492E4B8EEAD05E80F4396618BB2BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF32A15BE908F8ACA42E53DA41913738F334D7480210130D6F739669970CA90D27622FCE73A124D830526A8B1FD8BF66B694A4AF7E2E21EBD95336608260EC2751E1CAFC26F148782383C93C5AD2DA449913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrsPth1r0FOE4=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21905654D42717B076BFF4919E1EED4B290B47E1DCB9402365B90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=MA7kwuvb5+1Dp0YePfWwNfmd+2706FKN2CRsQLxdrdY=; t=1739946991; x=1740036991; 
 b=oKfWw6IegUwzh6VDtC3b6W/SFGQfCGSFOeIso7FVZMuPT6gnaf8AlJATGrlWWStud8TKc5GG3mQ
 JAoMPeu6kMDooe5r//cGylDMVxc+DRrFSPfBd5J82n1kirep3hhpAeVQv6vq75oNDceEPA2IQAk04
 it7c4YisKjBmYMYz2xFY/snH6sGaJNTfW7AG4y6dNe4PlrfJEdyPdYMLPvUZcAZCH9SJWpj6CMbP3
 CT4npahs66h7rNh0Sio7X2IvjZecFt0Vq5rx0Ho+NK2yYt3AsPkJQExQl/KCC6kdfDm1WjxCtlPQI
 nF9oe5sYx6h5/68VfApjVtVx/ReTC9C0VGDg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=oKfWw6Ie
X-Mailman-Original-Authentication-Results: exim-smtp-844687bc8-kcqfl; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] postgresql issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

19.02.2025 08:45, Waldemar Brodkorb wrote:
> Hi,
> Peter Seiderer wrote,
> 
>> Hello Waldemar,
>>
>> On Sun, 16 Feb 2025 13:41:51 +0100, Waldemar Brodkorb <wbx@openadk.org> wrote:
>>
>>> Hi,
>>>
>>> I am using Buildroot master. I try to use Postgresql Server.
>>> I have locales enabled and building for a raspberry pi5.
>>>
>>> wbx@neon:~/buildroot$ grep LOCALE .config
>>> BR2_NEEDS_HOST_UTF8_LOCALE=y
>>> BR2_ENABLE_LOCALE=y
>>> # BR2_ENABLE_LOCALE_PURGE is not set
>>> BR2_GENERATE_LOCALE="en_US"
>>> # BR2_PACKAGE_SYSTEMD_LOCALED is not set
>>>
>>> Journalctl reports:
>>> Oct 08 15:42:34 buildroot systemd[1]: Starting PostgreSQL database server...
>>> Oct 08 15:42:35 buildroot postgres[268]: The files belonging to this database system will be owned by user "postgres".
>>> Oct 08 15:42:35 buildroot postgres[268]: This user must also own the server process.
>>> Oct 08 15:42:35 buildroot postgres[268]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
>>> Oct 08 15:42:35 buildroot postgres[261]: pg_ctl: database system initialization failed
>>> Oct 08 15:42:35 buildroot systemd[1]: postgresql.service: Control process exited, code=exited, status=1/FAILURE
>>> Oct 08 15:42:35 buildroot systemd[1]: :5:185m:5:185mpostgresql.service: Failed with result 'exit-code'.
>>> Oct 08 15:42:35 buildroot systemd[1]: Failed to start PostgreSQL database server.
>>>
>>> Any idea? I have set the environment variable LANG to en_US.UTF-8.
>>
>> Reminds me of an aged patch set
>>
>>    [v1,1/3] package/glibc: install locale cmd independent of NLS (see [1])
>>    [v1,2/3] package/postgresql: needs locale command (see [2])
>>    [v1,3/3] package/postgresql: set locale for initdb to C (see [3])
>>
>> ...not sure if still appropriate...
> 
> Patch 3 worked for me! I get an error about missing locale command,
> but the database is starting. Let's see if zabbix works, too.
> 
> @Maintainers, what you think about adding this patch?

About locale command in musl:
https://git.adelielinux.org/adelie/musl-locales/

We can try to integrate it into buildroot.



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
