Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70DDC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6265A61C9F;
	Wed,  6 Aug 2025 19:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxRKU0j1b7WF; Wed,  6 Aug 2025 19:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF1D61C8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF1D61C8B;
	Wed,  6 Aug 2025 19:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16DD8D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8B661C8B
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUUKMXbpc12i for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 19:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 304EB61C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 304EB61C87
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 304EB61C87
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:55:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 179256574; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 19:55:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujkEH-00HNe5-0C;
 Wed, 06 Aug 2025 21:55:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250806193107.528541-1-thomas.perale@mind.be>
Date: Wed, 06 Aug 2025 21:55:17 +0200
In-Reply-To: <20250806193107.528541-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 6 Aug 2025 21:31:06 +0200")
Message-ID: <87zfccgr8a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qZKijvjQ0r/mmVdmSlgpivvv00MPIyYCjhIPxEnEXqJMPIYX/lhR4Hf5UJJJUaBafXw9mW+Z02C6Qp3iYytOfahqo1GXMFjR38eIq6+5L6qPYOLVo6aA/jrMtPuS6S6/Pgcsm5bg4qpCznD3/E1KhSjwMfDAuRu6/nHzkBIwo3O1LgPy8TB4QOpX2nqd93tFice0zgJ7oPwoZ+jIeUyvH7xRNDkTXwJ/PLXU4S0BH7cjTkL6hgSJmLzl8LiqSlx5kYQDs+4/oQhtpZgkWUSDSOkQdl2S9FQxkfFkTjGCELllFvg/o2sD0lOHkG6yMsvYRGcN8JY0YTOnNmtl93tzGA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0qamwd7uvK6L6m1ocW0UlzNLbcmK4rY+NNZnbwIUvV4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qZKijvjQ
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: add patch to fix
 CVE-2025-8176
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

 > Fix the following vulnerability:
 > - CVE-2025-8176

 >     A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
 >     as critical. This vulnerability affects the function get_histogram of
 >     the file tools/tiffmedian.c. The manipulation leads to use after free.
 >     The attack needs to be approached locally. The exploit has been
 >     disclosed to the public and may be used. The patch is identified as
 >     fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a
 >     patch to fix this issue.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2025-8176
 >   - https://gitlab.com/libtiff/libtiff/-/merge_requests/727

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  ...ip-the-first-line-of-the-input-image.patch | 116 ++++++++++++++++++
 >  package/tiff/tiff.mk                          |   3 +
 >  2 files changed, 119 insertions(+)
 >  create mode 100644 package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch

 > diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
 > new file mode 100644
 > index 0000000000..3bc0f26772
 > --- /dev/null
 > +++ b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
 > @@ -0,0 +1,116 @@
 > +From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
..
 > +From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001

While it probably works to concatenate 3 commits into a single patch,
that is not how we normally do it here. I would prefer to see the 3
upstream commits as 3 separate patches.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
