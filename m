Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD475606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YT7QMN37;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256 header.s=MBO0001 header.b=hId1adYB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F6380D5E;
	Mon, 16 Nov 2026 08:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyegKCEGN-hD; Mon, 16 Nov 2026 08:15:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 113CE80E4D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794816940;
	b=oI9xb/kJi92AswAFndFyeQSkLLA0aFwEDhb/u27S3FnhuG6jllmK4Glvj0e2N9zKNZtT
	 Z4OlgQOVSTL1HHHSjZ6A619Dk1bPPkRidsXDWwkRarX0GF/1yF65U8hGgB9SFrFOFKcSY
	 AgmcQIyZn2BP4ItgrwJhcIydHWTcRXgCi9zkelfF2q2TVTemQmkIZnnfgDixs6L7TmnKW
	 rw+aAf1eav02d97tykkvVVeNSNj1UaOWBn7Eo5O8nuHGtSvuZMKw9m23ClJ2v0MDaX88w
	 mV3LIJ1TmOvb1HZsqAQrGVzcjvDpqyWVFMrbMXQu4igL1unZE0qg7GQkNf9NFDFBf/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794816940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-Rspamd-Queue-Id:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Errors-To:Sender;
	bh=T+VTRpWWp2AV05/x5McDYMCKgLtwb16jqkvyFR97fCM=;
	b=hRjKKib1YOs3vCd+MUxzmw3rNUB/jSXdD/zC0u+FaYE7kGHhOc1uXnKeP97IxZw0/YJy
	 DdL2TxexnukpkrofT725u1cjhxbYLw/bq4lxLcAGlhUpFY0GnELVMGWEIv13UHrPxVYNg
	 wdyNFfqVbU3YFX+hw4tqr2y6PxNU9N6aWsjl+P6pGNVjeEq30pY0IkBDyqFPeq4OD6wgt
	 aiGVECJL5RUXnDyMCAvILPOtB/yCP0/mHwTfCzWUCJpaRKAj75Go9QvXLlH9m2pcjP0fr
	 JvvqQdbkP0mLSds1PlBmoeiz1Npy/MsgoYp491hg/LBOsBeW0buMNLrgqIfj0BDAzpw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794816940;
	bh=T+VTRpWWp2AV05/x5McDYMCKgLtwb16jqkvyFR97fCM=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YT7QMN37GoBKHOJ8Zc2+l0TGPXpgPlqAh9+RzbWBRg3ztKp7fWeSVqx0d/XiQxvw/
	 hKGHluWYUiDsNqg09/7krqoKNYKiHN7DklXWuH9bvZGUA5UPeTyOlVxqzDHAJySQ7C
	 OQcNStpm/GUjFfWF8mlJLE/hP/ic68fCNuMnuVPw/x9sZiAJYOyB9Jy4yUFXNc51ay
	 gRYEfuK9JcXJnti/wAQT9Sse8buVBQoOE7xuLZZWaofUc8Bsz5DGmZRqizRtKrFuOm
	 7j0i1s4tRa1MRFIWWMQ4lzZ02emgMyNrzFv0yGImoByPhublNOhGP1z5z/ng/yTkCV
	 fDQdm+OCDXFDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 113CE80E4D;
	Mon, 16 Nov 2026 08:15:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D51B176
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 08:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3279A405C9
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 08:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhqxzlTisvXq for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 08:15:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 400F5405C5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=195.10.208.40
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.40;
 helo=mout-b-210.mailbox.org; envelope-from=sebastian.michel@oss.othermo.de;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=hId1adYB
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 400F5405C5
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 08:15:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jSgf905yMzFphR;
 Mon, 16 Nov 2026 09:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1794816929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fPLCTGLZdKUe4pLMw6jJeZRO9Gx6Gnh2E1aT3tcbU/Y=;
 b=hId1adYBIFaD12w/TAfWRhh9oql8PqT1e/jSS49FQ47kyu96benQpXF4vNlKgQ1syXv0Et
 qLlAIWGovEznQpZ8o2pCX6MMP4bTEba+/uNeqJB40o5gW3d5o8je1+6rPrlqiVUo28R9oA
 QGVYKZMB5v2s1QPlb0/fieVEo9SYtczOs9M2/LrtCKo1TN5lPHD+XJq1Kp4XvmMXKhcRTk
 5/x/KhteZ92Q+NdVFzpcIBxZHxjc45gdRfVtk0D00PAWy27hp4Q+4RDh0sKk9bMRj7EvTq
 WeABIUjSwFbo4ymkjYxv9OGugxQ6XxUfDHheWx7DXLlPHe7u86jmvERRPmDHlA==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
