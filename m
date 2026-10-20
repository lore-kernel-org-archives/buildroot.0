Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0CB606D538
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hlmXhmJo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=JJ6dlUlG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3240E8101A;
	Tue, 20 Oct 2026 16:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjBGct0rS43I; Tue, 20 Oct 2026 16:38:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BA18810FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514317;
	b=OgTXV3Tx2oavW06/rI10j+DWjN/aMOAgDK6yrT9UQ7yHEC9sKbQHkDWUu4VNUJ/lZfIs
	 TTKAjacQG2hzaW6Gf+FRZb9gEq+1Fmdh1bwvhvJZ+8YryY4C5hg8mjgY6KRfv6qwtvEvR
	 7IOCgB4/XlX8FKUly6T3RtzLLDfEEozfxeJmsjcFT96/QkeWFd15vYr198OpjQZ2h7IbJ
	 SYzxl3FLqIp+YojDzNx5BK/D/rYXzyipWSV+Av1kmdT+1V46n2mtYsMeJp21AmCVrUaRw
	 DG/s8pcGspvsyp/A09F3nDNw/fqTjVgTcVCkXm5xek3Wn2fXlAKsNmsN+qXSj7Tl5YA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9SRE2XIciZ2+9mt2P0Zn3JR00lrArUTt/rHwEszyP7E=;
	b=fowOPnrf0BQp7ObG0Z+Dn0Y/pbTdAUGnEgUU+VN3cNdJ08LRuQWGQunDfPTXImzOzsOh
	 dWxppAVsTOVQhkeMxYwd2myKm82jKujptNqd5laOJ4udbTvmfN4uSRwjS9K7z9pEeptCo
	 148RxWSMjxJaNJheEYLJJ7jjn6BMl6ehaiiYOkmYqf3nelfaUIFosN+xGRb/XduzJU5AD
	 E0ihADTy56yVga8cBIO+LdR42QYS84b4NvzEWG9ScfOFjyQ5dvZQjEQIb+lK4qe7Z6PC4
	 sv77Qp3q4+X4R9QArmJ5A9Kzk3B1MNMLGcbLRpjLJLt27Pv4Pg7nxBGCVfAwkPHt3sw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514317;
	bh=9SRE2XIciZ2+9mt2P0Zn3JR00lrArUTt/rHwEszyP7E=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hlmXhmJo0EiOEuXXL7AL4hsgAMkB37BOb648/N+Z3uV7RYkiahkW/edt5ytfmjqWT
	 gjGodzKe05VUuU90yQ3VMTWdSsTX6oKsJjU5ELY4kVKDFN2eRP5AQikz2uAAietngv
	 /wlBWGjn7hVFlwd28/tDGEkpwpkJ4aN23TRVTeWuUrQJ7T3fPWyxeSPRw+Vc/ON+YB
	 8B8dnBovge0NaQxhNglmDMhe+ZrrJyuN3sxUztQ/62/4JPxXKMeduEiBM7kKzsIR6S
	 oH/Oj4VkFkzFUYfbFnexzE9Gtd0Tj8C+PARjkG6XPtZXIWV5TTpbd62scRu9796FBq
	 IsdGiCIKT/J4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA18810FB;
	Tue, 20 Oct 2026 16:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A1893A4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ADDA407A3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLvgJpFdtm5H for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:38:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 33DCE4047C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514314;
 b=CbsMQz71pc8DrhEQuO1oLcjOhorhHNFl1U4qbbL5ywHtqJwSL05+oTbwjei0Nq1pvkiN
 9Y8sZ3hU3Qd89TZmb1+VsQo21rqfAy9CQHDDNl55yArJnkHKbTihpny2ZA4FPRkU1Rbkx
 AfT8j28kEUcfXpLfHbvuEn/fHzxvT/3RspaQI+fV67MdFnQuAfBgIrvPFxv6BxWt6ZYPJ
 jtnbOP/B2ZijdVCZ4E57/hDdV5Ivug6L+88HubaLhUU3/gBslSioyj2isp/ig4t5Hzm7h
 fgmU9Op8/hYRt8ZNWfZ3qB5YPUsoOIQ9QXb3C+IYBVkD+ciqhwCEzkBmx4WztPTYY5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514314;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=grf85SoEAV/E4sUq/0GfPF6MA0uDOIKKuIgDFdiWyQU=;
 b=GGYOcq28zWJe2Hnc2wZijlAbxeZ8NGS7ZZUZe63M/SQsDFHEsvVSxcaRpxNoTRUMjcTa
 qYDL0WieLQGUl5JXkrLa1uYXGyY5A25sE1ZQ5KWybnFNAty0PGZK4/99vNFU+0Ufobf5Q
 IbAjcNK59JSXQhwWk3hdsME2/Yrq0RuYYD38VH6cXt6kpj/02Wxmh2X1inPhO4Cbdjavo
 vSphqdywxJL8607yH4upui0ByN+JktjvrBvfsXdk2TQhe3c6bXSf+26Gucp2rX621sYMs
 jr7Ag1rjUlDfS39tVvw6giKu38GPFvsjTEGWGSy4IW9dhlMtxhLf/hG/wKfmoudlYYA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=JJ6dlUlG; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=JJ6dlUlG
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33DCE4047C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:38:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JJ6dlUlG3jUnCcGQaSckg97Ev2iQV7y3bEtfX6ggczCQ4Eo6a0+NnJBA+oCJ6e5H37j87DmZR/NEwhHgtpD56WacFSlWYDQfdlTObGMnZwkNuTcg491bjgj5qOT5Z3ZVhgGLbcrX7lg0AJ+XXD/enY+SOE51D/4mtERHSo1aLNo48BHna1QFAZCzECgNxxMs6AE54CdP0OHniFLFzNvAFqEcyiItceM+4GchjKmozjDuTIeMlvwypjqTx3BEiNsXovnd+z387wTxS+o+rPB1BTJn1K4orpqk5YbrPiNMlebrPme1a8FjVAEkFQzNpZMWeu2L2lt6vWcDvKr25Cr0pw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=h3kKqO8jJn72gr1ela0aTX+aPMcXFesyvNw+qz9IIbI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 471405040; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 16:38:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJCr5-00000008BxL-3xUB;
 Tue, 20 Oct 2026 18:38:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 20 Oct 2026 15:54:53
 +0200")
References: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 18:38:27 +0200
Message-ID: <877bjc9vjw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/network-manager: fix build when
 jansson is enabled
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Since upstream commit
 > e5d2c7cc6dd5f8146954d52855fff36febd03d5b ("meson: fix
 > cross-compilation issues"), which first came in release 1.58.0, the
 > jansson detection logic is broken causing the sysroot path to be
 > prepended twice, causing build failures:

 > ../output-1/build/network-manager-1.58.1/meson.build:307:2: ERROR: Assert failed: Unable to determine Jansson SONAME

 > We fix this by doing a partial revert of the upstream commit. We have
 > submitted this partial revert upstream.

 > Fixes: https://autobuild.buildroot.net/results/104c0e15617d52ae73930fa1c439b7f426837e8d/
 > Fixes: 67cb61bea5876227226603e58d3f74e5032b734d ("package/network-manager: bump version to 1.58.1")
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
