Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C907FCCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 18:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB2C411B1;
	Thu,  9 Oct 2025 18:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGM3N0xdcRvm; Thu,  9 Oct 2025 18:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9112411AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9112411AC;
	Thu,  9 Oct 2025 18:19:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 379CC226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 18:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2907141337
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 18:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6WwMcAgd-D3 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 18:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9B3940595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B3940595
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9B3940595
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 18:19:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -816812865; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Oct 2025 18:19:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v6vEc-007zaN-0B;
 Thu, 09 Oct 2025 20:19:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <20251005113846.3940440-2-peter@korsgaard.com>
 <20251009145452.482902-1-thomas.perale@mind.be>
Date: Thu, 09 Oct 2025 20:19:26 +0200
In-Reply-To: <20251009145452.482902-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Thu, 9 Oct 2025 16:54:52 +0200")
Message-ID: <87ecrcx7ip.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qOo3I2A8E5LJg+OSWYP9V5oh/Wzp7Iy9dyMhQ1Y9SPqgA35z23+IDRYI3nsuXr7C6ANYPSyAFKf2nAb0hCqG6z8wSAjYD15vAzBoEMot4r3LHOFt7mzYzdUQEn1i4D8ottqJCkOK59NW9mnZCm7KYasUYZB6OdW7PkOTaZ9CtDtX+COv0zJtEKWr6ULpJOjCU0OxvYDX4vddi+NmK21J5Xw/jdPEd34uX92cUxfaduGmdeK55xVP5ug0fQhKDvVnw4dNFho/xUgysWKE7MwG4J1vRk/g8bOdmovSN31bl6+AgCdISPaZS3l75C1ptygd83kPUf4R08o5wxfKRT/mwA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=aOwCOIimLDAHjj5QUF8BZX9mkioGYHe/mVBh6N8Iuww=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qOo3I2A8
Subject: Re: [Buildroot] [PATCH 2/2] configs/beagleboneai: move to Linux
 6.12.50
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

 > In reply of:
 >> And adjust the dtb path to the new subdir after commit 724ba6751532 ("ARM:
 >> dts: Move .dts files to vendor sub-directories") in v6.5.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

Again, not really needed for these branches.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
