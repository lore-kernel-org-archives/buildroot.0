Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC9606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DXFJlLyt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=Ea/OhupL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E386075D;
	Tue, 20 Oct 2026 18:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQqYN1Y5pRpd; Tue, 20 Oct 2026 18:32:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1E826075F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792521146;
	b=jJ5EcF1kKVwlr9QaU+XYtU2hyQH7mCd3G5ebAsgcofIq8/vNS64AaC6OPwt+vn16FFpb
	 lVDPxt11fQ9mv6iWa46HgJaNyMs8BfMD98hIw0vA2qatWk/zh0abv9trG6/6WKS9lKlZv
	 UoMEasZapM42ZsuTk0uHYA3KFfnnhoZZDpeT7rdlE/dmCO9aRRZAuFrb+ZbNkBTpEinVW
	 MSnJPgUGeT8G9hM8z2PowY5c8HADgbcdwJBj8efMphMzidqtZ1JIhwrjz4n5wt2qlEsJQ
	 ntg5gHREr4OkrlzXaiSbfZkL3OouZNhkLOy+P6QS/l9GJmTPoa9VyGPgoJyk8xqsV0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792521146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lp0HZeqfFrjL6milXSBiw3cCv8Hk4KCfyPcOSy5ScpQ=;
	b=Iij7Y+CfaJIqqJGOomyv56F1DESENmRuXxmUT1KWCEMJJ4O888dYVf9U6RSNiP49FveG
	 TCmYaAA+gSmGnv4auYQ3YCJth6tZKVEs0BN1fBicC/qYK3GFxvRkWgUuKhQrlRzPifqHD
	 1mlYE8eYUBZ2Ho8/XOv6tSIJ7WnsgMAnSQDZRZ0jWG1fzKjuUWT6NzEPnIzPdtSGylrlz
	 t/PKl78pK+VChyEWv/I52k/p1RkeeM8xR8/gktg2HYrFFk5PRHirzu9Q3C3bW5YhINEVC
	 CAKV8NtiuVdIwLUulclnADrPPBQ3B+FpiQ/RqjzNTSkCA1aVmnps9t5YpFZogNMLqOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792521146;
	bh=Lp0HZeqfFrjL6milXSBiw3cCv8Hk4KCfyPcOSy5ScpQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DXFJlLytUl45oRNF/Hvl5+ySPwlSsfKFRTfRAx0FlZktEFZzMSThoTOSjVu7N+Ixk
	 ckfmn96DZz1x0gOoq6+/SCfykGDviL8emsEuyDbHbBiVg4r7o/xla5T4tGpN2enuw0
	 UoxBPbrUCfR8988zJHg6rzldhsxolN7W2vsV5x5BvXjGr/WDKhusOC0dcorL9GnrjL
	 0xU9jFCEH/wNd5mE+/rali14BQsMS83npHP/1/mMKW4UGxDaA4XlZFTXVOiBm9T31f
	 7/q5kEMND/E7C0NK7+bZS8mtA+iBqye/k9Qry4kNDCetatlwo3MI7XWaMI7IW28zml
	 l3VJHNbGN05iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E826075F;
	Tue, 20 Oct 2026 18:32:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05C86255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1AF40763
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5XcBdUTWR94 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:32:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E07354074E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792521143;
 b=iEu6T8rZ1p/pCihPNLaj9/xFk5BqrmeKmzRwzKYvwJW2IRPHGf5E2nxqmvF8E+kDzTM4
 FvP3LrnCKRpUs9q1TF/0IX9KOL+LtI7URelVAkEjLvy4GXD5rILI8biVY2/+i3rQ25EJn
 P5u0o+9uCv26wWTkyPf0FPV/JKgy/rP2Dw4c7UkbBbNKvyibr/OZJknjrohH9uGWJGp2F
 G37dFQGzOO8/lkv8XRMHKc4pNYJIw5w12DlVYnfpe9nPe6h7hScW6fHjp34QoxM9ES/oc
 KTRco3+d3eTu3undNceWLriLGrFlSjHGKaREKPtmiS5+mENjD4/aNC0Kt9IUF31FfwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792521143;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=dJffHJIX6OhSOAxMRVkjnkgxs+cTFHzn+Igy5xs1qNI=;
 b=qAKwEvGNB2Y3ZWj+lHSAbnuh6OJxTzxvTEQt8hxgpt/Eqj3DVVliy/I3T25pT9gmfy5X
 Ts0cW3Xa0O6Nw7la/7NdDcxddYWn5/+dhvczXvtOqyXhy+XOjMhf9uHFYc3Yl6ViTmKLG
 SGdU+4iL3jq4LZ9o0h8judNAUQGgHXid0MVk12gaGh2/4wIdWFfmO9aNkj9RqloJMLmrh
 Uoz5+IjzZQRqRD8zHWJ3lOYFmY+oPj4LS0yLmvnYXQyFBP4MEuHolv6I82IAtpR+ClC+5
 4K8KFhNDSoojE7mGGKZlDrjivF7jcJbBlOVCQH8O1R8SI3my8xVCRvmPWbsvVBWbWHw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b="Ea/OhupL"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Ea/OhupL
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E07354074E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:32:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Ea/OhupLeudqdymCbTvklZYtkYwPeCuqY0R/97cvdtHiPOqWeOO6BRlbKW0qBZlEiRnWw59328te4Jd205CgmhZHwSMyGM52NBNHbCi7OKNTGMmjjeJ59r+Tiar+T96v9nexC8eSeFmwO92ePbE+9WCv/tVGK8Je0jtMfPNxT3FH+YUYGx48I7mB+XisRisg08Z/qLyPxTPKVV6vGf7fBvqtX8ltbcfUZccisbTbGa85FnVO9/dnIqx83BdMQS579gc9yHjB5VDRKLCfJNFLX1fU4If4fyImHdYTEfZBUcyLdu19GXg2mY/47tKv3Z5W2AxTfjPV6VE3u2Kiba2UrQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=G7h8pFxQ4AhPHumXeYUXvm395sSjfgPU+bVxe+Ahock=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2127150103; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 18:32:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJEdD-00000008J0e-3TvE;
 Tue, 20 Oct 2026 20:32:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,  Francois
 Perrad <francois.perrad.86@gmail.com>
In-Reply-To: <atefMriQw5K-VNaX@windsurf> (Thomas Petazzoni's message of "Tue, 
 20 Oct 2026 20:19:38 +0200")
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
 <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
 <87tsmg8gqi.fsf@dell.be.48ers.dk> <atefMriQw5K-VNaX@windsurf>
Date: Tue, 20 Oct 2026 20:32:15 +0200
Message-ID: <87jyncxlxs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, Oct 20, 2026 at 06:43:49PM +0200, Peter Korsgaard wrote:
 >> Do we have reasons to think that this environment variable will only
 >> ever be used by hare packages? If not, then we should perhaps rather do
 >> it globally / in pkg-generic.mk, similar to E.G. how we set GIT_DIR=. ?

 > That is certainly an option. Initially I only saw the problem on
 > host-hare, but then I saw that the hare packages themselves can be
 > affected as well. The question is of course whether there will be an
 > impact on other packages, but if we decide that $HOME should be
 > read-only, then it makes sense to divert XDG_CACHE_HOME to
 > BUILD_DIR/.cache, and see whether it causes issues for some packages.

 > Should I respin a patch in that direction?

I think that would be a good idea, yes.

 > Independently from that I believe
 > https://patchwork.buildroot.org/project/buildroot/patch/20261020120646.1306735-1-thomas.petazzoni@bootlin.com/
 > can still be a good small refactoring to merge.

Sure, I will apply it now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
