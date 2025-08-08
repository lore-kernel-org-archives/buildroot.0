Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB6C87FDA
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 14:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0233140B5C;
	Fri,  8 Aug 2025 14:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQHXoFQLZ7TY; Fri,  8 Aug 2025 14:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316B040B58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316B040B58;
	Fri,  8 Aug 2025 14:37:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6C7B31
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD55560B8A
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yWUMgrII4Ud for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8E4D60B2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E4D60B2E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8E4D60B2E
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:37:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 801420568; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 08 Aug 2025 14:37:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ukODq-003h9z-01;
 Fri, 08 Aug 2025 16:37:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250806202029.625736-1-thomas.perale@mind.be>
 <20250806202029.625736-2-thomas.perale@mind.be>
Date: Fri, 08 Aug 2025 16:37:29 +0200
In-Reply-To: <20250806202029.625736-2-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 6 Aug 2025 22:20:29 +0200")
Message-ID: <87o6spq3py.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pSsNJ16iUIcKsJj3ZAEMw+X9xiRAMXsHJ1wrQir2pY++d5sM9zoq64V9EFHG8SrvJrR94QVdkB6VNu1chBSVD1e7pSd0UJtfI5gMmOuF3oPjxKUxC7sgwjcMQa2vkp8/rvOt3hs+TgvVrsQ08zAauxpq7Lsi+NATS2HUbWXC0cs79oGtF0Q2tKV6Th4CGRDql7XJzBMJdcgWJPttNX5EqfS4G/9NmfHD0JYSo+yEAfk8628KAB5g3xKGh5MJHVGF8+Uyd7FSNVTIntB4iuBVIN01ITeLiMZfwmWAh7OSjZBxPH5zek1Ab9YKl6EPAO3z4Lq2L8iLLHeQUI3Sq+A2IA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=AS+fPG5kZT8H5dhXqJeTRp48XIjP2ZYq9DQZOALnxqg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pSsNJ16i
Subject: Re: [Buildroot] [PATCH 2/2] package/tiff: add patch to fix
 CVE-2025-8177
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
 > - CVE-2025-8177

 >     A vulnerability was found in LibTIFF up to 4.7.0. It has been rated as
 >     critical. This issue affects the function setrow of the file
 >     tools/thumbnail.c. The manipulation leads to buffer overflow. An
 >     attack has to be approached locally. The patch is named
 >     e8c9d6c616b19438695fd829e58ae4fde5bfbc22. It is recommended to apply a
 >     patch to fix this issue. This vulnerability only affects products that
 >     are no longer supported by the maintainer.

 > For more information, see:
 >   - https://www.cve.org/CVERecord?id=CVE-2025-8177
 >   - https://gitlab.com/libtiff/libtiff/-/merge_requests/737

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 > v1 -> v2: renamed the patch from 0002 to 0004

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
