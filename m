Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6602CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3CA82105;
	Sun, 31 May 2026 06:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E19e-jKzojS8; Sun, 31 May 2026 06:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80AC820DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210789;
	bh=o7XnO2UJyQvtOgPkPmfRhYth8ixKQCxdxW80BMjlpbE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K4NmLRLeg0r5o6Ln/lI2OjAH5R31cyF0GxNJtuxW9ek1q4CjcFarBV4s9N065HQfK
	 ftLlEoI0mAGd4xAIjQukITa56vdkVcT3oO+/d7QzA9ngsSOo/cn10Dd/4ChldlXHQO
	 AcgM2n/7g/wym5Q1nxBE4BV46scaiQ8x4DPfR+dBLMrD8Mvr2ePJR4d4U4JtJdPGIZ
	 fvGjhCU1inmzV7dPBbIVZYeP3nywdJiwosPMeSYXnHr3A4QZHrQLPanpc2xxzLc8me
	 x19nVp6MDczowtVdJoJUkkoOZRnNolvaa1JfJ9WbCA23vKdsqkMtqZh/OQk20N5umT
	 rOeapRp6qFI9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80AC820DE;
	Sun, 31 May 2026 06:59:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E98D5389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DACD240422
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9BBoj_XXrGb for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4A94403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A94403DA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4A94403DA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:59:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1407965492; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 May 2026 06:59:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTa97-00000006gZW-2UoU;
 Sun, 31 May 2026 08:59:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260118140107.2331715-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 18 Jan 2026 15:01:07 +0100")
References: <20260118140107.2331715-1-bernd@kuhls.net>
Date: Sun, 31 May 2026 08:59:41 +0200
Message-ID: <87ik84dpya.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aQf//OCFZ2QL2phw/nTKRe7cAZMsQvv/npXOTEo9W4NnNeJPlnNlsSGzZBA55/Lr9cxXaHMWrKmmR1oxBoNpkFy7D6rL2qTwfITdJiCuUyYXesMJ4gTEZbxwoD9fTstbWP4OMrAIiDo4wNjtsv01Tgmb7AS3cZEbXd8L7zOFCfAQdjkaDseMCvo0P0NJlqwQ5dTOrY8x4zy2BedyPWOi2yWYAqKb2jHS2UAHxF1u+7Xhc9vJ1z2M19cUQI6D87f3+9aM97am9EA2vnqfoDTkU02IGhHRTOOu2Dfyt8br/14YdzYyIwRtB5Nst6EIsryIBAKNmBXM4so3Dwt+Vw8uEQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+QuGVrGMfjBFKsLuvPTDouKapL+rBq8aaMuP8nGkN0k=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aQf//OCF
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-sdl2: fix cmake 4
 compatibility
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes:
 > https://autobuild.buildroot.net/results/f75/f75d1d0b83c90c0cb5dc7781ea8ce7ff1d67512a/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
