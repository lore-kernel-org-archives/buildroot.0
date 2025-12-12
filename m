Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A5BD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1077684488;
	Fri, 12 Dec 2025 07:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcXtcN0Pyp8q; Fri, 12 Dec 2025 07:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD075842C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526356;
	bh=eH95ZLLsQap/hv+uexQCEJ/ZelrOIar+yGJM11N36F0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VZS55StHXe5ArtlrGMtNoej1mrXWGLvZuezU4B4I3it24E2Ry00CyCErzSh2m8FQf
	 AfHzu7Lip7uu/rEoCj5k339HeOdAKl5cGwuVRBsDEuizFU4uIcRf8/qPITdhpJnCaM
	 1w4UVcgEJYJBc8shblpD9T0ZNdlVr6d0p+vNzv5c95JbwYrWNqA40u/L6faQwl62wQ
	 p9zGHMhZnZP8j0GS28OoUttBLEsf4t8riu8hHw49Xd/f/lxzvoYJoJ8s5voKp+wTil
	 q7H3aOkrrPUXAXPmbRYbMJ9Y8R8/9c1+suHgJhX+zepqzcUuzQx9h2luWuV4DZ/jM3
	 TwxxSX5huZz8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD075842C8;
	Fri, 12 Dec 2025 07:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CBE52C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD20D41194
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQ5TRpVIBbr6 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FE84119F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65FE84119F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64EDE85C4C; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 08:23:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc69440be9573e3b009a70544bb564746875ced7
X-Git-Newrev: 148cd0c3c1901f4c071cd5b30e40b22162986c97
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.64EDE85C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Merge branch 'next'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=148cd0c3c1901f4c071cd5b30e40b22162986c97
Patch is too large, so refusing to show it
Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
