Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YCmLNb4e
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475E160B8D;
	Fri, 30 Oct 2026 14:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnNrzme17t0u; Fri, 30 Oct 2026 14:18:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 54BE660AFF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369899;
	b=OkLm8tU/tzv4WxYymzX03lUZVLK4VObLLvtgTbOZjP+omcx1z0rdEXNZFd2ULR9CSQf2
	 JHAKXwc2PrI7xWBAVrsIIZzl4F5blfUInp9t6lBiIizEFmcH/SBYSXlyibPA8XefOpphT
	 AnQ3aQYLnBsvXVPueNEygWzKE4dLqfB78L9XPrFx2zi/MCm04DJctmO4w9W65cYyvS8aY
	 d6x6efmqKN4IRCnFKxVIhfV4IF1KGiyFajMmUp5PNODK4WrcnXnLxKCGgl7VQ8/4iiYy/
	 SCGZWkykdFjPRoVb+UqfIGoguWXqCsMsXGmQiLXZMnNURjnoec1sCTmGw32y5BoSwHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rYL5XVz6PJL/BKwU58hbBtrac95spiDLk8Y9fbHy76U=;
	b=TCOANFiRQim4Gv7oaMY7H2Pc2geEOH0Oh55VgZwe4Zk8Yq3Yr1yuPN0HBk2llTahn2Si
	 DHA/xlxZGaJMnp5jeYlOXew5aLLYg45meoDkjB46jXO8v540TwAI2dLcLsF/piBcIO72B
	 yVIM0zUyhJ4JxVjVxHYvywS56HnEM8vz9Bo5SVJvxwVu7Pz/ky3jjvKwyqUrNYT2AjXDN
	 oqxwS0xaulZbWp9kSxknw9clcoTvPy7CocyReuQ3W5SooutBAT7JF1EUlw0oHZPB2bQUP
	 VfIG9Q2WOcyoqkMEKjKELXsx8o5VPYSSI5ZmAph7f6iHjrCkTrpeAdlUrj/DwlrHIng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369899;
	bh=rYL5XVz6PJL/BKwU58hbBtrac95spiDLk8Y9fbHy76U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YCmLNb4eidcQx1zoFXITYcZb1+1YdJotkSpxjx838yhe8EJk3oxJ4vJ1nO5rBD4Sg
	 OUp84vqbbEeL3VaCv8cLq/0z8SQ7cbD4206zK+R9UX5nsLRs4KSzOUPWdODYyOrdzr
	 B4qxMEIka54aCjH5LCgtfch1ctcet0faxsSr9KWzr6nklDW8qT2rKvrd3p2JuwhBRx
	 LiWnFWvwwqh7gP5zcJgi0JGWSL+tCgWowKHB/suc7iwys/T7GlS9yo3dO/9S2OOrBV
	 uhXrVLWfg+MKBgNTxSjV/e/ym9xHd1+PwAEzDi/etT2wq59/t34+/vbqsmZmWuHmkt
	 yeZoowCpH2hgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54BE660AFF;
	Fri, 30 Oct 2026 14:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E25712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12625812D8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yISQUOOktHHK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D8EDC812B9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=s3KuUuRw7EM8b1kdpC/+Ro4YBIi0iACXQhx4007gfGqOMO311GKLW7ugtKYU5oSs3c++
 xeoZrgwo8ji4uC2k3VxHnFRAUGsH9yzs/ZPVePwvYgODE7u7h1PpaMbCAiaA++bNI25WU
 O1q0HYwERBnmYspLHjhXi1zpzA06MmxnnknK8c0yA8PyY5TkL2ifVgWlgL8NlwErZSRsc
 /DtItKwJgfKXoVXX9dWXn81OgnyXrexLuifhGjrP342FTtzkOiFBR+JPgQp4q+WmiWQmN
 7ynKr7CGI1ihqFt1hRvTO3s95u9Fj2N/BvHo6xu4Qm96umwbz5343EH/4ZdjB3qmpBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fik6SGeCaBZ4if4YlEshsZu690vDplg9OnMgwi3vLbY=;
 b=bwDCjAZ0dOdkSzUOa6UGgQk6jFkeT042fp/p0OtzzQxiTf/3bgpRV8t3pPCP4GO1uEZj
 7V/Wb7PQqsxMK9Nd9Ysd4/pxFDwBUtxf5zHTYOSMvd9UOM/DJDrSdqdXPOL+y3hKDX5SH
 HO+ZLfmBRPXLP8J61qJ+855VKLGbh1EWQe1N9CcyH04ZHejhDViB+LgVv4BzeR7MQQZ6B
 UqR5X17Y3qzYG9bdaLimZQ//3CYWE4jvi9BYGt3M6J6i7FXOiWSoMiBz9bvH0VQ8Fom5E
 puczrFX0Sd3/avpc5ZBGG7JulsIVJGlOMYJDlqT5pAxIUfDkI1VgZCiofCYX3cgT2Xg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8EDC812B9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0369F9C645; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b9d3e618ecd239a26fc99624ebdca19eeaa703bd
X-Git-Newrev: c5b485cf2491d3324818aee65495bedc257a53f1
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.0369F9C645@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/genrandconfig: add
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
Content-Type: multipart/mixed; boundary="===============6702135502010035184=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6702135502010035184==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5b485cf2491d3324818aee65495bedc257a53f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 8437d6342d..597602f257 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -252,7 +252,7 @@ async def fixup_config(sysinfo, configfile):
 
     if 'BR2_LINUX_KERNEL=y\n' in configlines and \
        'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
-        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
+        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
 
     if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \

--===============6702135502010035184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6702135502010035184==--
