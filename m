Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90540C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 12:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0A4844E2;
	Wed,  6 Aug 2025 12:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6i2VWoJmtHi; Wed,  6 Aug 2025 12:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E76844CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E76844CA;
	Wed,  6 Aug 2025 12:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9857631
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A50B4101D
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5c811GzuXuQ for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 12:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 636C540AA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636C540AA1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 636C540AA1
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:57:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1076163160; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 12:57:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujdhz-00GdVu-0O;
 Wed, 06 Aug 2025 14:57:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Bernd Kuhls <bernd@kuhls.net>
References: <20250804210132.3249620-1-thomas.perale@mind.be>
Date: Wed, 06 Aug 2025 14:57:31 +0200
In-Reply-To: <20250804210132.3249620-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Mon, 4 Aug 2025 23:01:32 +0200")
Message-ID: <87ectok3pg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=n62WjBLfND2coU7/huhucjf+f7sXP/j4b4k5fP0o4HFH9FJi50lfhHH6znyheZeYx9dJyr6FRaho6FLUXprgBqO4gHMfN7vg0Kteh6g9fWHzNtOFgTCiJE2TsnyCvLuuSweAl3TXi2Y2kWnkUlavaoHDEp7Gev3sg9FkHwnzCQmvrdoeomRyBbcU+I7XfAFIat5s6w3TNwwNv5jrAFM/kN1pu+2PXOUnDRzoJFZwuXKVv+uK5ksw+sx43G4Iolkai+I9nxiMS6v8HeuUUeZnReKzsojj2u06q8VZLjDKgZ77ovF+HAeSyc16T07p+MHE/1UxUJ9ucw7d8EpfDXK6lQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=pAFlm61a7BD6czrUvy9sYCXU0fHXxyqrYGtReT1CSXo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=n62WjBLf
Subject: Re: [Buildroot] [PATCH] package/apache: update mirror url
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

 > While the 2.4.65 release of this package is available on
 > https://dlcdn.apache.org/httpd older version are removed from this
 > location in favour of https://archive.apache.org/dist/httpd.

 > In 2025.02.x branch the apache package hasn't been bumped to the latest
 > version yet so the following error started appearing on the autobuilder:

 > ```
 >>>> apache 2.4.64 Downloading
 > wget -nd -t 3 --no-check-certificate -O
 > '/workdir/instance-0/output-1/build/.httpd-2.4.64.tar.bz2.hfXgDB/output'
 > 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2'
 > WARNING: The certificate is NOT trusted. The certificate issuer is unknown.
 > [0] Downloading 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2' ...
 > HTTP ERROR response 404  [https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2]
 > make: *** [package/pkg-generic.mk:179: /workdir/instance-0/output-1/build/apache-2.4.64/.stamp_downloaded] Error 1
 > make: Leaving directory '/workdir/instance-0/buildroot'
 > ```

 > To avoid running in the same error once the next package version is
 > released this patch update the site to the archive mirror with all the
 > releases.

 > Fixes: https://autobuild.buildroot.org/results/7a0/7a0982bcf9db4dcbcf4f6cf31b9f19571c061ee4/build-end.log
 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
