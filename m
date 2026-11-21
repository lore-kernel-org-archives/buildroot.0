Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B91606A32C
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dApFANUZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=GAXc3xLN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B76FE606B1;
	Sat, 21 Nov 2026 10:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGRl_T9GX7tY; Sat, 21 Nov 2026 10:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C1C36065A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795256337;
	b=l1MkLTETWy1Ps5Hl72lSYkj3bBYLxYxHUNnLqWG7VvsVRwZxiRmyB3JGHh8P7wbr9Glk
	 qlStWkmTSIDsHcIpjp9pmzHKBCSCstfXq3mn2JS9eHOvHxikBI2oTw64trQ5RE24YuU6E
	 d8QgibL4EoU5ZfRCAUYaod4lCHHxYaJmNipVBeqAT4P8TC/3jiWJsaMRqsdU5b+9IyIYZ
	 JrMplbG+kDnKjMr9v4QmMBzeKCs78A5yCpa7rqSswZrsRHicnkuVaRyS+CKINBsLj8nA5
	 KKindaZ2rAEKE+8UT8YSO4a1NkA7+7s45ejCBOf2OBsNPSgz88zEeMDr+FClG9ZiTvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795256337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lCUIpImOf9mm6bZ2rXUyySzlego60lpT/JIE0b0yb6Y=;
	b=A4jVymyn1MNqB8Ewcl2lydJZA3T/2cKMdaF4SncwGvZnHCwoVQObPgFHjQItgIZehlIE
	 BGq9uVh/4yFuWBwTG6OCpx+2WHV5wMPBD1WNuCcrDxRfEjX8Vy9pzcWuvcXNS8LuQbnb9
	 t3Z4aol7zCgg7FHaDykasSCRreyJDpi8nV9u0WcmMNLEEsJu7MLF5oTFeOGHgcsU/I1Iq
	 FcVMCQrngTloRyGGcGdmjQVQ63DuYlSpz/cGiZbB+8Tfx+OfYS7pYThhvphDL9625OfaN
	 4TuFjptnItxeEVgJ1DER/XV1XHu0XO1SYw1Ec/sD0c4MSm9vFCdxlZLoKji7Ug4dpKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795256337;
	bh=lCUIpImOf9mm6bZ2rXUyySzlego60lpT/JIE0b0yb6Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dApFANUZ1EZRejAHvgzAb7Db0+wf3RhrE9HFiowaHOPvF0Kh4S2OyNzdyJQAF/WlZ
	 vVKj/sUQpJPCp6VlI3nrDCJDQM4sdHWpSHKOrJ6RcBmMWllXfcvZusX1PfiTFAYlcY
	 7A43DPIlKoQ9vCzBEQxHXUbBZEk/OjHPq++F34Md0k0twUoppgoW3cjWUzYUsJoWEZ
	 U9mjZQNzA8IQbvFnda4ub8hZfRP7wdifRi/bOWmqzGwqo/VdF9CA4kbHiNJ50TEOVM
	 atrmalA0FG6Wu+54GPdOtkwTJ4xfjMsTswxVeXOtV596RD5mwLjAHXsELcHSiD9fqb
	 9eBFvODZuG2hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1C36065A;
	Sat, 21 Nov 2026 10:18:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C174E1AB
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A793340D5E
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVMLbGUkrCSh for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 10:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7866740D55
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=GAXc3xLN
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7866740D55
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 10:18:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GAXc3xLNHMupgfIHKCMAS9TvkpFz7/Sm7Wadkxsc4OUSkrHSJCq/qORLyDnkuSXgIOa2UdmtjlJbAXufOVvaOT4skf6IBFINnKcY0Bw2RQucBqcvzCr9SgUdOabmppb+9e3FKDng/Bm+G4OEXDznR0xBmTKZt4WHaC19QQR8YQA6Cw+g07jtVrl/8pfFcToc/qelaGLZidF0I3ATOdfllIW7HuzqyXkIdgAjkVIBMlY3NguE/RvG482uj6tAI2cc5yiCunfHroZAq7e7W1VKzP3+0+iPw9LcV7CYx0UeCnM1E7fAMgLOUIC54Kcxy5fAzoGdwY8eqC9xMf7kvgrevw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=fybJq1ZxomwazI8PYWpVXxzairqNOyeVB8fgqEiu6aI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1252270199; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Nov 2026 10:18:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xUiBB-00000004mCz-3uKK;
 Sat, 21 Nov 2026 11:18:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261121072629.459060-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 21 Nov 2026 08:26:29 +0100")
References: <20261121072629.459060-1-bernd@kuhls.net>
Date: Sat, 21 Nov 2026 11:18:45 +0100
Message-ID: <87wlq6trlm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openconnect: fix build without
 NLS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes:
 > https://autobuild.buildroot.org/results/e788cbb9eea5dd9c710f0be71cceb5eca7133975/

 > checking for msgfmt... no
 > configure: error: msgfmt could not be found. Try configuring with
 >  --disable-nls

 > The oldest recorded build error of this kind dates back to 2024 so a
 > backport to LTS branches should be considered:
 > https://autobuild.buildroot.net/results/7e2/7e288f5fc334ed0a23330d43fec52209df36a883/

 > Upstream added AC_ARG_ENABLE([nls] in 2011 to version 3.14:
 > https://gitlab.com/openconnect/openconnect/-/commit/b976ecb02aed356fe45334c018a0e727328a1c9a
 > while the first version added to buildroot was 9.12, see commit
 > c70e0c08c7ad516b4fd20bf92dc1435ecbea94b4.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
