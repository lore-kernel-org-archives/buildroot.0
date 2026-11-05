Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19A606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JV05WuwW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA92E607F7;
	Thu,  5 Nov 2026 22:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9TXtqaquO8P; Thu,  5 Nov 2026 22:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BE4F360885
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793919276;
	b=Ye7hJJNVvFYKGV1s1or3FQNAEM8J8wTTAhlQsryaiWemXD9IZmu+YdR1S4hsjVjfA7y8
	 8goNrHPawv0jieEacHhoaxGwStZ4GIR0lXU5HQohtZRMEtiCpQPhEzGq0yrXiNN5j/Sg3
	 hDRqA5ZlIvReF/fHAgkioh9qfdGknsP7cqpB6C7l26CHsKpy6PovGcnXNq9WSU0+wJdyr
	 p042QKkq4G1xpnV4uOH74Pr6sXJXbmmMAL5V9+Xmzlg0shAmKRfhlgfDmdc7TBMpZ/hnO
	 HFmOajqzq8/PgZWqHC/pVJl5QA8VFILBl+fjodBiZ/FLDmIo0pcNWgh2gKcIY/WV2ZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793919276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QinbUh2vdt9zR3gLDkwPTnrUKGF9LMqIe2AY/OQYdhY=;
	b=seH88bVpmy5r0osh4EL/XnhxqVWhV/uoti1CtvJsieMr6HJDFKYEvPbWjdVdx5pFF4JI
	 eCA3iQSLoaSm33cIE8yH8uU0v8kdeMabFpcylVs1pQ231Y1hhfcOcyYDhagY+THQq60Fr
	 eukJQUoMaRywQ4fTiRreOr0xQkAei1kx75NjWjzkEQuEyMc/09AzVtt/f+IMxYhtPvE0G
	 N2Cz26TOTWZQ/a7+sfdwtYMQ8ypK1+j1LhVmQY5qZtFxbNtZwhdjC2y77HzmUgvmuWdYe
	 PnzgOUhIBNiwnwlYKspMdaF9AKVYRvPHXTuzBjmFwjgrG4Q+nkao2UvcuyaNG6jsmAA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793919276;
	bh=QinbUh2vdt9zR3gLDkwPTnrUKGF9LMqIe2AY/OQYdhY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JV05WuwWRzprS2peyA23E2SbW0zLfUSd2XngF0Tad531JjRSO/Qd+/YQA52+QwDjo
	 YqrgJj5gm7nEdPnxMWIjUDMQEYG4Z3G5p1QqihKzrpMqrItj2J+05RBz2afa+VXqvC
	 O9iXUuTANgU7WzUcYa06taJ0UEuy4Tv7skxFD2s/2DCx1INPC1W7zVwlDwLCsmaAWj
	 pHuJnqv5YclsMYG5yHS0A61LNTzLrT+alhW+qSP/7jFJs326xwC/zM50SLzykFayac
	 W29RX6ENRNCES6/5uPALiPLQKp88zO7NDh5S8CU1lKTS2abifmz4+j07Tz7ymwgkSi
	 jC+5Y5kw+6sgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE4F360885;
	Thu,  5 Nov 2026 22:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFF28209E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCC9381160
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NOEKCLzJ8yF for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 22:54:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D85C81137
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D85C81137
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:54:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5E69F5FF88;
 Thu,  5 Nov 2026 23:54:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 23:54:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 23:54:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261105203813.1522364-1-bernd@kuhls.net>
References: <20261105203813.1522364-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <c782c9cf934828ce6c2327c92fa5fe4c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{lib,
 minizip-}zlib: security bump version to 1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 21:38, Bernd Kuhls wrote:
> https://github.com/madler/zlib/releases/tag/v1.4
> https://github.com/madler/zlib/blob/v1.4/ChangeLog
> https://madler.net/pipermail/zlib-announce_madler.net/2026/000017.html
> "This version remedies several security vulnerabilities, fixes other
>  bugs, and has many other enhancements and portability improvements."
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
