Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C84C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61B083AD9;
	Wed, 22 Jan 2025 15:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dzx6qUU6FkbK; Wed, 22 Jan 2025 15:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAEA283AFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAEA283AFE;
	Wed, 22 Jan 2025 15:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 356E6D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23E30606A7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqYD-iHhf0QR for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48ABB600B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48ABB600B3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48ABB600B3
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:05:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6FA924000A;
 Wed, 22 Jan 2025 15:05:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tacIT-008qnU-16;
 Wed, 22 Jan 2025 16:05:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250115163310.164964-1-peter@korsgaard.com>
Date: Wed, 22 Jan 2025 16:05:37 +0100
In-Reply-To: <20250115163310.164964-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 15 Jan 2025 17:33:09 +0100")
Message-ID: <87plkenb26.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/rsync: security bump to version
 3.4.0
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

 > Fixes the following vulnerabilities:
 > CVE-2024-12084: Heap Buffer Overflow in Rsync due to Improper Checksum
 > Length Handling

 > Description: A heap-based buffer overflow flaw was found in the rsync
 > daemon. This issue is due to improper handling of attacker-controlled
 > checksum lengths (s2length) in the code. When MAX_DIGEST_LEN exceeds the
 > fixed SUM_LENGTH (16 bytes), an attacker can write out of bounds in the
 > sum2 buffer.

 > CVE-2024-12085: Info Leak via Uninitialized Stack Contents

 > Description: A flaw was found in the rsync daemon which could be triggered
 > when rsync compares file checksums. This flaw allows an attacker to
 > manipulate the checksum length (s2length) to cause a comparison between a
 > checksum and uninitialized memory and leak one byte of uninitialized stack
 > data at a time.

 > CVE-2024-12086: Rsync Server Leaks Arbitrary Client Files

 > Description: A flaw was found in rsync. It could allow a server to
 > enumerate the contents of an arbitrary file from the client's machine. This
 > issue occurs when files are being copied from a client to a server. During
 > this process, the rsync server will send checksums of local data to the
 > client to compare with in order to determine what data needs to be sent to
 > the server. By sending specially constructed checksum values for arbitrary
 > files, an attacker may be able to reconstruct the data of those files
 > byte-by-byte based on the responses from the client.

 > CVE-2024-12087: Path Traversal Vulnerability in Rsync

 > Description: A path traversal vulnerability exists in rsync. It stems from
 > behavior enabled by the `--inc-recursive` option, a default-enabled option
 > for many client options and can be enabled by the server even if not
 > explicitly enabled by the client. When using the `--inc-recursive` option,
 > a lack of proper symlink verification coupled with deduplication checks
 > occurring on a per-file-list basis could allow a server to write files
 > outside of the client's intended destination directory. A malicious server
 > could write malicious files to arbitrary locations named after valid
 > directories/paths on the client.

 > CVE-2024-12088: --safe-links Option Bypass Leads to Path Traversal

 > Description: A flaw was found in rsync. When using the `--safe-links`
 > option, rsync fails to properly verify if a symbolic link destination
 > contains another symbolic link within it. This results in a path traversal
 > vulnerability, which may lead to arbitrary file write outside the desired
 > directory.

 > CVE-2024-12747: Race Condition in Rsync Handling Symbolic Links

 > Description: A flaw was found in rsync. This vulnerability arises from a
 > race condition during rsync's handling of symbolic links. Rsync's default
 > behavior when encountering symbolic links is to skip them. If an attacker
 > replaced a regular file with a symbolic link at the right time, it was
 > possible to bypass the default behavior and traverse symbolic links.
 > Depending on the privileges of the rsync process, an attacker could leak
 > sensitive information, potentially leading to privilege escalation.

 > For more details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2025/01/14/3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
