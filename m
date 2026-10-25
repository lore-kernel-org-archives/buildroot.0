Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C0606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EDWSD58H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=UzithxGF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B84E940586;
	Sun, 25 Oct 2026 17:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Is-GHOTWwnS0; Sun, 25 Oct 2026 17:01:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B161D40521
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792947662;
	b=Cnp2s1kcdjyVqPgY+VLhuR6Bz8xOHk3VTn87dnmqExkRzrYSOKYHqmGkCS1fAu/Qc7GD
	 pheKvxuBgTAbyEJQpa6Omr4hJkM0rj6h9oVurWX4u064nqzXhpkNGFa/jXAH49PKhtLnY
	 IB8gl46KFNCrmr/rO2Ipt0LOh0QHe7MjbxFvmEOYyumCftbgYpYCkE8wmQSqhQVsMQKFl
	 xnuimRpyaQq8SStd/txkichd/oFu84Z/AZTwgZkY1uJ8UU1/kBYWOf3f+45MrqMTw+sp+
	 29k1FT6KfzM4+jV1qX3Td5XthMM+1gmkGH3rvF23EGkQjgm0pNLQ31yTQc598vRtJfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792947662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=53v79iTLkNo1m7Asdz68lAnv6uhWfw0+lf2ZlPdiK+M=;
	b=aJDgMsWjnQgLNh0iIWfAP3q3V5HIlH6NpYyRIeSxEY/BGcDTfsoggoj26Xp7i4leBxsA
	 W4J1nBH5bvkvhx5t2d+zRD71X4QQ29H0v4Et6yhQoncpyYcwvs+vJMTIQ7juXtf0lHr5e
	 rA0yolhAJgdggGWnoof7hQC6DmWLVVfGuFQxWtibZdA8wr0YrwzvgAGGSxgTBbl1vR6IN
	 5NHuSd5bIl3NXU+NdqvGftHR4OY0xbSBe8jS75xxBl+eYGBcOYr02muQkIPVJISH39vsb
	 t73Q2RMQb3s+sJ5NM20+NuFeEo+6SMHL+AThyyMIeIkv3gbr7NaMTkwo6f31EAi/SZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792947662;
	bh=53v79iTLkNo1m7Asdz68lAnv6uhWfw0+lf2ZlPdiK+M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDWSD58HI5O4cSQ1vQ33z4dORKqAJob5AP7JvaF0wHHKmY8DGHfdcapDcUVXjNjhP
	 dKJm34f0Yk0t3SajxKhxuBacBdYBVmb+ssx98Wdp7iCg2N7y/0+MieBc7HoMtUKXDr
	 d6Vxt4yTar8jvphd7bzfdLdF54tiU8iA1UL2NfdzaD5SlfWn826WDToP18qE39rqnP
	 1bOdn0xdtr8w0FeQ+NAWKC9U088uwChELbLGQaRM5JXqMdiCSRs95ifn5l8QgxFcMe
	 dXXEGV2HdeN1Xgh3JFr8htczRCuYWWsscU0ArOhb7n9wZplLgzj5yH+TLjOJ/vmZwT
	 HvV+S7cc1E+Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B161D40521;
	Sun, 25 Oct 2026 17:01:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5778380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA20A605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXxc4Z_hAXyH for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:00:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D35C7605DA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792947659;
 b=WSJWe9LAd0Vawk4tfJ9ENbYOq70fLqg4MtKcBcXMFDdD/52J218wAYiRwqCvaOLSxa/l
 lYqTDIpWFNr1zwGOOMGWuLmsuSCim9XrE2b8tKumnj+osO92f/lauR7/1ORa3s5g5HVcD
 tPyxLK0F1pQGNedT1ZjLJZsXzNMLpJzPV3jv3d6wdOo20IEGHq3IuBXme2Wb3x/aQqPKg
 C+sujzLn9LDkoxS1opb3/4yEqX1WjKCgjoh+BGkFk1ctGEwxt8SCrn7LTgK3hh4CO5REO
 R4mPCRLKpuICIA/WdvKcaAo9ySqJb8b2XKlE7HPh+gpiiK2FnQ/kSGHvFKG5bZMZdtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792947659;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=xPdJqsuT0GgRm+MJr7wX27Jt67KZ8zljp7o1LaP8JtM=;
 b=asW0GMNZqamGEojKK/V0nSvISLewYHUqU+5Ths6fuf2zmEKrbZT2WXDfMVTc+Fj2/zqX
 dxYmYfSA6wVvXStWpWxW4RdIsCqv10M2pO+BJ94WX58rhAeQ2/bgxizWlL+zpk8o86Puo
 lhFujYuZEFPSJNaAy8HPVSZ2mMej4lBcvN7EB+rcHxbtMvSylK7dPstUBvs9SDbhvb4Em
 z5N3e1pMLsdmOKPn6g6DItaaBMBBL3NwfrbqW4y1zRpb4q4Jksl6NxwMfMJ8K97JkaJI+
 s9WsRW7nI72bxVRwtKTLRAoJUKkwJIoU12QvKHCpE3L/+v+KvksnA/wavXYGYxH+mSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=UzithxGF; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UzithxGF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35C7605DA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:00:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=UzithxGFCEh0hv80EOEMrDvecN4NCO36bLbogWA8ZNSUUvkf+9VxQ+pSZEOjQBEu1UMlGDsGD68VkRMqq8B40oec81Cjd3iTeVVN6GqlzIS0+m9Cw6fZCY2o7KUKDcCay/xejmlsmNQ01+AwAvdWInWPsQ6UqFz+jGfmK30LKvCuaIrUVM3duHx67MADwv7ICBIfkNaoffJpORMvR2PIsvH19gT8o2aYdBoKaXdxBuZzcnOrce+44BiQv9YNX+NCNofksvHFyLrdd1k+X/rNb6PHetOwTbEfqJAAivjIUFnj5eFp/eWR3D9vP2vRR1jp+PgeWSd9Muut/ke7ukb0Lw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VIiBCvsELwc1pzYcNWGkhKEr2oVP6yzKPhxoD4l1buQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1130136409; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 25 Oct 2026 17:00:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xL1aT-00000007YbW-0u9s;
 Sun, 25 Oct 2026 18:00:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fengwei Tan <tfx2001@outlook.com>
Cc: buildroot@buildroot.org
In-Reply-To: <SY8P300MB0041B4107E1E37E8BF9268A6B5622@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
 (Fengwei Tan's message of "Sun, 25 Oct 2026 22:23:31 +0800")
References: <SY8P300MB0041B4107E1E37E8BF9268A6B5622@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Sun, 25 Oct 2026 18:00:49 +0100
Message-ID: <87tsm9u33y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/btop: bump to version 1.4.8
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Fengwei" == Fengwei Tan <tfx2001@outlook.com> writes:

 > Changelog: https://github.com/aristocratos/btop/releases/tag/v1.4.8
 > Update the hash of src/linux/intel_gpu_top/intel_gpu_top.c due to
 > upstream code changes.

Committed after adding a reference to the specific upstream change,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
