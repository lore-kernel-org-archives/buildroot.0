Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AEDE77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DDE8087C;
	Thu,  9 Jan 2025 09:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBd9qtRE0F8q; Thu,  9 Jan 2025 09:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F2080897
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F2080897;
	Thu,  9 Jan 2025 09:02:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 739DD940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50EC740B17
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFzIvGOfE7Pg for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6048D40B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6048D40B12
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6048D40B12
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:02:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -672915210; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:02:21 +0000 (UTC)
Message-ID: <067fb590-6fde-49f3-9dc2-c75583ae0445@korsgaard.com>
Date: Thu, 9 Jan 2025 10:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20250106202116.3135771-1-yann.morin.1998@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250106202116.3135771-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Im6yqMuhCvWFVgtbuj5rsob5595B8HC6NJBeWKazFb2CJGIrtvhid3Jt4U6E8d8Eoo80CBt7VETrlbJYaJlGdN0SJ5stlkUU2qbRRfYy0x++gtyyoKV2DBmVtJNsTeXCSBeh9bLSVoNYfCQ7ru337+y3QMHl8eIfAEk2uQ6cLU3KhrDXm3d27tuKiTJElDNxmXds75UxfTal72EiChjTr3yCca+8gnMJCUHIN5oUKDB3fgj6MoMEKoa0BhAiCoqDNXitA+cVBD+l449i3M31cTLwVHw0dzN47veRUcZd1JiWq3VZjeHwqnqifsiOFfnt44iUmVYhsS8CgSZn9886sg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=UcHDSmdqrdrQK+EYZMpX5r7ko5oE+qOQWCfp+q85+Qc=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Im6yqMuh
Subject: Re: [Buildroot] [PATCH] support/dependencies: remove confusing
 comment about host system python
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/6/25 21:21, Yann E. MORIN wrote:
> Since commit 9c0c7846cdb6 (support/dependencies: don't check for python
> on the host), we no longer check for a host python interpreter installed
> on the system.
> 
> Drop the comment in support/dependencies/check-host-python3.sh, as it is
> now confusing.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Note:
> the script already contains a few shellcheck issues, and since no actual
> code is changed in this commit, those issues were willingly not addressed.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
