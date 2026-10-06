Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3ECA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 20:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6773780EBA;
	Tue,  6 Oct 2026 20:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzF7JlYuiK1P; Tue,  6 Oct 2026 20:14:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5938B80E3A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791317640;
	b=ZvRdi3RhHDqeARhwhReSfhVamdvHcqOapNiaqwvbE/OHLxwMM/a5815fkcJQl5OmGRwi
	 ExUJln8RrTKH9FB18Ot17bR/ogh9CxobO9i73UAJmYShb+uFJWXNScBwgdV9hHRKEwjvS
	 XVWk4tvAbRFXPrsLMag++7v36iWBexcABlxU6JEXM06DMmQBK4NoZrVa7+lctgMypDpR7
	 x4yZ6sOXdek4wueHd+gF0gFFFmkZEuxo/471eIrwqzZrA+DVqHc38Kzloxz3Q9OFX+XjH
	 4/EbdrWcU8Jgy83l2osyGLrzoRAfikPy3JpA8Y2S/FbRzPwQjZVHy8iY8L4BNjGy4gA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791317640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sr2NtDJX4G8c9bVqL2XEPnF7bAtEseMjJbxP1mseVR8=;
	b=pMl8EtbfT+V5mb9rPSMRj+l6uRJ031QCsI/VDexEeFPaW21AbOZgLFwvbyS7Jix0qple
	 lUOx9eV1HRk2AH9Ir7Gc3cDVSJ7smGZeUjQRCCSwrYqgZAKDm1i8Ip4phAkK27f+RL4xO
	 fBfOpel5F5UBLrKtWsmVTPUZLDQcVJfTot/UY0DqocJsBuVTpyFwbIXV4arc/e/QblC47
	 vawXkVqO1lZ57HTIp/gWeMDcpk9JFx4x5K9u0LlLLhLCxsk//82yRn0P2G0i7eb4k7jLM
	 uhIJrZQljoRNY0IZ8WS6IWh3E825YncJ6XLTZ4ulaeFzDZQomfDiQJS9KTiwmuDZ2sQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791317640;
	bh=sr2NtDJX4G8c9bVqL2XEPnF7bAtEseMjJbxP1mseVR8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/5Yqk+XRkXy5Xjjvuzfi3RRPB+guANlTm6/Sn7oAdZ43gOiMHj+jAcMRp0PRf+te
	 s7hEJiOXjlNWve++g1YBKQdkmLQdcudX6ZPC0rgZKE7pgIftTV8p5t8GOsMVa/ywRY
	 Tn+c3v2etxT7ALZEDMfIJYD0Ce3THtp42wmnVtSHG7v3X2UcXke2n6azHpbYhhRnWb
	 /h/ROEDvmuxiNtGzn6hfps/+UU7snDR0rvnYyR3N+vLzwGnaea4ISlzH4XftRBTiJr
	 5/OHunBtBylzC/AL4qMNBsr+lh/R64jRhAanN1t8+DpQa5MeDXiXupIbNI1JltAnCm
	 3my6ImP8d0AWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5938B80E3A;
	Tue,  6 Oct 2026 20:14:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A793732F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8771060BCB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJmOVYGQQIw8 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 20:09:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8231D60B83
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791317352;
 b=FpJY2ZOKWxrEXjIjxbFMMqAdf1zRwSywBlk4SCmbGzSZdlhAzixaPMki4Ja2FYqUWRii
 xbhYKzUt4G/vZE5xz0F/m64rlWz9+WzSsyDELsfvjDpHmqo2dPqDSfcVFPiO6UsmEVAPR
 O9pq9UcQzoTZYOez3cVExvtf0alGoT3pHTL+kRsxRVVsNhhaB5xKsjX4CSpaIZgMlUbJU
 CeX95A8goL9d0LeMZUsEm1yqiwaZHrce3OGF5cmxL/S7RFVtpaNOF34EDIvQXGAzqqQzL
 3SvP6tsWn+zTBmp9nZZF1Z2ZGiCnh8Ljll3sTj6buueyV4rC2ICOFx/DmGdWi+T65eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791317352;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=36eGZZl6BAQ4RYSGxzl/aRvO4ZQxcf2o1gjqUq9XtNA=;
 b=G4bbszzGGfTU2eGMWq99xfgcpZRZPoTgojbkk7VQt7lJIObEWpPZOA5HMlxRUX84xnoV
 YnpIyWbaitoK72LuephA36qWCMjNy+uTXgUBC9LqlxzVan9OSMaN5D/ih/6YE0jcopgMN
 SxqNIXzxVPEMQpsrLl6uZetsDbUYezeCF6Mk1izdDnDbG+mWOdiiabEebPF1L62iWA25J
 LlBdYVjETvUYKCFSuoeeAU4CAddokKqP82bqYXZy+OeY7vqmk/fYZKWNeZQRPHkfoCzQ9
 dszZrLeE+nvxNm7obwLpVnKcg8dwQz6Zlrgb0usXp/yBXsHj/si9vfrQfrQ4s5zBisA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=VENXvdSU; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=VENXvdSU
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8231D60B83
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:09:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=VENXvdSUfn5sVvwqnXMbB9f8uepoHWl/mOFfq+DF+nUu1qFoCX0gU66eL6dOYhNCDt216HEovXNF4o+cvw7xc8ULB+cH13d/OhMeRaL78s6ia00ckExVPkOXebMbWA64WsvZFuUkqmuvlHcPlWoi7qklao1rHgGLsKjDht+KbHLpIDXNT+3GHf5NpYEipMMJSXxibRKMSZ6th0Ts5osCQaC0M/pdpd0L19+uIKCv4zVb5YoWBZwlSFZX+JI4NSF5HZQXvzNUZR2zBgQi/eqLMdgw0ut3MSJ5gJKQrQgxd3yWmjHagpnePWhQotqzoKCxUUfk0OhXiQEPBZz9hy2/WA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=lOOLpsy6G1tvnNr/yueEUsLk+giORyj+9PkloR6nnDI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -308400590; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 06 Oct 2026 20:08:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEBT2-0000000EsRz-22kV;
 Tue, 06 Oct 2026 22:08:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org,  Vinicius Tinti <viniciustinti@gmail.com>
In-Reply-To: <20261003224447.744966-10-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 3 Oct 2026 16:44:34 -0600")
References: <20261003224447.744966-10-james.hilliard1@gmail.com>
Date: Tue, 06 Oct 2026 22:08:52 +0200
Message-ID: <87h5iywq0b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-thrift: bump to version
 0.25.0
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Update license hash due to README changes:
 > https://github.com/apache/thrift/commit/09b177a3f67acbdce2d8e5ff7bd94d3bcd99d9df

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
