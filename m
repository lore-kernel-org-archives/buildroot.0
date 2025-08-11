Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4736C87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 10:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9205540EF2;
	Mon, 11 Aug 2025 10:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3V_hbRMQbOqr; Mon, 11 Aug 2025 10:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F46A40F4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F46A40F4E;
	Mon, 11 Aug 2025 10:02:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C33EA138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA7F2612AF
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0qzL11nyCJo for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 10:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBD6761292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD6761292
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBD6761292
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:02:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -435562151; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Aug 2025 10:02:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulPLz-0086Bj-17;
 Mon, 11 Aug 2025 12:02:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250807152907.3225581-1-thomas.perale@mind.be>
 <20250807152907.3225581-2-thomas.perale@mind.be>
Date: Mon, 11 Aug 2025 12:02:07 +0200
In-Reply-To: <20250807152907.3225581-2-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Thu, 7 Aug 2025 17:29:07 +0200")
Message-ID: <87349ynpls.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pJtep84JvV4xnZx6jvWfrH7/gI6UVWo9P+2v7quXj0aEPbMT0Gz/f26jxLj6KE5hbdf8kQFbxFHU7GgY1kQPr06AbrV0pWG4wbXTHWxss24IbcaFHMvD9Y50qZUVcHu0iPEioWUMz3DvvZLb+vwJdpGbPmVoCr4Y3Cz0TpW5yy6dXO35Y+wJsHGEUnB8UNsq87O3V0wVq+aaoCpbs4gcgpVImcU2r9/roIF23pX+6JM1eaM2uKQMvV3wMUV/yqU0sF0luxClrLg3egXUOhZWlgQL+2OHpLF6n6StMe9rWSsieK6W6XEwp/9XouhDzlGNwvKPCRXqWKnwAkDRsov26Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=yKJBeZGxSfHnG0vn3xUvPXL/fAPLy+mHwXEmsOSRdbw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=pJtep84J
Subject: Re: [Buildroot] [PATCH 2/2] package/luajit: ignore multiple CVEs
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > This patch ignores the following CVEs that are already fixed in the
 > current version.

 > - CVE-2020-15890

 > For more informations, see:
 > - https://nvd.nist.gov/vuln/detail/CVE-2020-15890
 > - https://github.com/LuaJIT/LuaJIT/commit/53f82e6e2e858a0a62fd1a2ff47e9866693382e6

 > - CVE-2020-24372

 > For more informations, see:
 > - https://nvd.nist.gov/vuln/detail/CVE-2020-24372
 > - https://github.com/LuaJIT/LuaJIT/commit/e296f56b825c688c3530a981dc6b495d972f3d01

 > - CVE-2024-25176

 > For more informations, see:
 > - https://nvd.nist.gov/vuln/detail/CVE-2024-25176
 > - https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc

 > - CVE-2024-25177

 > For more informations, see:
 > - https://nvd.nist.gov/vuln/detail/CVE-2024-25177
 > - https://github.com/LuaJIT/LuaJIT/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f

 > - CVE-2024-25178

 > For more informations, see:
 > - https://nvd.nist.gov/vuln/detail/CVE-2024-25178
 > - https://github.com/LuaJIT/LuaJIT/commit/defe61a56751a0db5f00ff3ab7b8f45436ba74c8

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
