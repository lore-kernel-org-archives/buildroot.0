Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5E2E6ADCD
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 23:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2058C820A1;
	Fri, 22 Nov 2024 23:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nx2NA-BLGlvM; Fri, 22 Nov 2024 23:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA29840AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA29840AC;
	Fri, 22 Nov 2024 23:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B081D93
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1BE840666
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hDV8zJ303xi for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 23:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D032B40668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D032B40668
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D032B40668
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:07:53 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:c192:5f44:1fb7:e350])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D57A4B0053E;
 Sat, 23 Nov 2024 00:07:50 +0100 (CET)
Date: Sat, 23 Nov 2024 00:07:50 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <waeviavylejhd4ayk6yrtlci7m7f7qp4y2qetuqsrqc6q5a4ut@aym3zcoqimkp>
References: <3313806598076f4509530136ba913320@free.fr>
 <20241117161927.27620-1-vjardin@free.fr>
 <20241117161927.27620-2-vjardin@free.fr>
 <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dfed5b9a6cf85883a65e432ff53c3b5@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732316871;
 bh=7a2UZmqfJ58p+a2KDB9WopjW6eNBDVikP33F9auRy7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LyevSuO0IBUWDQjTXdgLF4pnknrrVUMVPftCCGq7G0KslT5U+hDodKRyrLkWtipX1
 Ozef0y+zwhqY3prmZyKi6maDue1XkH8tRVOxC11NsxU9pX1VFs1SHvzKpHJUSV6xSu
 u/xwcyzM1rM/98r3PmJcWyvX1fodYrKtZKa1vLTGsPjjE0wDJ02erJIJOELV8E6cQp
 j9C8mEwA87pd1IK7XRP6KHcR6gSppHTybw1cV7hZ6osiTC8Am9OvuN44MbZBFnf0Nf
 xESKVBxPXAeBmmPLGuEFXNAGs2NQTqMbXI4oX8JKMTwdkiYpsmjEQsM2TZegUkh40K
 Uitu0loTeguQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LyevSuO0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mstflint: add new package
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

Hi Julien,

On Fri, Nov 22, 2024 at 07:32:56PM UTC, Julien Olivain wrote:
> You may also have overlooked my other comments which are still
> applying to this patch v2. See:
> https://patchwork.ozlabs.org/project/buildroot/patch/20241115235757.43480-2-vjardin@free.fr/
> or
> https://lore.kernel.org/buildroot/242c09a1b7395a4c8b342813b97fb67b@free.fr/

Sorry, for some unknown reasons, I did miss it.

> Could you have a look, please?

Done, see the v3 update.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
