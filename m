Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE4C88E45
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 07:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D264340A40;
	Fri, 11 Sep 2026 07:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DydNJjOVrKxH; Fri, 11 Sep 2026 07:42:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AAD5E40B25
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789112540;
	b=snitLOGBKcosdonW5V2mGEZTXlVs+lyLMV0lwibNefAD7HgmcoL7NpMJeXET435ci6Ac
	 GWxci7djhcHKXHqi0shNolifLaotyqggMiLL+vR6CdRXO682wDGxZoN4zoEM2RMUcC6Al
	 7EKzhqSJFC6ny4R07N30S1am5Px0lw7/hq5iIiVb8U3LJpggYyC13oO5/gQa5wAsyHoCq
	 8jaTBlfhk+k047HSxBQHQwtnqbDxTPSF4fdG4s0rUbs46n9ui5gjAi+oeCJqmIOalKtrM
	 UJZZ5zGEX3gV1Wnd4R+fRtrxc9IvEWXBGAFk+q9mSUS2T9rvNjpzsZyLEQIpXl1OBIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789112540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ycjj15P/kKo0G7MsGSM4Od3K8m9PvxYFha7+luxBRhk=;
	b=gffMHLyBn8k7v2sw8dFQB8trXk4NWdej4xfRmYSJiVeFaqsskJsVP31+bMoHQascBNek
	 sYuJBkbq+xO5xlZgDEgAGpCS6fSGUTURMSQR1QtfZLVhHKYisrgzj44yR/nN6SZcVe+91
	 qBBWHiCvtMgM93PnU0oHo7Rk7nUY9KK1/5IhxOAOHbyzr2oOW7TywxTHFLeFhMQrPW2z/
	 wEurhtAMpnVM7WQjs+Pclj7E1XcknVrJzCcAEROL6MVyplvsn9YVq06/zRCq0NA2ZwyFP
	 1dybDtvMzfDDAGq7is+X6ehZKEv0B0nEvkiSaXAWL0JulDb57sD5EozQPwPj3x81Hdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789112540;
	bh=Ycjj15P/kKo0G7MsGSM4Od3K8m9PvxYFha7+luxBRhk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdfe7gpXL8f/r29PRzRz/2f6Q1p0sdSVTEYOGG6iGJ0hGwMmPJmrlMoDpVfDzYRaG
	 zvp8sGfYeLVaieOJmgdkfZnaTKshalhEQABtjhddNudUZZ7HCvh3w+alNERVnUUEPN
	 AxbCXCUHnAkLl/G7iTrlPENdU8AX/tYFJwNu3hbgVTns3MjQFabwTJ83zje7CzpZfC
	 OX+hYXVYAB1HfTzVMSiDKNq/w2ZKoHoNUVxNOICYhqWxj3hTF8QdVG45NL5qj2jH/X
	 exV6Vq7G3f92XqPgipI7GAbpwRmW/QiGNuxQi5n2O0fiH/Io08UFODKX8KhkX04jjM
	 xdAkBx4BejL4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD5E40B25;
	Fri, 11 Sep 2026 07:42:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00E9549D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B4960806
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb139MJRirlQ for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 07:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C49A4607E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789112537;
 b=gnasCztFNsT41a7jPV7gxUHHqzuMIKrOamRbDEbocnZ328P13l3/3I+pRVwcHru1Hzc0
 uzYk+N7hT1B8DG1JdMB8Z8HKNp5Ah0Lbxz5ECWNgjL9H1n8tKtfjLOrgjuyvcdHevfxFT
 eXZ1t6/mEP6pLnUQzSValbWmk+eetbNJsHOEb52K6YcDZK4YwGAbORaxTd1Dba5Doeika
 R9dXzpaA1SODUcKOWX9GTjINqbNrYleVbatJEcRz409imr6bkqHAYTYUZAFtAuDP1g93p
 0TB/ikzRaxqCIiGdhui7swjgwxJgSPIFhHiWl6igcizud73yS0SoNMa30Y5jIRipNRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789112537;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=QoYXmZjW4FjhYItFHyjud1LuZp6uVhzGb5aHR5WKodQ=;
 b=plXv9zJl+VNdEJcBvTdamfGLSuJqDWjUd1hNMmbv8Y+//J3zKLMhdvzD2A+fFTSf/B4Q
 CaGJwSHI8pSPaZv7BPS513W49R6wlsfCnC9chDHOnoynGPnZTsT6gVd3vyqF7b69tk3UK
 DVb5flQKJnK8K3xpQPMfYxOz0/eYfx4SKkp0vp9zebuLbh4p7kkxfzdzNshPdDj0kjlQH
 OEzJnxrolioY3pl0397HgUyfTnXPzl0ln6IgMkJqdG0y2silzREBwyX4wpRcKwiJ54Vxi
 AwV0ANc5YnKvuuAIMjQzCNiCAxySBTM1vmqpBzFZMi6JpZIN9HaKYdsDePFWKj55okw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=kn5dTawr; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=kn5dTawr
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C49A4607E8
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:42:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=kn5dTawrIEKAjjllHIiByKdRYUaLxi9ZGUSVaa4RKbfSnnMOrE02+0UYMC7FE9JZ2XRPGGfVuo15mhKN0wVUqIdey5mYD4oREffGWjs4AEvrQKafWi4/nxg8RElyR4Oq398wWTS0fKdXsehKNKdGa82DsQEKMaus8oJzJsajelRto7QsKWEPYikSFz7/VTUlPrxp1tyJ/kAFuA5CbQK7x5s52F/hw1OTmDM6JSMkcW8DYg15hxurpIy+8PVyRuZu1q5Y9Id1e+7Vp2RjLbNQkbF9UFo+FeGBDzbbBGn9JR5FoSjN1E8GUMi8ElDuIxayaP4agIe5glKUFLjKZ3tGLw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0tH5YpeGqVMPE79p8+WUhKNnVYxfg6VJfg7klo/frPk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1282038000; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 07:42:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x4vth-0000000Evv0-0c91;
 Fri, 11 Sep 2026 09:42:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
In-Reply-To: <9427a5cc-7a82-41b8-ae77-036780d5136e@rnout.be> (Arnout
 Vandecappelle's message of "Fri, 11 Sep 2026 09:05:48 +0200")
References: <buildroot-2025.02.18-announce-1789067743@buildroot.org>
 <87ecf0l44q.fsf@dell.be.48ers.dk>
 <9427a5cc-7a82-41b8-ae77-036780d5136e@rnout.be>
Date: Fri, 11 Sep 2026 09:42:09 +0200
Message-ID: <87y0d8jktq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot 2025.02.18 released
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@rnout.be> writes:

Hi,

 >> I don't think it makes a lot of sense to list the glibc security
 >> fixes
 >> twice, just like we wouldn't list mesa3d security fixes for
 >> mesa3d-headers. Maybe adjust your script to filter out packages setting
 >> a custom _DL_SUBDIR?

 >  I actually do that manually - it will be much easier to drop localedef.

OK, also good.

 >> We do not have a "powerpc" package, so I guess that was somehow in
 >> relation to the toolchain change?
 >  Heh, indeed, I didn't realize that by writing "powerpc: ..." my
 >  script would interpret it as a package name...

Maybe only consider patches under package/ for that? That is how I do it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
