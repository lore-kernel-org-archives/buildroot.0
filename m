Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5E8C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB5A38116B;
	Sun,  6 Jul 2025 16:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COb3OvL1IjRR; Sun,  6 Jul 2025 16:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8579D811FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8579D811FC;
	Sun,  6 Jul 2025 16:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2E0A19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A3940812
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJ0xZ59yDc0Y for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 16:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BE61407CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE61407CD
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BE61407CD
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751819713; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CXG5oi9JVWryIqo3S6i/8VdlDxWAQidxU/7aciDmQ6wrCIhoSj46hq6dU70DsweU6V9A3BjWRJ4kCqn8puGxKxZcenbEcrokKrnc9/Zhe4OGnzeiiY3qiBlLyLIrQ7Mt+w6cvm22aYypGxc2Cra/d+9gj+DcGrwJTjyU+Ma5hbA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751819713;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GPffkGyoJugj2vBtxCPDCXKa3EQlRTeHt1BEQSgEpKo=; 
 b=BwZrKp7Zj3JQZDfPZHKyvq9XRUy646+Jl1oGIAMM+Rj3vUdO4qWDO9zO157G9FpUzTMXV3z6Dx3TA/OhqJpaV0kSkQTVCkD1u+irHu3+7XlLcHLtAQN9IUJzg8l6g3tP3TCAi0P0lvgguJ/RdLsKlLvKN3A6hbB9Z6kfGF1KuuU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 175181970957748.606317203160415;
 Sun, 6 Jul 2025 09:35:09 -0700 (PDT)
Mime-Version: 1.0
Date: Sun, 06 Jul 2025 12:35:08 -0400
Message-Id: <DB549C4JGVD1.MI02P3FS4HOL@matt-silva.com>
From: "Matthew Silva" <dev@matt-silva.com>
To: "Baruch Siach" <baruch@tkos.co.il>
Cc: <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <DB4NQ16PKVED.2I7DATK1AFI76@matt-silva.com>
 <87ms9hrjul.fsf@tarshish>
In-Reply-To: <87ms9hrjul.fsf@tarshish>
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1751819712; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Cc:Cc:Subject:Subject:References:In-Reply-To:Reply-To;
 bh=GPffkGyoJugj2vBtxCPDCXKa3EQlRTeHt1BEQSgEpKo=;
 b=E6u/z7dEIgvWgXxlmZJ8BXfrMr06SUJxYJfCQ+UBxsz8e/uv6TFK6CNeC33JjvJ5
 Zap0qphlTTxABtplQLPtUOcLP5nmUEFgY05y8vfwdjiXRDEoaH3Kjg/IPAvwrAUx1gC
 XxkZ+TXcLG6o9UstxcZ/eMx/G0NY/Bd9R4OcsYsw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=E6u/z7dE
Subject: Re: [Buildroot] [Question] Difficulties with Autotools and
 nilfs-utils package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun Jul 6, 2025 at 1:04 AM EDT, Baruch Siach wrote:
> Hi Matthew,
>
> On Sat, Jul 05 2025, Matthew Silva wrote:
>> I am in the process of attempting to add partclone
>> (https://github.com/Thomas-Tsai/partclone) to buildroot; however, I'm
>> running into some issues with its dependency on the nilfs-utils package.
>>
>> I add it as a dependency both in the Config.in and partclone.mk file but
>> when the autotools ./configure runs for partclone, it fails with an
>> error saying it is unable to find the "nilfs.h" header file.
>>
>> Looking at the target /usr/include folder, the nilfs.h header is
>> installed there. However, it is not present in the sysroot /usr/include
>> folder.
>>
>> Comparing this to the e2fsprogs dependency that partclone also has, the
>> required "ext2fs.h" header file gets installed in both the target AND
>> the sysroot /usr/include folders.
>>
>> My understanding is that autotools is failing because it expects the
>> nilfs.h file to be in the sysroot. And it needs to be in the sysroot
>> because that is where the cross-compiler (x86_64-buildroot-linux-gnu in
>> this case) looks for files when building for the target. (Please correct
>> me if I am wrong on either of these).
>>
>> I am unable to figure out why the nilfs-utils package will not install
>> its headers into the sysroot folder. I am not sure if it is a buildroot
>> setting or an autotools setting that would be the cause of this issue.
>
> Try adding 'NILFS_UTILS_INSTALL_STAGING = YES' to
> package/nilfs-utils/nilfs-utils.mk.
>
> baruch

That fixed the issue perfectly.

I appreciate the help, Baruch.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
