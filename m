Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD79E9D3F9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3D683CFB;
	Wed,  4 Feb 2026 15:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id er7dbxqJz14B; Wed,  4 Feb 2026 15:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BBC783E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217320;
	bh=A7TKLIeCaQ/B0ePYgpu4zgIlwaGfxjN6/6exuPXtsak=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l0Ql0gxlmxGYe29cyGMprSurQ5kMMiEDGhUG2usHuOiG54fGMnWQ85aaZs21nO+Wi
	 5XOf/KxvA3BoHcm+QvpOFWyJm6T1aPsSeQ7WJ0y8GG34AucsIoiMRiS7UbqUPyD3aW
	 HHhhhxzMQq8YyNbnfOfeOXoUCckSIqfndJT1/5CblvLhGb2ENVbolvBw07cX61RGNX
	 wNK8EwSmH8Iz6ewOfo55O8TZzSEBpjmwSlLZ8z5RQ2U5SkMN9f10aQ9U5dfqdzseRP
	 hHcERWKle/C5XCPvB7+DJ8uo5FAdlYJymsLdRG3zHJqkDhX545iKgg4BWSIXzOt+pl
	 wHXitEPQA3d5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BBC783E3B;
	Wed,  4 Feb 2026 15:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED7D173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68BC740665
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDQYDcEMrNTs for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4673F40315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4673F40315
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4673F40315
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:01:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 16DD5C24398
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:02:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67A9A60705;
 Wed,  4 Feb 2026 15:01:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0D60119A88FB; Wed,  4 Feb 2026 16:01:52 +0100 (CET)
Date: Wed, 4 Feb 2026 16:01:52 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aYNfN_MsXgZx-Dyv@windsurf>
References: <aYDg9IRuE64VYwWa@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYDg9IRuE64VYwWa@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770217313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=D4urFyd8q3+VjODrY4bNCreCXGkdLjEuAbzTXfeDoAg=;
 b=IRf9neDoNQJqqk6XgFtFGdVv34KL2kyLJ+4fJTbi12LdbiY5mT7NpCTk3Fc1UPQM0nBoTM
 VfO1Jym//sdQx0sj6F9V0TF2wKTK8z/Fis4/Ewckzuc5Yyx0zXk5EUPEpZRBY6ovmuK/SJ
 1vn6G51ei8cE+bkkvKXuHtY6L1YzTUIi3tumJiNj+y88iUuLJazdifd0B5YrxxEcg640M+
 D0Y8bAwAMJJEY0I16FOUphnb5e7LHJ3O/LFhO35gOKMNos9bGMxHXWY6rllR5bnjrwnVEQ
 K3/Pt3I1RQllaGzeJBto8pSaWPL4iUu5R3AFJtj+njzkmRIAVhxUQa/0pP7O0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IRf9neDo
Subject: Re: [Buildroot] [PATCH] package/asterisk: add workaround to fix
 build issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 02, 2026 at 06:37:56PM +0100, Waldemar Brodkorb wrote:
> Sometimes asterisk buildsystem decides to remove our own
> build menuselect stuff for the host. And then fails to
> run the cross-compiled binary.
> 
> Add a patch to avoid removal of the menuselect stuff.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/5f7/5f76f032ee596e928089b064b01f08adacade47a/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Not ideal to have a non-upstreamable fix, but it's simple
enough. Would be great if upstream could support cross-compilation for
real.

In the mean time: applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
