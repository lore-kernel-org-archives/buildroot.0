Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9DEEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E60241FB2;
	Fri, 13 Feb 2026 19:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tworqqA906jC; Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9828141F9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011472;
	bh=LICt9E9v4GWrIOS2VdQ1eWUyun9TzEFRVjfzZZ5l+Z8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V0rxwpx8YyNd2DAPsCOiOyv6OPd/yPc7lgeAorAy5qrY6FcpqxMJX1RF2oM77iuBu
	 W3YTPMMT5l1x3N5/c/t56RBJWtVBpPUBeHe5llWzNvS5IKgpajgqoy57zux/4F5oQI
	 A4MavS2Q5D0FFEb2dvWK6qfZ1rsXQKKvaXF87xLqngrajINtxq2yVtUI4VgmGpdNJF
	 rvlDDR4Pi2cisgFba6TiLtTMmcj8e/40zq0SU1r7WJZZuZisp7ty7dhisrDWGrLPsp
	 dG5NJ6OoXy18RdcThsu+LXQ9zf/iwEXacKK9ps3K933PT0sJq8QU1q1arrdWvwS2cm
	 YAzdlRBIqkNEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9828141F9E;
	Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AAF283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A8B241337
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k74VDzEx6S2Y for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CB6B412A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB6B412A0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71DE0840C2; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:20:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 1bbf192cfbe819b424ae3493be382455a3647586
X-Git-Newrev: ba1df855214722ba48b55007cd810bf928de3fe6
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.71DE0840C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 support/testing/run-tests: specify multiprocessing method
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba1df855214722ba48b55007cd810bf928de3fe6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Since Python 3.14, the multiprocessing library API has changed.
Quoting [1]:
"""
On POSIX platforms the default start method was changed from fork to
forkserver to retain the performance but avoid common multithreaded
process incompatibilities.
"""

Since this is expected to be under "if __name__ == '__main__'", we need
to have this in support/testing/run-tests regardless of how this will be
fixed in nose2. See [2].

Fixes:
[3]

[1] https://docs.python.org/3.14/library/multiprocessing.html#contexts-and-start-methods
[2] https://docs.python.org/3.14/library/multiprocessing.html#multiprocessing.set_start_method
[3] https://gitlab.com/buildroot.org/buildroot/-/issues/156

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
[Julien: slightly reword commit log and add links]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3d2141bceefda32bef06ddda594eaf8665913276)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/run-tests | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 2f670c03b8..1c4d2b4a85 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -142,4 +142,5 @@ def main():
 
 
 if __name__ == "__main__":
+    multiprocessing.set_start_method("fork")
     sys.exit(main())
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
