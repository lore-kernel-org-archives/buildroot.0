Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D45606A323
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e0mhJ3Z1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=rAIYUKCj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CE7660726;
	Sun, 15 Nov 2026 19:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3OcaPzNVy57; Sun, 15 Nov 2026 19:22:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B98AC606AE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794770554;
	b=Ed43IFwirZO94MHQmIjDjl9tS4D3ztCf39mranlBFn/+g4KNWJsSeVDgfotDffTY1VEe
	 5sxkfwL2seSpiwyMSxxJeo/CXt/pI0cKxyPvihzvq3Jv8TLdZskLF1VB9WKJ8w9X3bUty
	 3xqREdHZufOS6k8e2FSFblJOlAx8oN/XApf5V91uctmU9zM3Y0HmdY3rDRqhKSInxUjyo
	 EBT6gH7ekjj9M+88iJ9SNm491RSQpNeiqSKk+6fL9cvkaOWbPtULzaaK0mrEL/VCaC97w
	 Ey0AvbwOdJbjHXOOslea8QUA+BCjeYwgI3lpBZejNhdzSxpSxFPjl/OMnOZjj2uiqmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yGzjoqbAlVDBLwcz7sp1DQ3fZWbYbtvtrfzKoNX9Wl8=;
	b=irIbdiY/W3R51ESJ27QlS+VKmvf6Y68QA06oBvBTrICfvjUVpMfOfLuy3otK1BTjP7ta
	 OJtoOJwFrsFUlawLQhzGXz5KnaJFwtZN2OY+MOUJ7rnUNi5MfyJeWnXkwJlJ0BbHKArKh
	 Wn+FP7HM7n7T944QliMD92xP6SYjMw1rO/P25kPB8kHgCX50Vo9JWUXahKTJ4ANx2CAuc
	 MerEqVKdgZ4B45JrelBQdfcl1DcP299uuoZ4D71Ba2tTR7nTwnsFMRffe4SvWtLk29lgV
	 7mtsohk2EiawL4ie42WR2qKk9F8U8K968RCd+3g43cPESxCFX1PkJrwciv/fQIQxflQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794770554;
	bh=yGzjoqbAlVDBLwcz7sp1DQ3fZWbYbtvtrfzKoNX9Wl8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0mhJ3Z19cSRPX2zRzOyaxkmZpdOzmd+S/4UH8Ia6tSd4uNFo30fhJZPZNTDxGZxe
	 pVqpYD6GbeMeztq6RxgzSrHBdWudAFmogUJoqXm7vwgsX4YYeNwaqKCIZiONuN21XS
	 5uAVFMPNLnj/52t3KmVSgC9rdOH3UWR1j9y6Dq86YEhQ//4/x4Ps7A6MFn+IY8XBtY
	 GM9FZggvDLzP8JkPMnz9BDIQYZ2Lzmz3gtKvAvHO7LQ4KLqIFtx/LtWNijAm0iTMx+
	 yG966iKh2teHVAX7yfTosAtVBJV63yWENZQXHg9HDI0hUdvztQRTGx3gtC67/Cn7Eg
	 EuaymhvJJjdVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B98AC606AE;
	Sun, 15 Nov 2026 19:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADC33109
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93833405C3
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QAuR0Mcajc1 for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 19:22:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B7A98405B9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rAIYUKCj
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7A98405B9
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:22:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=rAIYUKCjJDlHs+pskh9IcRpx9NfHKL9ORfe7+AwnIVu+T2KCDa4GSz+4w8Ll97n6WxHjL3SGlZUFz/eMlb6Wgzo9miKQ/CFjuUxpzTHTYuD/8UCB++9+pQ7IPngEX5NAQKkAK4tdAt2wJchB0j2NR3ozzHlVSpchaRoCON4n/1RieGq1+jNxWybgJxCNFJ9h18LHmFm4X7WXpgUYj7mQhrq9xy0GxKbaBEX4ntweLCOrHdcjl/ROIK9SDPvB5W5CO4DUW/ysVWwIvfZK9GuKn6hagc9zNU7W1JWoeYKcobIbuATA9Ecq9hxVJeE9uZFcqZhc3PoQJEOPFahKMHL92Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=QqGBjO+gutwLpPqtmWPu5rz4hCh8kFRGDdj3MC1IU+o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1027187977; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Nov 2026 19:22:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSfo5-000000002U1-2Up6;
 Sun, 15 Nov 2026 20:22:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261114212225.1098201-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 14 Nov 2026 22:22:24 +0100")
References: <20261114212225.1098201-1-ju.o@free.fr>
Date: Sun, 15 Nov 2026 20:22:29 +0100
Message-ID: <877bid6gsq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_iso9660: fix test
 by selecting BR2_i386=y
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
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Buildroot commit [1] changed the default CPU architecture from i386
 > to Arm AArch64. The test configurations which were relying on the
 > default i386 architecture are now failing.

 > This commit fixes the issue by adding BR2_i386=y to the test
 > configuration.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158106
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158107
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158108
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158109
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158110
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158111

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