Message-ID: <f5679391-fea4-4ad3-a0dc-01e7031dbd7b@oss.othermo.de>
Date: Mon, 16 Nov 2026 09:15:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
 <87bj7r8qcv.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
In-Reply-To: <87bj7r8qcv.fsf@dell.be.48ers.dk>
X-Rspamd-Queue-Id: 4jSgf905yMzFphR
Subject: Re: [Buildroot] [PATCH] package/wireguard-tools: switch to
 git-based source download
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1259205378639937971=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a multi-part message in MIME format.
--===============1259205378639937971==
Content-Type: multipart/alternative;
 boundary="------------2Vg5arIPBVTZX8EyHPGDlHbj"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2Vg5arIPBVTZX8EyHPGDlHbj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 14.11.26 um 15:00 schrieb Peter Korsgaard:
>>>>>> "Sebastian" == Sebastian Michel<sebastian.michel@oss.othermo.de> writes:
>   > Upstream wireguard-tools has replaced published release
>   > tarballs in the past, causing Buildroot's hash validation to fail
>   > despite the version being unchanged.
>
> Ahh, as the author of cgit, Jason would probably like to know about
> that. Did you contact him?
>
> I just did a try here:
>
> wgethttps://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz
> --2026-11-14 14:57:27--https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz
> Resolving git.zx2c4.com (git.zx2c4.com)... 45.77.67.64, 2001:19f0:6c01:174a:925a:8ff:fe78:9eae
> Connecting to git.zx2c4.com (git.zx2c4.com)|45.77.67.64|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: unspecified [application/x-xz]
> Saving to: ‘wireguard-tools-1.0.20260223.tar.xz’
>
> wireguard-tools-1.0.20260223.ta     [ <=>                                                   ]  98.12K  --.-KB/s    in 0.06s
>
> 2026-11-14 14:57:33 (1.66 MB/s) - ‘wireguard-tools-1.0.20260223.tar.xz’ saved [100472]
>
> sha256sum wireguard-tools-1.0.20260223.tar.xz
> af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf  wireguard-tools-1.0.20260223.tar.xz
>
> Which matches what we have in the .hash file?
>
>... Which matches what we have in the .hash file?
Ah sorry, I should have given more context here.
I am having the issue for package `wireguard-tools-1.0.20250521`, which 
was the previous release of that package in buildroot.
I suspect that wireguard-tools was re-packaged for some reason and then 
uploaded using the same file name.
To prevent this from happening again in the future, I created this patch.
Take a look at the following log.
The first downloads hash verification fails, source: 
https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz
The second download succeeds, source: 
https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz
```
>>> wireguard-tools 1.0.20250521 Downloading
wget -nd -t 3 --connect-timeout=10 -O 
'/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.PqUNRA/output' 
'https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz' 

--2026-11-16 07:49:09-- 
https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz
Resolving git.zx2c4.com (git.zx2c4.com)... 
2001:19f0:6c01:174a:925a:8ff:fe78:9eae, 45.77.67.64
Connecting to git.zx2c4.com 
(git.zx2c4.com)|2001:19f0:6c01:174a:925a:8ff:fe78:9eae|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-xz]
Saving to: 
‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.PqUNRA/output’
/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.2025 
[ <=> ] 98.00K --.-KB/s in 0.04s
2026-11-16 07:49:11 (2.40 MB/s) - 
‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.PqUNRA/output’ 
saved [100348]
ERROR: while checking hashes from 
package/wireguard-tools/wireguard-tools.hash
ERROR: wireguard-tools-1.0.20250521.tar.xz has wrong sha256 hash:
ERROR: expected: 
b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e
ERROR: got : 
61f520e7c1664ae9301fa36a2b8e90cf4680887a71f456c290d5d8b879f1e2e6
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
wget -nd -t 3 --connect-timeout=10 -O 
'/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.0weWLX/output' 
'https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz' 

--2026-11-16 07:49:11-- 
https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 
2606:4700:20::681a:125, 2606:4700:20::681a:25, 2606:4700:20::ac43:4838, ...
Connecting to sources.buildroot.net 
(sources.buildroot.net)|2606:4700:20::681a:125|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 100340 (98K) [application/x-xz]
Saving to: 
‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.0weWLX/output’
/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.2025 
100%[==============================================================================================================================================================================================>] 
97.99K --.-KB/s in 0.02s
2026-11-16 07:49:11 (5.00 MB/s) - 
‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.0weWLX/output’ 
saved [100340/100340]
wireguard-tools-1.0.20250521.tar.xz: OK (sha256: 
b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e)
```
>Ahh, as the author of cgit, Jason would probably like to know about 
that. Did you contact him?
Not yet, thanks for the suggestion. I'll contact Jason to report the 
issue with the cgit snapshot download.


