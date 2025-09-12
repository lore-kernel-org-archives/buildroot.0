Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E173CAC58F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 15:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF8A4125A;
	Fri, 12 Sep 2025 15:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phavcacM81Ia; Fri, 12 Sep 2025 15:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A4041263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A4041263;
	Fri, 12 Sep 2025 15:29:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA2A225B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E73CF4125A
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjE3DlOoxfmo for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 15:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB9A8411DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB9A8411DC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB9A8411DC
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:29:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 293843829; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Sep 2025 15:29:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ux5iT-001sFS-0G;
 Fri, 12 Sep 2025 17:29:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250911171334.593571-1-bernd@kuhls.net>
 <20250911171334.593571-2-bernd@kuhls.net>
Date: Fri, 12 Sep 2025 17:29:37 +0200
In-Reply-To: <20250911171334.593571-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 11 Sep 2025 19:13:32 +0200")
Message-ID: <87qzwb4rku.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=u7NHXvd/jGS3nxxis6HUIBe6gjj7aL8LcJ+6urGwNInZeTmjJT0KP2LekyN1412ppVm4ny9Hi5VOf3egopffws+7EJqqRYV5qAqfH2PuMIzDidcK9Fgkgw8uuZResUjqomroZG52soyMuo6TaBy9Jq/lKr1R+DjEixKbi0VGhlXTOXVq7cku/XYJjWYyMCnEct184zUyvYrHy0y+0ASYWmdmGLXtOSR7gyrTErlfg6c12FaOIZsnoaSd4oDtSfWqteZ/fgfDWEcnjHlDIhdnnsO3HhaprlGFN5kRYNnBRWB/dVVQikhH7NAssiP8yE3HKJtR09TXt/rfIh4N/kikrA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=J2S1FnWwWQdz8uAMje+wp9QhaD48TaMuxkkmC+mlHow=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=u7NHXvd/
Subject: Re: [Buildroot] [PATCH 2/3] package/cmake: bump version to 4.0.4
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

 > License file was renamed upstream
 > https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d51510013565e
 > and updated:
 > https://gitlab.kitware.com/cmake/cmake/-/commits/v4.0.3/LICENSE.rst?ref_type=tags

 > This release fixes the build with libcurl >= 8.16.0

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Given that libcurl 8.16.0 is a security fix we would like to backport it
to stable/lts. Could we do some simpler fix and only later move to cmake
4?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
