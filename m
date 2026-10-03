Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AA0CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C6FC814C8;
	Sat,  3 Oct 2026 18:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzSeSk4qx2BS; Sat,  3 Oct 2026 18:40:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81C49814C0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052819;
	b=hhLHwwHyAWZkzs83UWhZf++5hsobK6/Aq62vEw7YwXqNVeG48EpQIw5ZGPbzKJJg23qV
	 kzebYdfszfKWMCOQIWzCFZejy0uoOx5s7a6j5UQn//NJufDDrEm0rgWehfynUQBaS/DW3
	 UDVfed4czB4BhMGwkcdt/rmY9EurwxEdJEbzGfWUt1mgxNHJHe/IejaKzVtacUil/iinz
	 tTAISLCklWLSIWjvWHxQU4B5JTvrr3Gyq04GIYxXRfqpEv0+k98w+35eLS2vOrE+vAt1a
	 65vBOnwbAZAd03pwifHa9So/M3Qkr09ce1JWwrxcmAglqPSi+4Leo9b0n1dgIRWKO7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3rK+NNiHbqQBY14EoyDMB6n5J6ANZNAbuwT5u8TBKrk=;
	b=pS6bsq5/9FYDqe0crFHKagaleYnDFjc9yhl8z2Cj0ZGoic5qR9OfjVneDTO874FdtJYD
	 /kxuKDSZLtwO9QC4A7ZL7RAucel7yX7CTzaxkgKJnpPsrMHLQv3LUSMvMV85qirqY60UD
	 GxGDcdZQwZDZ+I0qYO3pBJc3znvJTMrF9g0xGY8WGnNIa7qs0GN8cNrHPf9bmxbuj74ce
	 qtr74CPteZfFjFFd6AkDIFyrgUVJ4xtJywB0fSrJoB/LCxt8hq1zT6KMKfURMLkU4677u
	 89ToxZsU9kRkK5jTsY/DNszpWLq8r4+W0rqN2pGpG9o9QWIRm75rKkLIuNpbDKWv1yw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052819;
	bh=3rK+NNiHbqQBY14EoyDMB6n5J6ANZNAbuwT5u8TBKrk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GL2uJA/wu8VCRnUbWEFWee5UxpuHFvUQDACo1eRUeiA3wpsBhQnve0EnvVpjmMJRV
	 zNO+DlIfbqPqpnfP49GjjD8C87XH1inbjUAIqTWNvaQPoJ7pBnBL9r4zerRMQwQeMR
	 HpflHsrnzgbCobZSc/fBv/l5/Vu/npW5MmWdbdtVFrSAktkkzcZTtxbsQqIz+/IX/Y
	 B7TxrNyk6pF0MVt0AANrPtiGfb/yHq5xve/OMmW0WmroeRatovqAlB9N7v1Z5c+2MC
	 t4qc+Alngu/o1P1WUOoKQyoQkdzlNZlP5sZEbOuuQn1RsADH5uNGQd8hdh5SRlaeHX
	 im1Q9N6GQSnOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81C49814C0;
	Sat,  3 Oct 2026 18:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB73D1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D4F440EE6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbuT3jtRd_Lv for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:40:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F2C2540EDF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052818;
 b=RnCUl4F9e1TUGj/YOusgS2DyC/uuu0TpcRbKfWgKSbxcggEwMRMTr4fvFQ5Xwc+z0yb1
 vlxCC8e8hD3mlDU8hFTkjGfJdK+i6MvvZ05kESQSwfi8JOYzbQndM8IZCT6rx3JRMfgwj
 KVi4KUl1ARoUuA5g3TZvRE4nlHu9k5A+icTduZhpjbQai76YIHzBAdZI1ZHgCkjVx4LTa
 U5+fUQziAJmOOMqtqI8MTIXuWRq9Z35kZ0Mi0jFLiSzBbgwcy3qasZtIJopHfv+Yeeg0h
 pb6G24W18asGMPFF1HwJUGd9lBn5xIRGiJl6g+2jtEduKbkS6M4YDEwieh3TGH0S5GA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052818;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KuTM/PT3u/sL1yO/DzPLp+wSRC7iyK5vK6ACB9LsDk4=;
 b=LwjMuU9ieV/SR0ndNFOkVQVsJFjNtrkW8SlXac8m79Y1IRM2CjI34F/udqKNQyDTgwKf
 7jye9oIuR12PhPxC1J+DyWxTKTfetXvmVRkH1BBUhrLPZHXTC5zCcfadQBPhEDscANF6h
 SDy/OaCfpBdopGHvoTOkJkyvFi1QVvqEEHLvJjf8mtFbpt/qQKXel69vidiZ+D9C6fU8R
 VLUPKkNRk44mM2Q0Q7VNmIK0FGvqyKAknh0PmsOaZlntFzvz36uWRK6/2DVutZFUWVqCd
 WNhqnec+9OB4y9HARP+TOPxIAwXGBIwjjHM30kvi1F4lZtGyLt2Z2Uf/ehUExb9aVsw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C2540EDF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C04A88D3E; Sat,  3 Oct 2026 18:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 20:39:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b174bfd0b29b8ad81b4e583c022aa6449a6f237c
X-Git-Newrev: 569b91bada811b822d9eba59c8af16169c4b2783
X-Patchwork-Hint: ignore
Message-Id: <20261003183903.0C04A88D3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: switch chrony.service to
 Type=notify
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/569b91bada811b822d9eba59c8af16169c4b2783
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since 4.7, chronyd implements the systemd notify protocol natively
(upstream commit cb11184, "main: add support for systemd
notification"): it sends READY=1 to $NOTIFY_SOCKET once fully
initialised and ready to accept commands.

Type=simple cannot observe that signal. systemd marks the unit active
as soon as the process starts, before chronyd is ready, and gpsd may
follow immediately: its drop-in br-chrony.conf orders it only with
After=chrony.service.

Switch to Type=notify so the ordering holds. chronyd's -n mode
(don't detach) suits Type=notify, and no libsystemd dependency
is added.

Fixes: 6c80b71c8c661ce62cfa800ed558dba31baa5dbb ("package/chrony: bump to version 4.7")
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chrony/chrony.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
index 210122cf5d..2d619dd6da 100644
--- a/package/chrony/chrony.service
+++ b/package/chrony/chrony.service
@@ -8,6 +8,7 @@ Conflicts=systemd-timesyncd.service
 # correct time to work, but we likely won't acquire that without NTP. Let's
 # break this chicken-and-egg cycle here.
 Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
+Type=notify
 ExecStart=/usr/sbin/chronyd -n
 Restart=always
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
