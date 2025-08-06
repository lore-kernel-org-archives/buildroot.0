Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985BCC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51EE141CF9;
	Wed,  6 Aug 2025 14:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ucQfM1ASSOR; Wed,  6 Aug 2025 14:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916F541756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916F541756;
	Wed,  6 Aug 2025 14:54:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0601BD79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFC2D83BD7
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQm42TAvh1ut for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CDA283D60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CDA283D60
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CDA283D60
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:54:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 603674178; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 14:54:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujfXT-00GsZ6-1V;
 Wed, 06 Aug 2025 16:54:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-3-fabien.lehoussel@smile.fr>
Date: Wed, 06 Aug 2025 16:54:47 +0200
In-Reply-To: <20250716093401.1213358-3-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Wed, 16 Jul 2025 11:33:46
 +0200")
Message-ID: <87h5ykijpk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Jb1/OUGp0FJs8swOpglKXk0rJcS6wKYqXz12VlT4fdsMJT+MAGDRlXlDCmqsYCviDuWHvQDTtyjyK0rkrbUCwYnjPfOQD5AGiOlCjnNbQkdxtN6yag5JUBU9NnBnUEjfnnVpEmvHM3qVeNYjbaBBwKuB9YTWrPrUknagST1zSuw2wMEsubhdBF6SlNL2QYhdb26Or/QGjnwD3R3mSal5TrdetH/cfXZwH3D7U+ZoV8ejOiDA9uHHMKhQUgcYgeL9dTEGodil8KNFFjAGLhMiTmunad6i91DEfeQ6v3rTk670KnHPTGZQDRyjXwKhzkTRJ2wuMOvW8MOTIf0WW073Bg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=6FNhpWen7508zd7LN9nXHs41f2qxo88PX37gH5h9oeQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Jb1/OUGp
Subject: Re: [Buildroot] [PATCH v2 3/5] utils/generate-cyclonedx: move
 metadata section to top level
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

>>>>> "Fabien" == Fabien Lehoussel via buildroot <buildroot@buildroot.org> writes:

 > This makes it more readable and easier to quickly identify basic information.
 > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
