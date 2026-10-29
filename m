Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF0606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ADrFIxei
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B9860ADC;
	Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASHDU7UHn92i; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C2BD760AF4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369165;
	b=eA2tBgczHapffnfWSdAehBS645amDUv3mj24J3ms5V3fxvOULbWtsg1VmYbH2AvstIfY
	 2+JIftx97tdH3k67oPRMUBcFUqY593Lv8bvGTI1b2kvcMHXjk0xCYKvVIxcgQIjYlSVfe
	 P0PSj7buJXbxHetWkX6fAHVvgj/Lc7Sgn24XvvUBZvJeSCIR+106h4488tPE2fyKkSG2g
	 Vw8summVU1WmS/F/PYBR7ouHBx67uTDRuVDWiTA/GOkys0+RKnjr0a/kOLbZ3VczdG8mu
	 qyfa/JuG2OCYeMI4LwT7vCnsOsppBTULpAjQQg8CPl2UfrGSwKmwbVP+rN+F//4Q/XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jUnkFOqsO3imYlfC+Q3gkafypoRVmtjpNYHN3YvX2h4=;
	b=s1ZG676+1JPovx8+J56IbKW9mOlbyGtW78LeV1oqOAhidKWk8JbN7wULDMl1rlK7PcXb
	 1AR8F/39TYv6r0KF6CAS7uAkYV24qPUqzX6aQJ15a30q3HFqZ+3PCyex9V7LFEjTUaYwP
	 WhoVEUxGp62+JoVCJFcxys/+zTCiTY9xgZYg2N2J3bBhWH3CLs6MkCU/IOB9Rm6NjezCd
	 9UvD6h3rkNh+cvVTtbU4ivGmIveVkBGy1pcAKZSKpFj0gBEQZUk+lYGSCMcc1G1ivOGIa
	 GS3Syt3KW3mlt5UF5Z0lOM9KDNIO8orN2o/Qlbiu4vwtLc7knPaO8Yg+N6jgeC/gBrQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369165;
	bh=jUnkFOqsO3imYlfC+Q3gkafypoRVmtjpNYHN3YvX2h4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ADrFIxeibOFqYlKeEtO9qB5DeMwzmvdQu424x7H1ZbJjT61L6Mn+m9bYBgZtnix7J
	 Kd8uwmvqZIYWB4SgbLikb8FsPXWUMeBl3k0mICphHroh927rKp4d5Sya3JAJnqbgiX
	 75mfvKegH+OkDzMFpKkdBK/XE4NgNSz3jucMGv2K+Xlp2FZoniTXJ9sZ2Pkc/9rU3o
	 1t819hbE/s3NOuZDU+ua9VWm1l1uYjt0yNE0ddK9H/Aoyf57KzbLot/SmPdhcDwpqV
	 4nu4EFuefZ5bCfhEFFkpxYrPi+T/Gd1SHilyE1GN4ueNdqiNnhZ1xYzbI5OY3ezuEK
	 76E4cY6uHsR5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2BD760AF4;
	Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCC04D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CECE8607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZc101dlqTJG for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 298A360ABC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=PO0HswZ62QUmnGti4F8kbJzuEoE5pX8DmU3q/HZ3CEOyIZQL3XlSsyrlofE9JNDhnASE
 pTxyZJVYM1S56FtFiWTEpj7OQQDXITl9zXSBVJK8xmOF64Bd1EAIkLCTgeF47/olRI9cA
 bYagq/+CyiXnjnNh2IIzABTaV57xm1steXkL0mBAGzfkywcB9cHR0NZH7tmiZGbqTWI3/
 rrwzolEXDXUyQS4WMgOywkIXqGDqNPgPt+zl+SVu+UwCTceIZLSYs/rIj9UUMNQSMoVWB
 5aiDN35QvBjaOLG62tnNAh8PcB0rG/Jn7NlAxKM38tvvzYoqh4V9KveQaXwvcGyDa7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+jqeBfVIJQh1YD631JV9mZlVJZovI0dtIP2n6l3JEUI=;
 b=XaMWbPdfHGwLGEbOjdcJ829VyvD+Y+jP7ZxNPH14HRxzWWcstha05IUguyrMUElMwcin
 3gmdeo67acRmlD7cdEH46yjLVkI3ybHLvebB83M9yG/GGWTufoRzT237CKCcmjk2pQHQf
 XW/jw3YZoEqZWXgducdet2Olb0YjZ/g/ggZjocOVZZoUriA4W73qyKWUt9QALP/QvtmBF
 FPCJ7S6R6pO29iBVBkqoDZHVe5xmZV/orJYFNrWdHL40nLssroefjHVMaEq+cthmBlnfd
 CoqjSvFfCSmECke8FIkJT2cM31d2itLyBg7EZzY1CvkCL33ts6WDjrs8/1cT4iL3psw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 298A360ABC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 498109D388; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 76cf318f1e82995516713a872cf3d323cf555df8
X-Git-Newrev: cca7d89e3f2974738018446dae010b27e448a96d
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.498109D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/genrandconfig: add
 missing newline
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
Content-Type: multipart/mixed; boundary="===============4132299345761092135=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4132299345761092135==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cca7d89e3f2974738018446dae010b27e448a96d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The line:

  configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')

would fail with:

Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 650, in <module>
    ret = asyncio.run(gen_config(args))
  File "/usr/lib64/python3.14/asyncio/runners.py", line 205, in run
    return runner.run(main)
           ~~~~~~~~~~^^^^^^
  File "/usr/lib64/python3.14/asyncio/runners.py", line 128, in run
    return self._loop.run_until_complete(task)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^
  File "/usr/lib64/python3.14/asyncio/base_events.py", line 720, in run_until_complete
    return future.result()
           ~~~~~~~~~~~~~^^
  File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 556, in gen_config
    if await fixup_config(sysinfo, configfile):
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 255, in fixup_config
    configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ValueError: list.remove(x): x not in list

because all configlines end with a newline, so this needs to be fixed
to:

  configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')

Fixes: b07d21ab984d10cbabeb186fbd47d446e027c03b ("utils/genrandconfig: handle BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 731121fc1b0f968fc94e8b168014c35d970ac7e8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3547d05b2b..257b1f853a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -257,7 +257,7 @@ async def fixup_config(sysinfo, configfile):
 
     if 'BR2_LINUX_KERNEL=y\n' in configlines and \
        'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
-        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
+        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
 
     if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
        'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:

--===============4132299345761092135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4132299345761092135==--
