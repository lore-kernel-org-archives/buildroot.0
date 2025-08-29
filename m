Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE8CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 18:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206F76171C;
	Fri, 29 Aug 2025 18:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5axYiw8GEvy; Fri, 29 Aug 2025 18:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E4D561716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E4D561716;
	Fri, 29 Aug 2025 18:46:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA386D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAC3F846A2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MLqS8ic8eJx for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 18:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F47283D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F47283D5F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F47283D5F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:46:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1213114271; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 18:46:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us47B-00D05H-1S;
 Fri, 29 Aug 2025 20:46:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Christian Stewart
 <christian@aperture.us>
References: <20250829144900.234015-1-thomas.perale@mind.be>
Date: Fri, 29 Aug 2025 20:46:21 +0200
In-Reply-To: <20250829144900.234015-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 Aug 2025 16:49:00 +0200")
Message-ID: <875xe6ge4i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PEnk9tSbjVbqaY8ti/npfYWjGz5D7mGz/Ab7sTfW3AHZmytWHlGA5evRb5PQX+7503Pat3ENTAoJS+pIM5gMyxBXppva5c1yAAuOwTnE2FfY1DKv4arB4MqVraphzWWujOmKkYlEyVWYeL9dIW9wt0QfLAGwx2x1fZNa7w+nsG8It4D3jWOrXXQOVAHeFOcu+08oVjRsac3ZLcZhP+HC9rETGABEHIa9hEuRJdf5rUfK+C3l2Axdvf9fq45AD9ir2MKIr+IKPvIz1rwQ9czrxsWN89XSs+i7K5FaPDeHaTizfoM9JmPDt8gjvRhd7kikcPw8GcGrvW35o7vEirVVWA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=B1NR0gxz/CR7VxDCGzs/89KXPw3EsGw85Ofl9+gsv2I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PEnk9tSb
Subject: Re: [Buildroot] [PATCH 1/1] package/go: fix CPE id
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

 > This patch fixes the CPE ID for both go-bin and go-src packages.
 > The go-src package did had a CPE ID because GO_SRC_CPE_ID_VENDOR is
 > defined but the generated CPE ID would be the following:

 > cpe:2.3:a:golang:go-src:*:*:*:*:*:*:*:*

 > The CPE product go-src doesn't match to anything and should be 'go'
 > instead.

 > For go-bin no CPE_ID variable were defined so no CPE ID would be
 > generated if using a pre-build toolchain.

 > This patch duplicate the definition of the CPE_ID variables, I didn't
 > put the definition in the 'package/go/go.mk' file to avoid generate a
 > CPE for the go virtual package.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
