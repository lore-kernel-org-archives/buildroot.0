Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4034BE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01BE6607A7;
	Sat, 14 Dec 2024 11:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXxBbt4XJR_5; Sat, 14 Dec 2024 11:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB4E607C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB4E607C4;
	Sat, 14 Dec 2024 11:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA4ECD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF951405BD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iS9VIkGGeJx for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:02:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A19C3405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A19C3405A1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A19C3405A1
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:02:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A250A60002;
 Sat, 14 Dec 2024 11:01:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tMPuH-00BSV0-05;
 Sat, 14 Dec 2024 12:01:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20241211192912.1671782-1-bernd@kuhls.net>
 <87seqtxhsw.fsf@dell.be.48ers.dk>
Date: Sat, 14 Dec 2024 12:01:56 +0100
In-Reply-To: <87seqtxhsw.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 12 Dec 2024 12:27:27 +0100")
Message-ID: <87h676ttnf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wget: bump version to 1.25.0
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
 >> Release notes:
 >> https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html

 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

 > Committed, thanks.

It turns out that this fixes two security vulnerabilites, so I've
updated the commit message and applied to 2024.02.x and 2024.11.x,
thanks.

- CVE-2024-38428: url.c in GNU Wget through 1.24.5 mishandles semicolons in
  the userinfo subcomponent of a URI, and thus there may be insecure
  behavior in which data that was supposed to be in the userinfo
  subcomponent is misinterpreted to be part of the host subcomponent.

  https://nvd.nist.gov/vuln/detail/CVE-2024-38428

- CVE-2024-10524: Applications that use Wget to access a remote resource
  using shorthand URLs and pass arbitrary user credentials in the URL are
  vulnerable.  In these cases attackers can enter crafted credentials which
  will cause Wget to access an arbitrary host.

  https://www.openwall.com/lists/oss-security/2024/11/18/6

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
