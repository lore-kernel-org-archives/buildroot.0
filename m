Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67E1C61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 15:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CDDF40AF7;
	Sat,  7 Jun 2025 15:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAr1Xod055D1; Sat,  7 Jun 2025 15:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A7840AE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A7840AE2;
	Sat,  7 Jun 2025 15:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42A7C1A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28B1D80B36
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQs2V8EYTutp for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 15:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26DA0804B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DA0804B8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26DA0804B8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 15:34:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -833378494; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Jun 2025 15:34:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uNvYk-009Z91-0a;
 Sat, 07 Jun 2025 17:34:14 +0200
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250607121948.2175315-1-peter@korsgaard.com>
Date: Sat, 07 Jun 2025 17:34:14 +0200
In-Reply-To: <20250607121948.2175315-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 7 Jun 2025 14:19:47 +0200")
Message-ID: <87plffbm6h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ndz5eZyzgxusARy2B7XfUMmTUN4sIGYbZ09+4ah/mTMGNg4/bjgrF8ATcL9EJEUd4B6iNPK289+F2SLOaydK/wpHvOA+tAWb7i6OqQG3NNXeQjg188aFVWxxlSUiq/QA6CtPJPaDb54m7exiq7XdGr3MsMXt+RjpmjzzHtnUhDWgKTNDuVOdiNiy4Hy/LKXoJcwkaV8yC+uq5NNWqnfGEnIIlcNe2OiMgr2EwZxoX6th5pqucdjRS3nU4tSdA6LTYHtop/zJcPr03Dzlf/cJP4uCPHlbqpjRn+0ytPXQNQLNsvNOeLwYdgqABQXb+bTphNFgpGsN/jUUVsBv8Ai9bw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=IALsjxdRd9KlkHgazlg7p4vG4oM9SogxCzi9YTSaPG8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ndz5eZyz
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.23.10
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > go1.23.9 (released 2025-05-06) includes fixes to the runtime and the linker.
 > go1.23.10 (released 2025-06-05) includes security fixes to the net/http and
 > os packages, as well as bug fixes to the linker.

 > Fixes the following security vulnerabilities:

 > - CVE-2025-4673: net/http: sensitive headers not cleared on cross-origin
 >   redirect

 >   Proxy-Authorization and Proxy-Authenticate headers persisted on
 >   cross-origin redirects potentially leaking sensitive information

 > - CVE-2025-0913: os: inconsistent handling of O_CREATE|O_EXCL on Unix and
 >   Windows

 >   os.OpenFile(path, os.O_CREATE|O_EXCL) behaved differently on Unix and
 >   Windows systems when the target path was a dangling symlink.  On Unix
 >   systems, OpenFile with O_CREATE and O_EXCL flags never follows symlinks.
 >   On Windows, when the target path was a symlink to a nonexistent location,
 >   OpenFile would create a file in that location.

 > - CVE-2025-22874: crypto/x509: usage of ExtKeyUsageAny disables policy validation

 >   Calling Verify with a VerifyOptions.KeyUsages that contains ExtKeyUsageAny
 >   unintentionally disabled policy validation.  This only affected
 >   certificate chains which contain policy graphs, which are rather uncommon.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
