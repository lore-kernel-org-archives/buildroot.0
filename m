Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2B9606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dwQnLzdi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=0mlf7XCz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6B440897;
	Thu, 26 Nov 2026 17:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 467BNCQLvFDj; Thu, 26 Nov 2026 17:00:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4BE364090E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795712410;
	b=n9kD4/nkoGCfNMXnzauuR9DNs85A9ySH3X3dXgbwdhivMHkSpPtcDQKz6jE/G+PyXyzg
	 EsVOGNLdglkomz1zO1GIZHjAh/317QuaFpkcSwORSD7cqWhUH8kKcKo5OrvYvRYsN13Mi
	 uig6qpF98oh5FhIcv1bWkpdCPgkDVsnveLaa0E1GaoBeorTCOCpixrwZhhYZJfQGUOImb
	 ZwSnJ54HqnEncsOXa5DuYaTgdI/CEAllWpfFNma8yBQt47s1/HgYBFAgS4+iRtXp1fMoN
	 nZrFY/eFJlmkRXchS/g0C812Txd9+ksx08eEJMFfZ5CUz4ybdRY3Se2Xb7OuJN/hS+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7FfNB7V/EJ0N+VFLSMkCBjVGIxTLrLd9hC2HHcriuzQ=;
	b=BM+ODNAd8oTS+md1aysJWWd8CeaN/xpVk8g7XVAI7uM4Xt4vniwxgideEJKQSn6NlPcS
	 bSjQb0j2287xPQD6fBSLJQos5OYJzZ6zNiZdG66nTWHqnWfB7s1GiZ3Q81itaUnes9qfd
	 IsXEPSjF6SieJCuXDG/2hQp6h1gFgF059wTiOdzKdsy0YzGQ8EQbbhnTFNOMeR3/4DgrP
	 I6LUcSdEmQhXC331+fu9o80vDeDaHoJx/WywkYsTra2zLfA4arNIny8E3kQgFdK0Z37hk
	 tSN9OCFzZk+HFrUFZx3O4TivsqecdQTqeRdYoEqc8/Larh6x9yHxHV0O4uVskOnz/KQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795712410;
	bh=7FfNB7V/EJ0N+VFLSMkCBjVGIxTLrLd9hC2HHcriuzQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dwQnLzdioqjgiwkwC+Z3Faishy7d4id35tT1Q7FHBcR4J7SLWFCIzttB359zlBB5/
	 6LLDcTByljJ5wUWxwFUuIHxKCGBctzoylWrVk2M023z4fKAs5Whoc7IsbS3BqLWlM6
	 w99xnxJ7rhc2EgkUKh80oBoen+ycHWsMBoiIhQjQ578ijVJeMietrFsh7r7EP7ckng
	 8mmfUpxstO62430zFjiJyZmLiXuH9jBakWV6DyrrgnAweMTxPqaY/XqAnKj/DjGNAP
	 jDvvl67lHoWKEzkASRmwq8cn24yjppMUXtDHR9OjEfsqg+/jjTutq05RaP5JmnCvpC
	 LRarZ3WcDCjQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE364090E;
	Thu, 26 Nov 2026 17:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA7D32D
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 559A98112F
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSk8UIvN-NjP for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 17:00:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6BBD881115
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=0mlf7XCz
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BBD881115
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:00:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=0mlf7XCzvbowX3YFtLLxebduhwVuioFXUSsAUm6Tr3z5RZ5snC1QmeUEDl/PkfFEmas2WCX8+0rMPvFXMTvHngYi7ucE6qJnAUBMUVCxWb9XvcpXNA9H30F31WHC4JpB0RMd6/rwl6fAfVH5tnN4ZxCnks3McPckEwL58UISwh8Evvc+vteW0O1NotOZK+sSNKoW2uVHQMj7k5BAGXxe3SPY2pbW2Fm9jwdtTGjwWQw5wEjzxg08jqVNiRCEth+wA+/ujB33nHhhJh+XEk4Unh4ZzEd5PnKLm2E+NuRTVYnh9xMO6pAq2mswGiM44MZfx4L1k8Xl9lAyXlOo64frPg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Nx+TghO11LSqOAQpOtAEdl1nyQpT37JuCkmOrwuvnUc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -537688703; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Nov 2026 16:59:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xWcp9-0000000BuDJ-1GzT;
 Thu, 26 Nov 2026 17:59:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261126115510.733864-1-chakrabortyshubham66@gmail.com> (Shubham
 Chakraborty's message of "Thu, 26 Nov 2026 17:25:09 +0530")
References: <20261126115510.733864-1-chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 17:59:55 +0100
Message-ID: <87ecc7plys.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ccache: bump to version 4.14.3
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

>>>>> "Shubham" == Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

 > For release notes, see:
 > https://ccache.dev/releasenotes.html#_ccache_4_14_3
 > https://github.com/ccache/ccache/blob/v4.14.3/doc/news.adoc

 > The hash of LICENSE.adoc changed due to updating the bundled BLAKE3
 > subset version reference from 1.8.2 to 1.8.7.

 > Tested using:
 >  utils/test-pkg -c /tmp/ccache-test.config -p host-ccache
 >  (Result: 6 builds, 0 skipped, 0 build failed)

 > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Committed to master given the bugfixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
