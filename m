Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFB7CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 832FE844AF;
	Fri, 29 Aug 2025 15:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIyLT7z_WU30; Fri, 29 Aug 2025 15:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71518449B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71518449B;
	Fri, 29 Aug 2025 15:26:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D562ED2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAFB08449B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6pHQt4aIXRS for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0A548449A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A548449A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0A548449A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:26:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1805058127; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:26:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us0zT-00CgoZ-2B;
 Fri, 29 Aug 2025 17:26:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>,  Thomas Perale
 <thomas.perale@mind.be>,  Titouan Christophe <titouan.christophe@mind.be>
References: <20250806161555.3805467-1-fiona.klute@gmx.de>
 <20250806161555.3805467-3-fiona.klute@gmx.de>
Date: Fri, 29 Aug 2025 17:26:11 +0200
In-Reply-To: <20250806161555.3805467-3-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Wed, 6 Aug 2025 18:15:54 +0200")
Message-ID: <87plcei1yk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=U7rZXwWYPlLrJEFbXvlztYsMlRkwDYDI8/5W8qh1OZ0uJHpix5fLrUqlDVq9ie0etJJ1TrppKv20SpeklfqK/lPgMUfdr7DxJY+5XOyR6MQRRcsKWszUiA4nCfP1FGQKDmNaWZs9NKug5JG4P97tSQIPNsXXB4bKykFjukNOjB7XbdIB5IzY0nfbTRAI4hJbhqaFr2jRzH7VnoV3yAxC1azMZ/BXBFqVVQa6HpMy2DEneIy2+P9YvuiAepAJ+BIWOZFd4gnn3CyncFD51nM9I7JWVp0a5H+WqZv3dolbrGae+dCmpYNGt4+AaCml2TGnmES4ugY8QXoDRqadM9LfQQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=2zCQqPYh87+fHNmMTt/SymhpiVJp9Cih90+uuHDJOWQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=U7rZXwWY
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-utils.mk: include
 package directory in show-info output
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

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
 > The new package_dir element contains the path of the package
 > directory. For Buildroot packages this is a path relative to the main
 > Buildroot directory, for packages from external trees an absolute
 > path.

 > Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
 > Tested-by: Titouan Christophe <titouan.christophe@mind.be>

There is still some discussion about the rest of the series, but this
one we can already apply.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
