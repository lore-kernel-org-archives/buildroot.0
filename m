Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D5606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ILxHt0uJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B367810AF;
	Fri,  6 Nov 2026 15:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-o8FVtZfiBP; Fri,  6 Nov 2026 15:59:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3193081184
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980762;
	b=Mf8HmA39GlzT6IQ4GAS+AxXHBPc7w7GnXP5n+P92PjU70GOL6rIEMYSVddvkm20hJc3x
	 t6YTdYSKptp8fzjYvhFI/2XF44Q5ojK+d0mvcBy8lPwI1uqA5V5muVDAV1O26dpvzxroG
	 nKrtxfVDTTxquAWl0M8kW+k7W5egXDYAVNzeEVc7WuBv1ib7nkOZ2IQ6CvzuTr1rIuqMI
	 JN7WU462vwvFBGszse1vLeb1wlm3CiqoKObKRn2JvrfGgSQoHHbHcnIoCcL5IckFDxlY7
	 t9XdWX8uBHOXeGrZ/cr1CePRO5OtyChhu1ZBb4eGpC3HsF1yNbPUAWS3Wks2ACyvnaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Qud7t/K8mrDJbIQcdMgIQ8ei81/VwDlSlB1dUI+c8aA=;
	b=VAT31w3OMppB/DynABj+qQX6CwKfphcnk3Ou/wnuSnKQKFFePqzHzUitUFGujLfepS3l
	 s/caAiDdBVQZne4nxGZdZTGPB02XCutKI86ggHo0VjAM9kvu7zmJD/F/eMaLFq0z0jB9P
	 lmrMddtWP5LPKf1yWcfoZAZJB0j2RQasWen4RajpqagccNuUOQ+CER/jjm59aybkqeI0Z
	 qjsLMYX2cuzgiBbAprUdoJHz3+1zTEWeMXmwwrUpvyIkFXp7uyGXR7LMX31PDTTUcmpnl
	 bDRhw0Bjkwe4xSValoPvuK7icG1kwvNKAJ2/WuLX9luvudq4p6XT+hNe/ZkY9/5WpZg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980762;
	bh=Qud7t/K8mrDJbIQcdMgIQ8ei81/VwDlSlB1dUI+c8aA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ILxHt0uJsc3zszP7ame1Y40jRJong7ebna9LVIo18vpiVnJsObrstOIqjCDfq+AHm
	 pZZ1C3/t3jCMgA7dvavpnFDJAYeSHYb9HISdaOdpAQ3Ri1TPmFr3rrd6hkWVZmz9eL
	 TVUkZIfFMO+YOVCzWLSyP4KSHPTFOQXCIaJlPNuQzeY30Mt6s1Vu7FPrT8UXvHC/ok
	 VYoeGPr2Y01RlscEysuLSb4PUWaFLayfMWdXgT0IHElCdyoM/jc+vlkpgIdt/XUubT
	 QfvKV6zWGKMkJCrwzx8++nxilj8RHl8RusUoVe67MCIKAd5b/Cxyhb42C69/Ffr4Nt
	 cLsOqZr045OWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3193081184;
	Fri,  6 Nov 2026 15:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF0FAA14
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5881400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDu6TDotp5kg for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C5F31403D5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5F31403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0965C9E09B; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 566bbdc0f014e417c33f95de88bd125336b11779
X-Git-Newrev: 3133b61f8547bc41b556761edb27eb16e22755d5
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.0965C9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-httplib2:
 add patch to revoke compromised eMudhra CA
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0038662791042472154=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0038662791042472154==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3133b61f8547bc41b556761edb27eb16e22755d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