--------------2Vg5arIPBVTZX8EyHPGDlHbj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 14.11.26 um 15:00 schrieb Peter
      Korsgaard:<br>
    </div>
    <blockquote type="cite" cite="mid:87bj7r8qcv.fsf@dell.be.48ers.dk">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">"Sebastian" == Sebastian Michel <a class="moz-txt-link-rfc2396E" href="mailto:sebastian.michel@oss.othermo.de">&lt;sebastian.michel@oss.othermo.de&gt;</a> writes:
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
 &gt; Upstream wireguard-tools has replaced published release
 &gt; tarballs in the past, causing Buildroot's hash validation to fail
 &gt; despite the version being unchanged.

Ahh, as the author of cgit, Jason would probably like to know about
that. Did you contact him?

I just did a try here:

wget <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz">https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz</a>
--2026-11-14 14:57:27--  <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz">https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20260223.tar.xz</a>
Resolving git.zx2c4.com (git.zx2c4.com)... 45.77.67.64, 2001:19f0:6c01:174a:925a:8ff:fe78:9eae
Connecting to git.zx2c4.com (git.zx2c4.com)|45.77.67.64|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-xz]
Saving to: ‘wireguard-tools-1.0.20260223.tar.xz’

wireguard-tools-1.0.20260223.ta     [ &lt;=&gt;                                                   ]  98.12K  --.-KB/s    in 0.06s

2026-11-14 14:57:33 (1.66 MB/s) - ‘wireguard-tools-1.0.20260223.tar.xz’ saved [100472]

sha256sum wireguard-tools-1.0.20260223.tar.xz
af459827b80bfd31b83b08077f4b5843acb7d18ad9a33a2ef532d3090f291fbf  wireguard-tools-1.0.20260223.tar.xz

Which matches what we have in the .hash file?

</pre>
    </blockquote>
    <div
style="color: #cccccc;background-color: #1f1f1f;font-family: 'Droid Sans Mono', monospace;font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><div><span
    style="color: #6a9955;">&gt;</span><span style="color: #cccccc;"> ... Which matches what we have in the .hash file?</span></div>
<div><span style="color: #cccccc;">Ah sorry, I should have given more context here.</span></div><div><span
    style="color: #cccccc;">I am having the issue for package </span><span
    style="color: #ce9178;">`wireguard-tools-1.0.20250521`</span><span
    style="color: #cccccc;">, which was the previous release of that package in buildroot.

</span><div><span style="color: #cccccc;">I suspect that wireguard-tools was re-packaged for some reason and then uploaded using the same file name.</span></div><div><span
    style="color: #cccccc;">To prevent this from happening again in the future, I created this patch.</span></div></div>
