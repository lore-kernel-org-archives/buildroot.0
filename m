Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4833CCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1559C61455;
	Fri, 16 Oct 2026 13:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id J4EteqhwjUBG; Fri, 16 Oct 2026 13:14:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EBA1461467
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156454;
	b=taIQ8290NKCSQewPFcorE591oXqI1/9GWOf0yZSIUcZugwuA7435e+7l9vYddoHBJ4Ps
	 PueKPzkLTyYP+4Rzhke30uu7A5FD75aT0qE2TIh8IJiWr7zNoDaDkJzZLJm0mpcC51hlh
	 lbSuJ9gg2Xdq0RDuGIvY5x98AVqAsKkznX2hZ4CrRMV1TZwIipFDXVBhNH8aBEPPfjBSl
	 qJbOGv7rs+oSRZbQ//JYlRA/w0sAp5ns6uqZxeEzrP7rTI7vSgkj3Yq1sRlkSUJO6NLA4
	 qx9pnujxSzJAd5b6oRUAsJYnCzm0+E/AgUIlviU/fygkeRFVRTxotz3z1dT5YN8kCXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jY3cwFk0EbXfDK5FEsTeQ0J1MZTOMLEYoRBkRBoHigE=;
	b=K4i1cKkyNLH91n97aXPa8MOdx3zk0agYQwOs+9wmYLjRkO3Y0rXdSMssnDPUeqERvLNU
	 oa+c33KSdch9vfXnNkdxh1itNxxQs7p5YkEhKWZy0Oz2q9P8odAnHjWP2eTFTdHckGIjE
	 gpaklPULtVfsOq3ry/plXeIk83aaL6OFsbWXRoxeA1BUS98mdhRpVO9miw7cDMdDmj+iq
	 0vRZ+sBpMOeRQAYWBIArclzUu56ZhMF7zdh/h6DrCyS8/ZphsfR/qNR/VxajZW0uRyL8b
	 f2K0fhY43pgYi2+8RWdNK1/Y4ZtExYyHx21wTAoDUczFo5QKDK619N5SJF/VW8XyOEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156454;
	bh=jY3cwFk0EbXfDK5FEsTeQ0J1MZTOMLEYoRBkRBoHigE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q0zLT1cBUHco/+94EZFn3z0gWGkTWzIK3pQeJxQvvkpFPgF+g+PoRv27trOiuFO5t
	 gSmU+3NFTuiUk3bRQQPQPNRgyvLttjtomVzq2UJo99PpJCNBowGxJkuvpG+pzKB6tD
	 zldWpxW3vZ9T8JI45RPWpthGkHKKsZNONxTmsj9OQ2T0f5AsMGJylHAZIzCyOUn5N7
	 zjp/db8Cql4z+3JhdC9StQIHE34fNxMsNAGL7hxEUBtfxyZGbVWQpWk89sH2L8OBkP
	 WMRK3ma+nnTSBsybIFC2+Lb7rRRjhrQcNA5uEhxJYpushLOQZyoRuElCfp5sGPL1Bw
	 kht3wTmWXIfRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA1461467;
	Fri, 16 Oct 2026 13:14:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E50DF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3270C60F22
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOGZcqTqxZ1q for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BE4760F5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=IzrYoH010GO/gewbA3Grt/AOeSb9DTIDNzBbWaOL57JKKywcPMImNBkdv+xHzJAhpe14
 nPDkuLRWSbsquGCyTBtOVL7LfzZJKqfXSegNFT7Q2yXGHJulg1yRDYJuM/5q9b+e37FWW
 P8Ca0ov8K5+jJEmmh5PdKBnc2dK80OYCTPvobB44nAb9vw3dZ+R259OVMe/st5ywlo5R8
 m9I05HIpKp9HP2r6WhP0fxSfrL0kXBw3tWUS0NioJaEbV87mXgQnqg+6H9yT7K+nAoZ+I
 6mgeOnGPSSlnSqGawnyXlJXoDPaO3rS5uKUz09+Si3VBarGrnHcsLI34+9HI7vo5kHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YTLd3gIjCIkxgwTZaHq+LqBxLvtPtMdciK1VkQSFASM=;
 b=C/ItRI2AzD03Jllmeub0kYnHXntXvJrbTcmEe5mx8lNqaW2uqP+kjk/UM0nrEEMSdOWW
 Rg1jOuCIJ4EP1mTKYhZNwjdvrU4OUlfRQET0Ng6WtE01a1FLew4dFvJPwcmmJatBiXUy8
 Bct+Olyr+rQJXclLIlz2hp7Aw07MgnL9CTSHjOdr2ybjy9earFJBkTT3LsmHeaSjaNXkf
 e8WIbm+bwMmajClk96uycpQTk2/V5+K3UBQQRNrGMuSNRHAh0LqFbDJ4lv4tCBaC2EVVw
 ErDvHNT+IPctx1brJJjXRHF0NgpqfmFqde/N2wzhyUP/VSYHDeSXgeDWn5aqNrAD3Dw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE4760F5E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C39B960CF; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:41 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5d484774ab8ff987131eda0c5b114ea1ab51060f
X-Git-Newrev: ca734db97298028d5fc9b173c655c564c28ba85a
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.7C39B960CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 improve help text
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0879861160136953596=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0879861160136953596==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca734db97298028d5fc9b173c655c564c28ba85a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The argparse has a set of arguments you can pass to the ArgumentParser
object to improve the looks of the help message.

The example usage used to be defined in the "description" but a "usage"
field exists [1].

Also link to the documentation in the epilog [2].

[1] https://docs.python.org/3/library/argparse.html#usage
[2] https://docs.python.org/3/library/argparse.html#epilog

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c13eabf18f6541bb264aa1b041ee56206c95c810)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index c292ef7840..9d3baa23f1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,9 +529,9 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-        description='''Create a CycloneDX SBoM for the Buildroot configuration.
-            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-        ''',
+        description="Create a CycloneDX SBoM for the Buildroot configuration.",
+        usage="make show-info | utils/%(prog)s > sbom.json",
+        epilog="For more information see https://buildroot.org/downloads/manual/manual.html#_generating_cyclonedx_sbom",
         formatter_class=argparse.ArgumentDefaultsHelpFormatter
     )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),

--===============0879861160136953596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0879861160136953596==--