(alternative to commit 006269e93297e1a4009553526b158c6287aad805)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...d-comodo-aaa-certificate-services-root-ca.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
new file mode 100644
index 0000000000..f4728f810e
--- /dev/null
+++ b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
@@ -0,0 +1,65 @@
+From: Kirill Logachev <kirl@google.com>
+Date: Wed, 21 Oct 2026 05:15:52 +0000
+Subject: cacerts: remove distrusted Comodo AAA Certificate Services root CA
+
+Remove the Comodo "AAA Certificate Services" root certificate (SHA-256: d7:a7:a0:fb:5d:7e:27:31:d7:71:e9:48:4e:bc:de:f7:1d:5f:0c:3e:0a:29:48:78:2b:c8:3e:e0:ea:69:9e:f4) from httplib2/cacerts.txt.
+
+Six eMudhra (emSign) intermediate TLS CA private keys were compromised and are trivially reconstructable by third parties. Because the legacy Comodo "AAA Certificate Services" root CA cross-signs the affected emSign Root TLS CA - G3 hierarchy, TLS clients that do not enforce browser CRLSet/OneCRL revocations remain vulnerable to MITM attacks if they continue to trust this root certificate. Major root programs and CA bundles (including Mozilla NSS and certifi 2026.10.19) have removed trust in this root certificate.
+
+References:
+- https://bugzilla.mozilla.org/show_bug.cgi?id=2083449
+- https://emudhra.we-have-a-problem.com/
+- https://github.com/certifi/python-certifi/pull/440
+
+---
+Upstream: https://github.com/httplib2/httplib2/commit/5fee2b095f49a6ad5e1f0a185d909c89199e4dc9
+[Titouan: add python3/ prefix to file path]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ python3/httplib2/cacerts.txt | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/python3/httplib2/cacerts.txt b/python3/httplib2/cacerts.txt
+index 78a444c..e80059b 100644
+--- a/python3/httplib2/cacerts.txt
++++ b/python3/httplib2/cacerts.txt
+@@ -875,39 +875,6 @@ Zvqz2cK6Kb6aSDiCmfS/O0oxGfm/jiEzFMpPVF/7zvuPcX/9XhmgD0uRuMRUvAaw
+ RY8mkaKO/qk=
+ -----END CERTIFICATE-----
+
+-# Issuer: CN=AAA Certificate Services O=Comodo CA Limited
+-# Subject: CN=AAA Certificate Services O=Comodo CA Limited
+-# Label: "Comodo AAA Services root"
+-# Serial: 1
+-# MD5 Fingerprint: 49:79:04:b0:eb:87:19:ac:47:b0:bc:11:51:9b:74:d0
+-# SHA1 Fingerprint: d1:eb:23:a4:6d:17:d6:8f:d9:25:64:c2:f1:f1:60:17:64:d8:e3:49
+-# SHA256 Fingerprint: d7:a7:a0:fb:5d:7e:27:31:d7:71:e9:48:4e:bc:de:f7:1d:5f:0c:3e:0a:29:48:78:2b:c8:3e:e0:ea:69:9e:f4
+------BEGIN CERTIFICATE-----
+-MIIEMjCCAxqgAwIBAgIBATANBgkqhkiG9w0BAQUFADB7MQswCQYDVQQGEwJHQjEb
+-MBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdTYWxmb3JkMRow
+-GAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRpZmlj
+-YXRlIFNlcnZpY2VzMB4XDTA0MDEwMTAwMDAwMFoXDTI4MTIzMTIzNTk1OVowezEL
+-MAkGA1UEBhMCR0IxGzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
+-BwwHU2FsZm9yZDEaMBgGA1UECgwRQ29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMM
+-GEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczCCASIwDQYJKoZIhvcNAQEBBQADggEP
+-ADCCAQoCggEBAL5AnfRu4ep2hxxNRUSOvkbIgwadwSr+GB+O5AL686tdUIoWMQua
+-BtDFcCLNSS1UY8y2bmhGC1Pqy0wkwLxyTurxFa70VJoSCsN6sjNg4tqJVfMiWPPe
+-3M/vg4aijJRPn2jymJBGhCfHdr/jzDUsi14HZGWCwEiwqJH5YZ92IFCokcdmtet4
+-YgNW8IoaE+oxox6gmf049vYnMlhvB/VruPsUK6+3qszWY19zjNoFmag4qMsXeDZR
+-rOme9Hg6jc8P2ULimAyrL58OAd7vn5lJ8S3frHRNG5i1R8XlKdH5kBjHYpy+g8cm
+-ez6KJcfA3Z3mNWgQIJ2P2N7Sw4ScDV7oL8kCAwEAAaOBwDCBvTAdBgNVHQ4EFgQU
+-oBEKIz6W8Qfs4q8p74Klf9AwpLQwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQF
+-MAMBAf8wewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5jb21vZG9jYS5jb20v
+-QUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwuY29t
+-b2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDANBgkqhkiG9w0BAQUF
+-AAOCAQEACFb8AvCb6P+k+tZ7xkSAzk/ExfYAWMymtrwUSWgEdujm7l3sAg9g1o1Q
+-GE8mTgHj5rCl7r+8dFRBv/38ErjHT1r0iWAFf2C3BUrz9vHCv8S5dIa2LX1rzNLz
+-Rt0vxuBqw8M0Ayx9lt1awg6nCpnBBYurDC/zXDrPbDdVCYfeU0BsWO/8tqtlbgT2
+-G9w84FoVxp7Z8VlIMCFlA2zs6SFz7JsDoeA3raAVGI/6ugLOpyypEBMs1OUIJqsi
+-l2D4kF501KKaU73yqWjgom7C12yxow+ev+to51byrvLjKzg6CYG1a4XXvi3tPxq3
+-smPi9WIsgtRqAEFQ8TmDn5XpNpaYbg==
+------END CERTIFICATE-----
+-
+ # Issuer: CN=Secure Certificate Services O=Comodo CA Limited
+ # Subject: CN=Secure Certificate Services O=Comodo CA Limited
+ # Label: "Comodo Secure Services root"

--===============0038662791042472154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0038662791042472154==--