<div><span style="color: #cccccc;">Take a look at the following log. </span></div><div><span
    style="color: #cccccc;">The first downloads hash verification fails, source: <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz">https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz</a></span></div><div><span
    style="color: #cccccc;">The second download succeeds, source: <a class="moz-txt-link-freetext" href="https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz">https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz</a></span></div><div><span
    style="color: #cccccc;">```</span></div><div><span
    style="color: #cccccc;">&gt;&gt;&gt; wireguard-tools 1.0.20250521 Downloading</span></div><div><span
    style="color: #cccccc;">wget -nd -t 3 --connect-timeout=10 -O '/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.PqUNRA/output' '<a class="moz-txt-link-freetext" href="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz">https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz</a>' </span></div><div><span
    style="color: #cccccc;">--2026-11-16 07:49:09--  <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz">https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz</a></span></div><div><span
    style="color: #cccccc;">Resolving git.zx2c4.com (git.zx2c4.com)... 2001:19f0:6c01:174a:925a:8ff:fe78:9eae, 45.77.67.64</span></div><div><span
    style="color: #cccccc;">Connecting to git.zx2c4.com (git.zx2c4.com)|2001:19f0:6c01:174a:925a:8ff:fe78:9eae|:443... connected.</span></div><div><span
    style="color: #cccccc;">HTTP request sent, awaiting response... 200 OK</span></div><div><span
    style="color: #cccccc;">Length: unspecified [application/x-xz]</span></div><div><span
    style="color: #cccccc;">Saving to: ‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.PqUNRA/output’</span></div>
<div><span style="color: #cccccc;">/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.2025     [ &lt;=&gt;                                                                                                                                                                                           ]  98.00K  --.-KB/s    in 0.04s   </span></div>
<div><span style="color: #cccccc;">2026-11-16 07:49:11 (2.40 MB/s) - ‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.PqUNRA/output’ saved [100348]</span></div>
<div><span style="color: #cccccc;">ERROR: while checking hashes from package/wireguard-tools/wireguard-tools.hash</span></div><div><span
    style="color: #cccccc;">ERROR: wireguard-tools-1.0.20250521.tar.xz has wrong sha256 hash:</span></div><div><span
    style="color: #cccccc;">ERROR: expected: b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e</span></div><div><span
    style="color: #cccccc;">ERROR: got     : 61f520e7c1664ae9301fa36a2b8e90cf4680887a71f456c290d5d8b879f1e2e6</span></div><div><span
    style="color: #cccccc;">ERROR: Incomplete download, or man-in-the-middle (MITM) attack</span></div><div><span
    style="color: #cccccc;">wget -nd -t 3 --connect-timeout=10 -O '/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.0weWLX/output' '<a class="moz-txt-link-freetext" href="https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz">https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz</a>' </span></div><div><span
    style="color: #cccccc;">--2026-11-16 07:49:11--  <a class="moz-txt-link-freetext" href="https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz">https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz</a></span></div><div><span
    style="color: #cccccc;">Resolving sources.buildroot.net (sources.buildroot.net)... 2606:4700:20::681a:125, 2606:4700:20::681a:25, 2606:4700:20::ac43:4838, ...</span></div><div><span
    style="color: #cccccc;">Connecting to sources.buildroot.net (sources.buildroot.net)|2606:4700:20::681a:125|:443... connected.</span></div><div><span
    style="color: #cccccc;">HTTP request sent, awaiting response... 200 OK</span></div><div><span
    style="color: #cccccc;">Length: 100340 (98K) [application/x-xz]</span></div><div><span
    style="color: #cccccc;">Saving to: ‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.0weWLX/output’</span></div>
<div><span style="color: #cccccc;">/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.2025 100%[==============================================================================================================================================================================================&gt;]  97.99K  --.-KB/s    in 0.02s   </span></div>
<div><span style="color: #cccccc;">2026-11-16 07:49:11 (5.00 MB/s) - ‘/home/seb/code/upstream/buildroot-oss/output/build/.wireguard-tools-1.0.20250521.tar.xz.0weWLX/output’ saved [100340/100340]</span></div>
<div><span style="color: #cccccc;">wireguard-tools-1.0.20250521.tar.xz: OK (sha256: b6f2628b85b1b23cc06517ec9c74f82d52c4cdbd020f3dd2f00c972a1782950e)</span></div><div><span
    style="color: #cccccc;">```</span></div>
<div><span style="color: #6a9955;">&gt;</span><span
    style="color: #cccccc;"> Ahh, as the author of cgit, Jason would probably like to know about that. Did you contact him?</span></div>
<div><span style="color: #cccccc;">Not yet, thanks for the suggestion. I'll contact Jason to report the issue with the cgit snapshot download.</span></div>

</div>
    <p><br>
    </p>
  </body>
</html>

--------------2Vg5arIPBVTZX8EyHPGDlHbj--

--===============1259205378639937971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1259205378639937971==--
