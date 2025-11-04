Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A316ECCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B48AC40C91;
	Tue,  4 Nov 2025 08:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fVcY3HbzESf; Tue,  4 Nov 2025 08:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA37740C84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA37740C84;
	Tue,  4 Nov 2025 08:29:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B42AE278
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 08:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D0381D24
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 08:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3lxeeyloH6l for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 08:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9489181D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9489181D21
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9489181D21
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 08:29:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1548230135; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 08:29:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGCPc-003Cpo-0B;
 Tue, 04 Nov 2025 09:29:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251026211817.2695263-1-bernd@kuhls.net>
Date: Tue, 04 Nov 2025 09:29:07 +0100
In-Reply-To: <20251026211817.2695263-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 26 Oct 2025 22:18:17 +0100")
Message-ID: <87qzue8alo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=sX6FbjfhRueoAvhZO32y8jEo7MflIzFK+FCK0huu8wC9VDzMxir+Tx0/KoANlxG2cPc1affKBrkWI9UPRI/GYcSqml4GQhv6nV29zpvWnhB0MnKOrH4AvJMuXVybl0GkyvaFgkEj5yhIp/dcGrxxd/M+uTY8oR7cBnao2ddkVisNGOvVL8hvcW+GAoSGtk9xJWZLGn10EsoFKsn0jvnwmoU2yiAqdIG918xK9ENrP/46jgU69W0nhjTtn1k8GlahOiBitVUSGsLhpqmGmRW2IdzSdxGyqmhkxLIY/W5KW1kW+xkN/o/213avYIKfbi7U9lAQ0r2pmCAn6kV81A06vw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=/9muY9WX2g97V1dg4hoxWR2YyzJOB+1rF2Z8brNFxuM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=sX6Fbjfh
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: needs threads
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit accb006d9b62079b56bc1f1388b558a60dde277a bumped libheif
 > to version 1.20.1 which includes several commits unconditionally depen-
 > ding on std::mutex which requires a toolchain with threads:

 > https://github.com/strukturag/libheif/commit/14f956726c79747fc1fb8c041ed767c1632704eb
 > https://github.com/strukturag/libheif/commit/6bb8cdaa8a7ba78066c899c3791546b80051c70a

 > Added dependency to BR2_TOOLCHAIN_HAS_THREADS to Config.in, removed
 > configure options handling non-threaded toolchains and adjusted a
 > Config.in comment of the only dependee kodi-imagedecoder-heif.

 > Fixes:
 > https://autobuild.buildroot.net/results/28b/28bf68147382dada33cbf9b299396dfdee3fbbe6/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
