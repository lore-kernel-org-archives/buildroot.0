Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298F606A32E
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pyP5+4Kr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A903605FA;
	Sun,  1 Nov 2026 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Wp23EzKD8Wp; Sun,  1 Nov 2026 17:43:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E5B16060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555002;
	b=s00naoJyRtDpW1N5o07zAVCVwqgAp/7tY8PBtY59341WbuGsAELFFnb/fn0Vje+ARocV
	 QuAQkcTSXJB5Th9T4onqEG1x+uZv1NX9J2bgtfM0gOcbQOYQiJMbv3YywrQgJoLhidHhT
	 7845g0dJB4MeYE9giy+nkrbzXlbkmUUSGV9CeRSjZz0lfCEN4lV3z668nidFMRCaohdz5
	 Hd/SNPOr76zINvZStzFS7+hSXjSYIUFxOYMT1dyDR8hXBuGPBOG3KcxY6jzp277nrOdul
	 Tfyq0V7rxXlh9xqXGKPKxLyiTSuvWdAHbgVru3pCGKxSfWFAZY3iD07cD8miEsbUYnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555002;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:References:
	 MIME-Version:User-Agent:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VReD77furZmFJNdrYxmDaOppsxoGnTc1490tS01OZ88=;
	b=skbLLBGJoP1o8XOTVl5/WbImnbAaHjlWxGGVOIXFSmI/UX+4KMSL4CZbRdxsMgbDuQqP
	 8ljlpAKRkWuHKq7kGPZrwPwAsGEtGwyb/pIGVrqa7b7j0N9kcRzgOt8BAvjQvXD5HGwO5
	 yZgpXCEW0QCFOnjhWklC1lfTseW0n3pug2GBNpf0maVmEGfx/vlIOH7KOMD8MARfiES5h
	 nJfyUYOvZ9T4aP54VqCHxLLhV9AmXQ+kBY8oFxF64uEPopHdG4mA1/XAxm69asi6+MUdc
	 Y4q87eWUEK2WHMl9UeXS0H05b39QlrC1FUE0zmJ6JO7yup7wsTrO/bEfuzj11z+zWfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555002;
	bh=VReD77furZmFJNdrYxmDaOppsxoGnTc1490tS01OZ88=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pyP5+4KrqjJWQtq46LjIrdngsL7k09Yd5RS1x/p9IX/Mic93CcNVdQBzS2IXhaicp
	 ajmEPG4iVXGlp9tSUkid8u7+ETy2ISDxFs1i+ImpEkLbPvDtp13o3rEAr0QdBtVLPz
	 LHZ2dwSwfU/IBKHWV3itG5UvLxBTYccr838o/Gp5FaPfiHnA+ppvKYfG21kA6ufrJ4
	 C4orrgcfOznS8hPVHPbQ0AwHRG1zAcDgxwB8tPW/uzba53mMMv1e0CyUrkSqMJuIFY
	 7bEqRhix2SqzrqoFBEfsZPkQyDyxLkw/Vnss9NCB8ZMSFsBKAH2WOWzKLQPeQJJZJs
	 GcoV7rVNekhtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E5B16060D;
	Sun,  1 Nov 2026 17:43:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1371323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6FBF80D80
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHBPMWyFrQqo for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:43:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 840CC80C3B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554999;
 b=Z6WDHsL1Q/VADVi2hFUDw0nO6jfsH17kTZ9oGC6pVldqMNrZLSWVCpMwpsprtHdFc5a/
 On3+SNpFhRzNWn/E3Q0paSp35zCxuvbgzoe+ffbwE/xDV4lujBKooJK+wzJer+UbowQXb
 8PcuM/vjGSbTD3LlBGzbpVph3QRRhhqQcGqBAEEIFw9wMVnmKt7fSl/BSQDxeGm/972rg
 uW6Dh5kbLZZo6HlNWVdVd13VGSyB9gNohw9fj/1CKB8cct+wGUOre0JPbTUJkucH171Zs
 wAbgAqXeAdgWR6tiyLzfg7WoJcdJJvpmNt83mLVofBEkrsGxiP1unsKgHZ1cz2xcRXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554999;
 h=X-Greylist:Received-SPF:Received:X-Injected-Via-Gmane:To:From:
 Subject:Date:Message-ID:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=Su+qq5RLrnpoiZBd3wVfvzZkwbev7PdFxcbMnw0f0mc=;
 b=mwAFyFoSy2jMC/cB8ywKe+4ShmAoPgN9sgmx5j52UrwiteNULT/i7B0jnFxoDOY6BFH3
 kSVBZNEk6Y8KfPWI76ejNmAGGYSzJdniw27Y6lPBCQcTF+kA2hmJ2s2gStB07a6xbMwtB
 nnWYT8VatujvbCfB+66NB8BbyRSCBF2GcRq8ITSl6+NxJg9mXAZz91mZklV+dJf3+uLQz
 ARvzDGov/r5F4zSBz23SQlXXMcSsWBihTfUirnZyVbNcNi8JiA/qR8rUEpHZJ0zN+dei+
 Sw6HwckiAik+O+nsvcs61aYIhe3XU8dLyYjrEfZhszhbjGU1vIPMjBsz2kSC4Ia0DhA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=49.12.148.96
X-Greylist: delayed 309 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 01 Nov 2026 17:43:19 UTC
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao; envelope-from=gclub-buildroot@m.gmane-mx.org; receiver=<UNKNOWN> 
Received: from ciao (ciao.gmane.io [49.12.148.96])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 840CC80C3B
 for <buildroot@uclibc.org>; Sun,  1 Nov 2026 17:43:19 +0000 (UTC)
Received: from list by ciao with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xNZVM-00000000hib-0wEu for buildroot@uclibc.org;
 Sun, 01 Nov 2026 18:38:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 01 Nov 2026 18:38:01 +0100
Message-ID: <pan$2c359$6af10c23$25d76ceb$aba1e4e3@ID-313208.user.individual.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-4-bernd@kuhls.net>
 <audvhswLJYPepCel__13982.3660299712$1793552424$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 4/6] package/libcamera-apps: bump version to
 1.14.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sun, 1 Nov 2026 17:58:12 +0100 schrieb Thomas Petazzoni via buildroot:

>> +Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827 (rejected)
> 
> If it was rejected, what's the plan?

Hi Thomas,

the package should be restricted to rbpi:
https://github.com/raspberrypi/rpicam-apps/pull/827#issuecomment-3018166853
"To be honest, I doubt rpicam-apps would work on any other platform."

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
