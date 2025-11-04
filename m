Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC88CCFA04
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7B66114D;
	Tue,  4 Nov 2025 21:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hvi15kKXZrE; Tue,  4 Nov 2025 21:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F18761129
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F18761129;
	Tue,  4 Nov 2025 21:33:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E013222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F75761129
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAFptOEKbkLc for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 21:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4998261119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4998261119
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4998261119
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:33:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1778330967; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 21:33:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGOeS-0043RZ-1N;
 Tue, 04 Nov 2025 22:33:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251103211146.57344-1-thomas.perale@mind.be>
 <20251103211146.57344-4-thomas.perale@mind.be>
Date: Tue, 04 Nov 2025 22:33:16 +0100
In-Reply-To: <20251103211146.57344-4-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 3 Nov 2025 22:11:43 +0100")
Message-ID: <871pmd8ov7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=crZQrWQXixLJeiYeuuugjFAKjdMsjRR1Di5y2yrdEt+Rx6YLW5veaCC0sXMU/hJfb0Ih99dBqD5+LzGUgB5OvohxEFMGz1lePpRbKRyIXna1HOLImR2z/fKl/6ts/0fqLLDFRMt974RS920p+S3642m06mpOtBI6Qnw2Tm2dvEQVsEYiPpVd7cTXLsi1faR5xB+oXrjhbyUf7z6ubG2Y9zr2BwoqBEgLZAjvvHUth/yCjSr1kQHbv0RaBo00oIecaqDQja/oNroBBF2a79IyWfKUETnE/zi/EF7p/8cVdAdXyCcDiTwxY++zplSKHgPxlnYxI72UVdrmxTxlh3cmFA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=NexbTgyn2BIXK06MV0LolFxPNYxhCqKnsS9VWkCyQqY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=crZQrWQX
Subject: Re: [Buildroot] [PATCH 3/6] package/pkg-generic.mk: Set
 <pkg>_CPE_ID_UPDATE to NA by default
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The commit [1] set the default value of '<pkg>_CPE_ID_UPDATE' to not use
 > a wildcard by default. But instead of setting the value to '-' it set it
 > to an empty value instead.

 > According to document [2] section 6.1.2.1.1 the 'Not Attributed' value
 > bind to an hyphen ('-') and the blank statement bind to the 'Any' ('*').

 > Because the CPE matching function was incorrect using a blank statement
 > worked to remove the false positives but this is not correct according
 > to the CPE documentation.

 > [1] 53a8616460 package/pkg-generic.mk: use more sensible default value for <pkg>_CPE_ID_UPDATE
 > [2] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf

 > Fixes: 53a8616460e5730abe703ca5a46bae0039d548aa.
 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
