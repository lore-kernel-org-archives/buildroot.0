Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C37CA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46AE3400A7;
	Wed,  3 Sep 2025 16:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz3pB7f2NmMa; Wed,  3 Sep 2025 16:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B00D40D51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B00D40D51;
	Wed,  3 Sep 2025 16:16:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 811142BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F8B6415E3
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iZaa6ANuDm0 for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52A8C40D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A8C40D6E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52A8C40D6E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:15:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 283943915; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:15:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utq9G-000zy7-29;
 Wed, 03 Sep 2025 18:15:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20250903124306.6936-1-titouan.christophe@mind.be>
Date: Wed, 03 Sep 2025 18:15:50 +0200
In-Reply-To: <20250903124306.6936-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Wed, 3 Sep 2025 14:43:06
 +0200")
Message-ID: <87tt1jms09.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Kyv4tqtZOeR+E2ILr+B8Feyi1cd3UoCAQSF0OuFJVE5jMYRk7OJ+Wf/VucToBTdYJEl4rhGeBnp1zhpofHwBIgY088KC/NjcnhKiPMhnF/iuiuGeIvqOeALzIP3ndR6wv7qlJlnu6kJRuynBpmdgOC2QmYsiZY96g/DQ9JBX42lMmv7zWXyORmqUT4aZQpV7dNoovqrIZOMZ+O2jaq3hAOvT56+2mNtX1J5JJsh/EvnzKgNxTyzh0eTMB4rNgu4ZU+qTyfcViDzSz/aZFZMJ+/9EgZDWeKlnWD+Wfxj9v7DuV72C66+rcnOn7tuQugvqiKT2JWa1HQL7Ht8gCieZKw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=k1T3BqVUvs9p++FIrJSSMuJ4vjcW9JVJ3zDK1MOUCDY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Kyv4tqtZ
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-3
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > This fixes the following vulnerabilities:
 > - CVE-2023-5341:
 >     A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.
 >     https://www.cve.org/CVERecord?id=CVE-2023-5341

 > - CVE-2025-55004:
 >     ImageMagick is free and open-source software used for editing and
 >     manipulating digital images. Prior to version 7.1.2-1, ImageMagick is
 >     vulnerable to heap-buffer overflow read around the handling of images
 >     with separate alpha channels when performing image magnification in
 >     ReadOneMNGIMage. This can likely be used to leak subsequent memory
 >     contents into the output image. This issue has been patched in version
 >     7.1.2-1.
 >     https://www.cve.org/CVERecord?id=CVE-2025-55004

 > - CVE-2025-55005:
 >     ImageMagick is free and open-source software used for editing and
 >     manipulating digital images. Prior to version 7.1.2-1, when preparing
 >     to transform from Log to sRGB colorspaces, the logmap construction
 >     fails to handle cases where the reference-black or reference-white
 >     value is larger than 1024. This leads to corrupting memory beyond the
 >     end of the allocated logmap buffer. This issue has been patched in
 >     version 7.1.2-1.
 >     https://www.cve.org/CVERecord?id=CVE-2025-55005

 > - CVE-2025-55160:
 >     ImageMagick is free and open-source software used for editing and
 >     manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1,
 >     there is undefined behavior (function-type-mismatch) in splay tree
 >     cloning callback. This results in a deterministic abort under UBSan
 >     (DoS in sanitizer builds), with no crash in a non-sanitized build.
 >     This issue has been patched in versions 6.9.13-27 and 7.1.2-1.
 >     https://www.cve.org/CVERecord?id=CVE-2025-55160

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
