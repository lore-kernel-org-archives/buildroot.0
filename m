Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F22606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L8SP97+g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ZKX7EFgq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6124405D1;
	Sun, 25 Oct 2026 17:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwwBMAyTf5Yh; Sun, 25 Oct 2026 17:03:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E58964057E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792947832;
	b=nplR1ML9n5IbtBJ1aopg3KGDfX1fXszkvVvmZaWmu3Ypvixu7Dq0CSTvq9zUKpz13WcU
	 Ugh1LBMstt4qzvQ9VkxFXJf+DoWQOQySA4UHajgZM3PwSxJI8wnfGmTERteWEmHN/LcBa
	 cTJHVlXSL9XLQGQQbgu3wKh7tbO+GJwbQeRaIYjKBbRjZDfs449IVyOmymUz33OHPFcgI
	 HRM709CbUOAdmwT9M/QOAj30LaEf6dvdnJzuf4Rs2MrkjJhtRbzkegdzHQ08TBENUGvwJ
	 EwXJeLq1pDj4fiy/LYhmpdpUgnqGy7MQyXKFnqSMFXEjHHibb6hTcnKsK3h5Cf81eww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792947832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9yW0E8grhOnY+asWKZ6RuWCVI/RCCEGJjt2aIFFMbos=;
	b=Fl8T/hfFRSKRUFFH5zEKwTzinkHWfuEPCpObbTttC6bBjwDUrsqnWcftQ8hxJ09ZArWu
	 QNbDx/C4ZQeKPFMqd60sXmERH8k9iEcBvxr8g/zp3j59md7FhNBhIPvPPjGWtuUdjqFqE
	 SLck5h5qissVB7McPYMhf0DDBUdB5qNBHceFo1KSWlqTUm/Q8vhQqagsspuGbPjHG+QfM
	 HiLV25EBioXAzqxENstPflsVwAwuZeUETWdKJoQnMnAovLP2PMGjdB63Jlw7thqP6XD02
	 zGEy/KhxU+CS7cW0YaGCBHUqwKrcvShHZRmsQWDvvkkYl64sHJEuOoM96hETCwGZwjQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792947832;
	bh=9yW0E8grhOnY+asWKZ6RuWCVI/RCCEGJjt2aIFFMbos=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L8SP97+gp/1lXtoJCfE/OTkyziBTImI+8ERyrqjm8Du+ru9n4Il9k9NvVXhJn4hZU
	 kHbBIhFOwpYB67s55cmPPxUKaF3dTwXYC8Lg4xyOwINPLDxmcETIq8URpAfmy6Phoz
	 ZKPDXdXQnl1z6d5vk/Z8Y5H4APUqx8SHSgqYcC9nKoqLJIbYItm4/L9ahpVNylRz2b
	 vWQYlyu2dB61uRLpgS53R6ZQGhZHAUFnXqWg3A3t06Jeb/xIrd/XMY//O+y1xQXrkR
	 PSwA3VaXQ33PA1O45MWlTORF2cKQToiQVhrxp1g0xTsQE+mfFvAf24wyhH9rcpYjTp
	 miGewBf1I0hKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58964057E;
	Sun, 25 Oct 2026 17:03:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C70114D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD6EC605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vk0VZXjthT-x for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:03:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11164605DA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792947830;
 b=mdLHOATASnLK9rqz5rmuaVpsn2jZ3w/yRlzXx5Jh5R7xpOKhktQDd6Y6YJOa/siMIYzb
 p4Sh1RL5sn041huCyJoOOxRfuziBTt6yrUUBm+yP9GlLOM2XCwpxcLsGGqPqd+R5K04EK
 +FitSlxjLZJcTG69SVt0uJxBsOfx/kjb9gtQOP7kf0ZaMtG/ayy0V6eM5GIY6EHhizCP8
 7hxQ54OftczQNTJwSAe2dsy2evVylQvl8GS5+ZGCYERzt0ed/43mVtuUa6Mr3JV/M+4SA
 fixdXk2ZwRwCyAJS0AYFBoY2lDYnDNgCqyWWX3ctx4SjVyQPL6cxxNXSdo1DcoqTYjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792947830;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=1jTW7+SiXK0bwoEWZz+JHmEjjF6yfqKP/P48FP5Bb58=;
 b=IdA+Dqkrhpeu14keASSYZQRIMs6A9EnUs3jzr5eMB/MmBnKrBTp/Q2n6Lf34OU22AndR
 46gO9++8mWvnTLfdjf9xgVPVIK6lMKHJ83eSoE13YklVEyHJa6mh4KQ1OLJhb/vqYCJvV
 CpzqyPFF5gMjuULTFok39AN40dif2D/S53Ik/KgsqJvrcxXp123mZnlDH2DsUujEHGKoY
 SZVIB12XupXcUsLKza8k40Fou3NpL/OXb3TsSR+Y5X9pd/JoOJNR2bdgi0M/uuGnoi9dJ
 C6SPy9Qfy2YgrMCkdfE65w8cM1jXMEapxH4E2+iOgoZ2JAbfTOLMFI+K6+cYQWLBdVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=ZKX7EFgq; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ZKX7EFgq
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11164605DA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:03:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZKX7EFgqjtqAr1gqkh36EZAk8kXPvtAHecawn9SyzWcIeqTsGQHVFl/xwYk+7K+s0USc/x6RfIuOJsAAoAzUscwXqSzvYgzIY/zu/5QjVSD1Z1Awnr0r7sl8QorwW4WT1xSkpSaKLiak555Zo3T8Lh/uufnZ6kgtYFVf4NUps0HMjRjMAKgZxw18nc7gZR55UZJNYz17FGzFCdXcg/s6i4lVTfukja9wCxo6IsRjf8PdYDfmI1m4szF3U3iBhpffHw88+sVOmt3sdWMTNu3TV1n3ERaUuX9kKaL/MxaznvGHMzdszmKuvIyE+4QC77oojDjUOXrYFzPEeHGuLOmymw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -427996519; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 25 Oct 2026 17:03:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xL1dI-00000007ZDo-3gru;
 Sun, 25 Oct 2026 18:03:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  David du Colombier <0intro@gmail.com>
In-Reply-To: <20261025110149.4023756-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 25 Oct 2026 12:01:49 +0100")
References: <20261025110149.4023756-1-bernd@kuhls.net>
Date: Sun, 25 Oct 2026 18:03:44 +0100
Message-ID: <877bj5soen.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/x264: bump version to git
 0480cb05fa
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
