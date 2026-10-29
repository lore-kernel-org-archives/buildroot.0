Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09693606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RRjzP7pp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC86240C3A;
	Fri, 30 Oct 2026 14:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMgtCtt7WGIO; Fri, 30 Oct 2026 14:08:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D61E940C26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369284;
	b=i+oL5PtQsjvXyO02CvVgJUWJjYkVACBcfmbX59bud278aRDcnDwgG9hDfZt1U7Iu4hCs
	 ArkiAb3dADVNa9Ic7H2807SCCB5enbSVYEcXiYWxcmMVYWeIkXrpu7SWxDxvhZ3yHWOWZ
	 8F/SdpS8Ffyb3J2G/Cd7t+0uiWx5ViA5c8d4q8njitjukPh+ZARdtMDb1YMrhX8L/CEUv
	 K3fX4d5BQD4KbN/jQV7oLFM2sM++vYKUvRJ+fLOZKIm7qkDQCvEH67ctyrWmHRXMsrk9i
	 b/7TJ2eNGo9sOSTgUxgJLq8ukAQ1JS23d7ueGN+sU21TgSZZaQNRHxXROVx2o6Dzvvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UStDQZXliMQqoP8mCujAEYpsTl/QjxfGAl18gqIIIFU=;
	b=GeK8XHH2isiBqSjwkt/YQrwz0Wb/Z8Vde9Cw/DZ0udUo3MRsttHFTH5YlvLu99Co967c
	 vpvf9umqtyaa60Eq/EmBfOhBK5wtXY5yHd/VrWFLPfqAYsOnzF6/Sgdr/4u7606/1XNhZ
	 NvVhZlLE+DzO64byOL33UQuNDFG5olHg9VJdOip3JU2TD/zaqn/Ge56m4IuO24xAqAsmT
	 X92v0ljOZ1GlcLTZmBu85MkZWqD/2yali96Bh9GdDIXOZtDKGeKYr3HhfRd1oeHRE7h40
	 8agfKZM1Q29X9+VUVI4i+kutsW8PCykIJTrFPSIsiHVv84sDy6TZjW8oiRu+Ec8ZGQQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369283;
	bh=UStDQZXliMQqoP8mCujAEYpsTl/QjxfGAl18gqIIIFU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RRjzP7ppJiCetEiDrQi9kVfAf53ltn1u6rH5ElA+xIofRmnl9qVIVKLMo27EABVi0
	 cM1bXhDMvllDQNjffb2TlgYvfm7T+UEFAf+PRwDbYXUPSi/ANfPxrwAc03OQj6MecZ
	 I1K03aN7XUcM8L25AUxIx+fQgsWDDREFAc3GsExmpiyNszFpBdmiDbu1Ov1YXFVWDB
	 76GA4EUAJ/6IqOmvm8OSCIVDueDnJn5h79ekLEj6wy/gQWw1efY83g0dh89nGsFAHO
	 ajFOjjXNDVNhYB8MNCelrIlmfj+5TRvg0ym3bJDglkVPUJIqEaroF5EZnYab4vpSnR
	 WIOzOD22aua0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D61E940C26;
	Fri, 30 Oct 2026 14:08:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 800C1D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60C26607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RY1w0vA9iN8Q for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8343460AFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=Lo+QKQFQsYx6/GJZtqfb5LpvY3qGchs8HEzcSdwvl9W3PswL0GyQTzWDeLAtNAojp9jx
 sT7CbcjX3JUeERlKFcPmEnw+RJMc6QmGcliLDv0433uzpsWMvT63ym9kW7P/TSAvc1Ys9
 q8pMsEeXajeLmPfpU5xFSCV33vGA7sRpsaryujR8wEsFTLrqZgYm8M5sDZsmeF8O/OS5q
 10A0u+sArI/6T1oQ1BEvE0YpdpuLLuJ0Y+qQY9TciNhxCTtVm7dRn9ibVbbAJtLpU6O4M
 kZswG5GNFoFa1APshAGnCXAVPJMMv/AZw0WAlMStBzI8Yh3jIpwAdLjJuFRs8W/qyzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=n+JNd25S/A+nGWnm2wpYujoucJdaB75EwntjZwyBODg=;
 b=sgLCexSezyNuitbV94N8NVrwzWXRu5q1hpsP+xlyb6bq4Of1NiN5tTgui/ym+kjR5Imq
 q2+dlIdQcjgf/Z/rZ4n0XOz6QCZFEJZCQbfygtRqDBxF/D2Tl3tmo4jFnRP2cVtDMKQKR
 MtZvPNkRo2xH7faP/sRRSzu5vMOYX0F55xFnhcgOAXotT2ZyOXbltwHRa56Ml40zCDINT
 fD07smp7oFWTZgOUDDPMq1AbJ7jpQYw4Nbu1kst+wOs5I4mFlS0fnu5qg3mwznJ4aajiP
 CCzlGfkued+7woOZpk3CCJbpSLgRz8gHW8JiYHUQJ0e+VfT77Xv/4adi6/x38tDRqdw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8343460AFD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A06E59D38A; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 914d97da0612b64befd83a1889a883040b0981b9
X-Git-Newrev: 7e8a291ec9c0fca3bdfee9e91875292c3ea310d7
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.A06E59D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-botocore:
 add patch for eMudhra leaked CAs
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
Content-Type: multipart/mixed; boundary="===============0471728382397647611=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0471728382397647611==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e8a291ec9c0fca3bdfee9e91875292c3ea310d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

botocore commit 0a6c7b6b3e794e865193dee23c68adfadb6b9c04, available from
version 1.43.117 onward (see [1]), blacklists the roots that signed
the compromised eMudhra intermediate CAs ([2]).

Since LTS & Stable versions are several versions behind, take this patch
instead of bumping across (potentially breaking) versions.

(alternative to commit fd9c348c227e9560a45caaeaa2cb026a8cf8043d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...o-aaa-root-from-vendored-cert-bundle-3838.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch b/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
new file mode 100644
index 0000000000..515257271f
--- /dev/null
+++ b/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
@@ -0,0 +1,57 @@
+From: Shaan Majid <70789625+shaanmajid@users.noreply.github.com>
+Date: Tue, 20 Oct 2026 14:51:25 -0700
+Subject: Remove Comodo AAA root from vendored cert bundle (#3838)
+
+Eight eMudhra intermediate CAs whose private keys were compromised chain to AAA Certificate Services through Sectigo cross-signs (https://emudhra.we-have-a-problem.com/). Mozilla removed the root's TLS trust in 2025, and certifi dropped it in 2025.4.26. The bundle contains no emSign roots.
+
+---
+Upstream: https://github.com/boto/botocore/commit/0a6c7b6b3e794e865193dee23c68adfadb6b9c04
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ botocore/cacert.pem | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/botocore/cacert.pem b/botocore/cacert.pem
+index 68d899399d..52ef539353 100644
+--- a/botocore/cacert.pem
++++ b/botocore/cacert.pem
+@@ -356,39 +356,6 @@ LBfQdCVp9/5rPJS+TUtBjE7ic9DjkCJzQ83z7+pzzkWKsKZJ/0x9nXGIxHYdkFsd
+ 398znM/jra6O1I7mT1GvFpLgXPYHDw==
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
+ # Issuer: CN=QuoVadis Root Certification Authority O=QuoVadis Limited OU=Root Certification Authority
+ # Subject: CN=QuoVadis Root Certification Authority O=QuoVadis Limited OU=Root Certification Authority
+ # Label: "QuoVadis Root CA"

--===============0471728382397647611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0471728382397647611==--
