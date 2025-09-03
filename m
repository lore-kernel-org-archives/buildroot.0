Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE738CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F70961672;
	Wed,  3 Sep 2025 16:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84R0q_-QSn21; Wed,  3 Sep 2025 16:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80B261622
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80B261622;
	Wed,  3 Sep 2025 16:14:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AFD110E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47591842DE
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrbrbipU3AFV for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:14:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECBF8842AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBF8842AB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECBF8842AB
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:13:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1980063380; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:13:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utq7D-000zeP-0n;
 Wed, 03 Sep 2025 18:13:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20250903101253.117289-1-titouan.christophe@mind.be>
Date: Wed, 03 Sep 2025 18:13:43 +0200
In-Reply-To: <20250903101253.117289-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Wed, 3 Sep 2025 12:12:53
 +0200")
Message-ID: <877byfo6o8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Kz6ebovOMKaAFynBqddK7/gthX+4TROHu9w5Hb5uQyWM0/WlxY+pWIxaVrckp4HpHx4ZhlQ6/IZXzLYaO4GKMO42CszPbvY+T5TbrOq72xFSGeRXlBZWVFwtCEeR13mejx0Fdc/JHJRxW0SYf2NFR1/Te0mCiJi3Os1Rs7NefI0avm02YwB1vA/FJeOp0yJpTdn0QBYNv3S6h6oTKTJqMVIqVKa7L9bMyA9D/5GlqZLuUUe++4KXjGXKBaA0nMramdmqxrDQPuebQESIKepTsk7crJSXjjFbJRqCLK5YlvkMJ1zawm2Ku0CD1s8ssUxmG+DGub6NDH97NrKRCmEdKg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=yA598HtSUalij1tjDqC43/Nj2n4JGIwG+57hP6kZfI4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Kz6ebovO
Subject: Re: [Buildroot] [PATCH] package/netavark: security bump to v1.16.1
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > Even though this is not mentioned in the release notes:
 > - https://github.com/containers/netavark/releases/tag/v1.16.0
 > - https://github.com/containers/netavark/releases/tag/v1.16.1

 > According to https://bugzilla.redhat.com/show_bug.cgi?id=2383941,
 > the fix for the CVE has been merged upstream, and is in netavark
 > since v1.16.0.

 > This fixes the following vulnerability:
 > - CVE-2025-8283:
 >     A vulnerability was found in the netavark package, a network stack for
 >     containers used with Podman. Due to dns.podman search domain being
 >     removed, netavark may return external servers if a valid A/AAAA record
 >     is sent as a response. When creating a container with a given name,
 >     this name will be used as the hostname for the container itself, as
 >     the podman's search domain is not added anymore the container is using
 >     the host's resolv.conf, and the DNS resolver will try to look into the
 >     search domains contained on it. If one of the domains contain a name
 >     with the same hostname as the running container, the connection will
 >     forward to unexpected external servers.
 >     https://www.cve.org/CVERecord?id=CVE-2025-8283

 > Also bump package/aardvark-dns in the same lockstep, as advised in
 > the packages .mk version comments.

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
