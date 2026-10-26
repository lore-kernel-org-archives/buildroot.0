Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40C606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cMZWogBE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=W8vX4h50
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362A160648;
	Mon, 26 Oct 2026 06:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFsK8d2Kpo-5; Mon, 26 Oct 2026 06:40:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 466BB60623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792996847;
	b=RBqCVhMOlSNbsAvB8OawpU+1mEEuqKKSrNJ8YiMUFXCTKe2cI5+qwEFMnEcsRTpo5K/l
	 lUHDVserRpyxWrZVYMILs7IpvEhUzMGBTCph3pGZZbOSfaY08A/gSIxGqnPM9VEEpv9LM
	 ZfnKp2ow37+GO1qkNTWWM3pi8LCG8Ie0Lcoj3S+bbKx3qtMdpEK1tQTHYZltP2arQ+M7E
	 UF3fzNozzDEVyw5nNX565cVuUDrA17kgzhMpN2bPONXyKXr8UrW3el+lFpfxy6Jl6RSN2
	 +B8MmsV26HJGxFYH+CjMY0aMcS6dBY8HyvKQFrgH47UVqS3DRih59IULDx4FwBL4ijQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792996847;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SCm1gWUnpUoWSCOGJxnP4D1tEKnsvA16dEKgtUE6m6g=;
	b=X4Gjee0wMNtkB9FZp1qFc9jbqRTdQ1YjETdYEvrWvLTSdIznfFrPxrACs92ztJa90F7V
	 688DfcvKElKk5aARPLVw9xYWJq4YEeHV+crB+dBofOGeaRCH15WtkYqbRSwEwyTPMW3ya
	 dRdVPjJyAX/cVNFoPkhZHvEMhgCVNC3P4f/ACNo/xXuG0ZODoYkkYDtmLB0enAgi/d/CY
	 paBguowwcdq5OdLHykVdeQ5ikTLCVZuaE//Nf+uq73Fe7TW03l6ATNOOWHApTUOOm4ybQ
	 WBvSdIAi0sdBOjubTqBWNPoTSMciczJUeuty5NyQc8923isvI/NZZkPbjzwfSTuiBIQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792996847;
	bh=SCm1gWUnpUoWSCOGJxnP4D1tEKnsvA16dEKgtUE6m6g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMZWogBEx0IfrVZY+5GwV4sI+uYo5p6eoNL0diLu1V4AYpba3vSJgqn4zRXLiNS7r
	 sIPaZL+xfHW2+I/ZdeRi5r1c6lPchUCNrxc0EABs2F8ToUvF9jbfiR5mzDaOpi3NtL
	 DakZZlj0kc/g8At90ZVtKpOUMbR0XMiyN2YNxk3zgHtbp3JWzPyK2JJ/cM8nQ/fMx4
	 YPbpyIU3C9VrksxO6TMuif8bTxFprfYXvvfdcr002dezP1FJh06eWzTZ9XW6aFxjMw
	 9fugRIBManL3BJ5pzs6IwcH9QqkwjgMRUGixTUy8LWL5NIh45dfMAMeX1+9sHR15z5
	 CfGujHahzyGPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466BB60623;
	Mon, 26 Oct 2026 06:40:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C865F235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE35B80D89
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_cd3KzpIEjX for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 06:40:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF37280C9F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792996846;
 b=MJ8HL+3m4xVcxO2hTjo7Ykp2cIW4PECAzkrJYCKkF9qlAnnAp8hyc5mPVMEKqhhyTvW+
 AhR5Hb5RZCnTJ9OsEKEimOkIxTqL37xrwGH6m3U6C8yVQ3FXGkmhMjUCxDQZVrtZMBWre
 9lFl5TU42Tt/9EF2JtxeVw7FEPyLfFYY4A3W5LZGk4OmMLI3UHPI3lzFJ4SKTJVpGp05Z
 WBJvfTcmfM0s1fx8x02tXRLv9zDcCAivAPQlD4TTRJQ8+l3tldAr+slil/nzCQ5H3z1vs
 Lc97j0+sEmbok/Ni2ZYJbldUbfBlHYc2JOCmcXIoDjsJ8qMaMlaJL4GMubqLKaNR9Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792996846;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=YD5qtUZKjOHtGTNqtYnm/IYILB1fHGr4Gcf5NMuUzP8=;
 b=CAgM+fZE1NjPojKfv28KrGRxQ2x2Y5Fb92YC28Ry+l4LMPJxATx5Ijfe5VZnJ+lQe4jr
 8HVjUiR/kIENsktjl824tjaJGSHpsFLhQcEoJ0hZmNb11TqDAmqz/1lnvDTo+m7Kp1Amd
 K0f/3kwGZH6CC/3tkpUt4HMhZ6/ux9XrgwU8l1ro5+ZLrU/nTKcAEm2pfzA+KJOsRaTcu
 phmm0BTv0gAo/NHRRAKd7FmNkwRsw/P5WjxxteBuHk/GDt2tN2vGeP3/ZMba5cjt+lnib
 a642uWQAnjWgKmjJ6O1eXvTWtsWhqMgZJvFH+DJB2HnoUoM22ZNKLVeg55opM9czmTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=W8vX4h50; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=W8vX4h50
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF37280C9F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:40:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=W8vX4h50iDw+qlzKNRsmAqoUF0vef6v9zsm3GDKFLSwULjqpgqup/x4ovpfmYMlkR0mQ5+RXLRyTcvM+bSW9NTPNjzwW/va5ywL01vSF84EskIhTaEdPz9YpIB06T9JJLEYfLvs+M9eYyfDjnpmwOH2DLxIV0jHezQI0L+uTqhqGZWDB6mlcpCSVJhC15DLXuP5c58FzkdN8YkTZ5xJ7upqCKVY3In5KGn5o0D9/AhAd9Mpju3lR7Y9Bf9jRSv9vPO0XceDTa+tZfN8GwFR3fzLmJKKzOZWKc2L7YGgz62Tv/7Ks6RRmTLb8UYU3VRKGOfua4ROarzyEQeQxfAo1+w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=6IfCwBLTF9wGNDd1U2/PCxlGcZmaA8Y4kHhUy0NYtI4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1746668234; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 06:40:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLENp-00000007xrf-3oif;
 Mon, 26 Oct 2026 07:40:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261026061120.36587-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 26 Oct 2026 07:11:20 +0100")
References: <20261026061120.36587-1-bernd@kuhls.net>
Date: Mon, 26 Oct 2026 07:40:37 +0100
Message-ID: <8733ttj76i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.10
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://www.python.org/downloads/release/python-31410/
 > Security content in this release:

 > CVE-2026-115557:
 > Distrust compromised eMudhra intermediate CA keys

 > CVE-2026-114583:
 > Reject links replacing the destination in tarfile.tar_filter

 > gh-160300:
 > Reject cookies with a negative version in http.cookiejar

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
