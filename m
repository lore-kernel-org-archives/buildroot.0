Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3656CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C5580F5F;
	Sun, 11 Oct 2026 10:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3vErCv5NT3m; Sun, 11 Oct 2026 10:18:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3022180F62
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713917;
	b=kheZ7B8RC00hjrmIjYEGQTlqpxHTkpwtP+SOUwEwS0gcGnnSEPHZ7wWi7gDXCE7ZGCeb
	 Rip+fARawL1dB4p6yR/hA4oOxFOxzKOGUguXwMiZuX/846eXiX81QcZYv9FVF8o0EebNM
	 HrzquRxlKsYTYO9fwoXk1TXkwt3PG8+o6qYpAsWvkUNaX+6Cugcm4FCZd1qEP9WAE8VmE
	 4yUvqFkiMKvxslZUl/UfwXGVj9K67Ey26wdigTxQOu73cJ6mcewnVthoSxs11Ul2ada2v
	 qMj+8YWPbqeExoqTmBv6bdp+I9x/bQjeK3korktWho7W+ByFWjGxOeEZCoJC71/bNiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713917;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZZ1L9TOF1mGqXMEW4kDvSRk35arv+YmZ57VUuuxEjEA=;
	b=NeSeLRifATsp0ZqZHhGp8NgrDOv2hsyl5r1d0sfudZdroOy8cEZLmx07iwaALqQjfeG4
	 MZW0U+seCWZgW6ZoAU5apTz1ibZYKGVkx4H9/emRLUIAWbqptsG4Bef4P/Kia4fnftBwS
	 QIebKrv6f0MIA5zzP1ygAKlZqhWDUjaq6CZMefHdTXxN61YyKQpl14Mf8uoqZzaYlfCR7
	 cGe69OEK3XCKjJ7OZ6gXYC7zfnHm8XvDmdsKkOHuuLsZv/hX3h+BQQ7dBxz4Un9l9Dheo
	 qKDJ8e3L5eR+lQz8dbgwKtsK5AkZdB+d/GFnvFimvMGjDC8iqK+123hu5pkLS8QK1Dg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713917;
	bh=ZZ1L9TOF1mGqXMEW4kDvSRk35arv+YmZ57VUuuxEjEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RA3DVvdFcZ0+XhuMaQDIOpZifHz+7yMIY9zaYNAVxR/XCrahgsEmM2/uRKszq8SZy
	 nUKo7Ds28M0qcRmv25RW9Y++MtkPMOpaSnOE6YxhhDDbPvp5/r81O68BJA8vBz1ner
	 5qCDsFMxOiA0wRITw/HhItbmFCB7ccv81P4khVoDBq/XCI48q8UXmQWzA0DH8lTZTj
	 5Xep0o5p6TIBF9kRGrCDg2RtewldcSO5fuWUgGR7f3FKQHR3FzEevIvIMKGrJS8Kob
	 z2Sy9zgxJAWPvYS3Zk7GydpEHXiFzJLB8FuIqXXao/248mWbmsavoncsyzKtoXPuce
	 ld0jcYaYPgv5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3022180F62;
	Sun, 11 Oct 2026 10:18:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0095A235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58B0380DC2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zCnbHrGGEsp for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EBA3A80DAE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713912;
 b=CRznSjZhAXfMVC+8dyTBbYBG4MMAnQpmIzYdMDjeEvaF73ASJEvGCCTFq0vk4cHKBnRI
 uacoWdFg4jbZpE3RZGYjnDhsmFqX4sQtGnhAbziHkdeA9cdiSrYZIRf5fdoVbfcPuGBtb
 jA4HTIp0VYqVy3L5edCUW98YZfZCwn8ER7WBIkXPf6ONjL1jbtz6cWmd2D9LKIVs35XyQ
 ERR2OiyKUbpLQ83Q5c7AusLzix14NRjhjMSOLo7anGbM+riisyPTtnbjZQz6UG2bd0QJ4
 lkkWMr8BJ48q0E9gDNX0qQ/pEeM4bSU+s1VMQezaVEC4j19e9gu3BEqg50umoVHLphw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713912;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BhPmKDR4MMr42saTog9Cz2rtAVgT3vI/TSS+YfD9530=;
 b=LngxWpYsGd2chr0rknCdHWzreVwDBrkaRyzDNxH0Iv/F2ZzZyl/LIUjgVNCk0hCkqv+q
 EiE+w5Ig/j+a/j+PvYBM4c3qrO2d4/XS9mZnJ2Ax6NkYoSdEEnGYUCna6bJSCAkytUjPV
 7rq4giG3k56nTn8RM5cXbYV51CkPU7klmDK61qC+89OWUcavlVDAkq4U8ucsKmXZPwZ8N
 J+asGYjSzcPMBBlZKMFJyV93AesKfvsiolcAwYWgCd8etVWm44iVFjqqLVnFmjcWfSfNc
 XTPwReC4Bcpna42SJewzbPzjevuizcF9PXI8UrhdUCLUdbNhXZ69XFQAj65rZIH+cuw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA3A80DAE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F6C8937B6; Sun, 11 Oct 2026 10:17:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 12:18:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd4b90e81be0c47b324b50b81e0bfc9b38a5b99b
X-Git-Newrev: 358f22680949692a4fe503e57802f3043f8a3169
X-Patchwork-Hint: ignore
Message-Id: <20261011101713.4F6C8937B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: use argparse
 defaults help formatter
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/358f22680949692a4fe503e57802f3043f8a3169
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The argparse library documentation [1] suggest the usage of
'ArgumentDefaultsHelpFormatter' in the ArgumentParser declaration to
show the default value of every arguments.

Use this to avoid declaring this value ourself which possibly gets
outdated with the actual default value.

Note that this also adds an unnecessary default: FALSE to the --virtual
option, but that's a minor annoyance.

[1] https://docs.python.org/3/library/argparse.html#argparse.ArgumentDefaultsHelpFormatter

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Suggested-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 98009cef98..c292ef7840 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,23 +529,24 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-            description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-            '''
-        )
+        description='''Create a CycloneDX SBoM for the Buildroot configuration.
+            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
+        ''',
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter
+    )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
+    parser.add_argument("--virtual", action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
-                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+                        help="Specify the project name to use in the SBOM metadata")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
-                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+                        help="Specify the project version to use in the SBOM metadata")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
                         choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
-                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
+                        help="Set CycloneDX version")
 
     args = parser.parse_args()
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
