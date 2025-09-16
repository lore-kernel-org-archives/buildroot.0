Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE2CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 14:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B44605C4;
	Tue, 16 Sep 2025 14:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fha3NzIvi_Zl; Tue, 16 Sep 2025 14:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A986060634
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A986060634;
	Tue, 16 Sep 2025 14:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43EF8199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 297B7401DA
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5XCmfRVafGV for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 14:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B1E840616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B1E840616
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B1E840616
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:06:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1217083838; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 14:06:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uyWK3-002bGR-32;
 Tue, 16 Sep 2025 16:06:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <20250916093105.525147-1-peter@korsgaard.com>
 <20250916135142.978443-1-thomas.perale@mind.be>
Date: Tue, 16 Sep 2025 16:06:19 +0200
In-Reply-To: <20250916135142.978443-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Tue, 16 Sep 2025 15:51:41 +0200")
Message-ID: <87zfaua3vo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=n7FHtzqA1coBR6BCL5eWQL0wCMg6sGVaHKGhGMzUizYH4gcC64DM9KzsFM75EjZvAB/zo7uny4Ppy3bmNa/gNskE29V7OwZ3bUvUCgfynfuLQXcKB24PqmNI5SqBZYHhoIWVLHYtJYDj3pL79BNXBbhpBdYAiIq9TUciL4iEfFteLvyNCr+YKbRTSzB/GK6tqhmRTwbM/QGIDiu+W4r72pSzKT7WfhuZ/jeO1RwgxGYm22M+Rl5JduOJMBMYEKOENtmyXk1jy2b2UenKnJeTDMxB8kYmgZ4iim/Z6DNpZmdAYD75CpxwmrKLLfU+5cSFZ6QeH63lTvvnr9Z4L4Fo8A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=UsgC0VTt5hgKKISZ5XwcjomKd4jMCAbDFLvOqA7bj0Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=n7FHtzqA
Subject: Re: [Buildroot] [PATCH] package/cjson: security bump to version
 1.7.19
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > Hi Peter,
 > In reply of:
 >> Fixes the following security issue:
 >> 
 >> CVE-2025-57052: cJSON 1.5.0 through 1.7.18 allows out-of-bounds access via
 >> the decode_array_index_from_pointer function in cJSON_Utils.c, allowing
 >> remote attackers to bypass array bounds checking and access restricted data
 >> via malformed JSON pointer strings containing alphanumeric characters
 >> 
 >> https://nvd.nist.gov/vuln/detail/CVE-2025-57052
 >> https://x-0r.com/posts/cJSON-Array-Index-Parsing-Vulnerability
 >> https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa4139126967f6d289b675b4b36fef
 >> https://github.com/DaveGamble/cJSON/releases/tag/v1.7.19
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > I see the CPE reported on NVD for this CVE is the following
 > cpe:2.3:a:davegamble:cjson:1.7.18:*:*:*:*:*:*:* while the one present in
 > Buildroot is cpe:2.3:a:cjson_project:cjson:1.7.18:*:*:*:*:*:*:*.

 > Is 'cjson_project:cjson' still in use ?

Ahh, no idea - Just saw Debian pushing a security update for this.

The CPE was added by:

commit 7edfc478ea16a78b98a1e8172b6de3e3abed989e
Author: Heiko Thiery <heiko.thiery@gmail.com>
Date:   Thu Jan 21 14:36:42 2021 +0100

    package/cjson: set CJSON_CPE_ID_VALID

    cpe:2.3:a:cjson_project:cjson is a valid CPE identifier for this
    package:

    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cjson

    Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


And that URL indeed now only shows the davegamble:cjson entries. Care to
send a patch to update the CPE info?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
