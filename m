Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79B6C369C2
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 05:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1956F6076B;
	Mon,  5 May 2025 05:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqWzn5QttpVC; Mon,  5 May 2025 05:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 763E0606F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 763E0606F0;
	Mon,  5 May 2025 05:33:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 810E8EA
 for <buildroot@buildroot.org>; Mon,  5 May 2025 05:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FFFF406F2
 for <buildroot@buildroot.org>; Mon,  5 May 2025 05:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63O66Vb8LVY2 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 05:33:33 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B28BF406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28BF406E2
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B28BF406E2
 for <buildroot@buildroot.org>; Mon,  5 May 2025 05:33:31 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 4C0B6BDE5F92;
 Mon,  5 May 2025 07:33:28 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 05 May 2025 05:33:27 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Praveen Khurjekar <praveen_khurjekar@yahoo.co.in>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.9.1746360001.2264325.buildroot@buildroot.org>
References: <mailman.9.1746360001.2264325.buildroot@buildroot.org>
Message-ID: <762f9f40a669ca40b979045e76b73721@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1746423208; bh=PEHM/qa3IArrUUgang89Aandoce3ZbvGmO6NUFG47tw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=oEFxenCQunFZpxmK0ChS98tS/MaQw9wGejgGEm1+XlNtZWLmIDsu0b4DRa+VKJ116
 8lIExTUF0c8eZe8MTh4u5c7TcNwBx3Afi4/hicoYT4mDeuRcGn1pO0BLADHuNQNZAM
 uYT2ykLQUt3JHc4khyDUmQv+YzROE2KaTRRyc8IQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=oEFxenCQ
Subject: Re: [Buildroot] Error in Systemd Build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Praveen,

On 2025-05-03 20:57, Praveen Khurjekar wrote:
> 
> Encountered the following :
> /home/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-247.3//build
> usage: meson [-h]
> ???????????? 
> {setup,configure,dist,install,introspect,init,test,wrap,subprojects,rewrite,compile,devenv,env2mfile,reprotest,format,fmt,help}
> ???????????? ...
> meson: error: unrecognized arguments: 
> /home/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-247.3/ 
> /home/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-247.3//build
> make: *** [package/pkg-generic.mk:263: 
> /home/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-247.3/.stamp_configured] 
> Error 2

The partial excerpt from the error log is not conclusive. It would help 
if you could post your defconfig [1].

> 
> path issue ..
> 
> Thanks,Praveen

Kind regards,
Andreas

[1] 
https://buildroot.org/downloads/manual/manual.html#customize-store-buildroot-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
