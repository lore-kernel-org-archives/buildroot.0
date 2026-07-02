Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB4FC43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 16:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83EAD60835;
	Thu,  2 Jul 2026 16:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNbtkzYBTZGh; Thu,  2 Jul 2026 16:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E99B61156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783011227;
	bh=L9rU0a+YPyu+InOvXmR4+EqoEPOHudSK8ajw7Czt0o8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nidSiWaD3prYW7FDqO2UVcIoU9KrbYXS3MhYFZFiFPAcDUVm8rIdQ5iR/xhSXWMCa
	 kEh4Jn3npq+PCbkMLT+d2tXfrXDnDC97bYzSX7Wh1H4KUWw/Agl6nKsq+7SxcgouJ/
	 33DodoAuy+brDCZ1ZfN2BMIH/NAavVtW+lJP8dbjPJGrDBgZ4OvEQa8uj6NfirYiIC
	 WESjeWyFe0UZ8PKGSz5fryHMSwiftzsxGE3aRz9aSplaJeBlgEw8x7HzO0/+0d81n6
	 WrFT6hfyYtZFVzMiqfEalG9SDwR0/umIVAXoq0q0KX0DhP0cwNL4x7Q99snOG1jd+x
	 vkjgn+JTIUUdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E99B61156;
	Thu,  2 Jul 2026 16:53:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAF3647E
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCE594066D
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ke3PK3X3Qqll for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 16:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07730404B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07730404B4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07730404B4
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 16:53:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 646228731; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 16:53:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wfKfR-00000003RMg-0Fc1;
 Thu, 02 Jul 2026 18:53:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <akYJYnK3kBeCeV4B@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 2 Jul 2026 08:46:58 +0200")
References: <akYJYnK3kBeCeV4B@waldemar-brodkorb.de>
Date: Thu, 02 Jul 2026 18:53:36 +0200
Message-ID: <87o6gpnxin.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=APP6MpywyJjk8fDPO/pAWZEo+Myylyg5eVUxukTPY6NESgC9xNiRpjgTV4fMxD4pCRzdCaG7kzLFp0Yv+aldi9kpS4px4yF611uspRHnLgUtC60o4FCXaT+A6DJHtH5BNKwZYLdJl8SQXbPG2kauoIMZkXDNEZ8jIvRvdD9KVeqHfGnKOEat6xbH77q7M2DRZxNJ9HEnosOuuSc1g/GTGQSeFQyqlsaEtsJKRUCA47veu/Y0jSPIVwG9iGBRXWV21yfft9AznbvjhjUybI0VuJAqks79O3PcjuXcOZ7mUa6Y2TtimGh6KquV8jV3/nF5ESztlPRqVNcziFVtuERu8g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=n5RK4qBQRB2kEATjkEbQ9qknOYuh7IpyGhsVXPh7Le0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=APP6Mpyw
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to 22.10.1
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > See here for a complete Changelog:
 > https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22-current.html

 > Security Fixes:
 >     GHSA-3g56-cgrh-95p5: chan_unistim DIALPAGE digit handling can overflow phone_number and crash Asterisk
 >     GHSA-3rhj-hhw7-m6fw: NULL Pointer Dereference in HTTP AMI Digest Authentication
 >     GHSA-4pgv-j3mr-3rcp: Reflected XSS in Phone Provisioning HTTP Error Pages
 >     GHSA-589g-qgf8-m6mx: Stack buffer overflow in MWI NOTIFY Message-Account parsing
 >     GHSA-746q-794h-cc7f: Out-of-Bounds Read in Q.931 Information Element Parser (H.323 Addon)
 >     GHSA-8jhw-m2hg-vp3h: Heap Buffer Overflow in OGG/Speex File Playback (format_ogg_speex)
 >     GHSA-8jw3-ccr9-xrmf: Buffer over-read in Asterisk PJSIP MWI body parser
 >     GHSA-g8q2-p36q-94f6: Heap-use-after-free in Asterisk PJSIP TCP/SDP handling when TCP connection closes during SDP processing
 >     GHSA-h5hv-jmgj-92q2: CVE-2022-37325 fix is absent from current chan_ooh323 Q.931 party-number parser
 >     GHSA-j2mm-57pq-jh94: Possible RED T.140 Generation Accumulation OOB Write
 >     GHSA-mxgm-8c6f-5p8f: Stack buffer overflow in res_xmpp XMPP namespace prefix handling
 >     GHSA-ph27-3m5q-mj5m: SQL Injection in cel_pgsql and cel_tds via CELGenUserEvent eventtype Field
 >     GHSA-q9fr-m7g8-6ph5: Asterisk app_sms.c copies externally controlled SMS lengths into fixed in-struct buffers
 >     GHSA-qf8j-jp7h-c5hx: Out-of-Bounds Write in Codec2 Decoder Due to Floor/Ceil Sample Count Mismatch
 >     GHSA-r6c2-hwc2-j4mp: LDAP Filter Injection in res_config_ldap via SIP Username (Unauthenticated Information Disclosure)
 >     GHSA-vfhr-r9x9-c687: Possible RED T.140 Heap Buffer Overflow
 >     GHSA-vrfp-mg3q-3959: ARI setChannelVar bypasses live_dangerously and permits FILE() writes
 >     GHSA-wcvv-g26m-wx5c: ARI REST-over-WebSocket read-only bypass allows arbitrary module path load and conditional RCE
 >     GHSA-x348-j6c9-77f3: Stack Buffer Overflow in H.323 ooTrace() via Unbounded vsprintf into Fixed 2048-byte Buffer
 >     GHSA-xgj6-2gc5-5x9c: ast_loggrabber executes python script in world writable directory(/tmp) leading to potential privilege escalation And RCE

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
