Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF85CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC8C340675;
	Sun, 11 Oct 2026 13:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_gJdj3-Zet5; Sun, 11 Oct 2026 13:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C70624059E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724006;
	b=KiyJJV6swqi5rbEu1GSZvHbQhEejqHtDPnbZ5S1r/FmWAIOQe2VlHBldBd4CUL9g+5n3
	 hGwX6Qa9giYwhcRk+R04tGn0ppdmc7UuuHFmqWAFnhJx3ScXa1vNU/YS15cfYZ9zKvx59
	 ljXNUui4IaWHqJe7T8XKx9M7SEO3g891W4HfrWyP47rOOGDj8Q+U0JsgFMfWaFBMmJqHG
	 xitIskqsZskROZ6xZbscHW0q8TC8gAa61WpOxAPFqv7R/hUB1auK5Y/+K9yErRNqRUBfQ
	 3g7NVjCCwmOMjO68ii3MG15zB2rCwsPnNynpaVt2TFtv607okzjTj3x8Yy2pcL20Tng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vs4JcTy9i/s9F9QDXsQAo0apDu5Ztdnl7KL4wrJR3Xo=;
	b=dHtY2UTPA4+JBH4qeIQYLxtHcY+YvTVPLzemrpNl9nLvDvWNm12RztSm5pbSMpyzF2HY
	 c0n6ZjK3PkIXeLxqCAzzcK4gyU9TCuCTjGX5l4r0kr73N6W0TPbFXsNinzb5Kq+pvzYUa
	 dqWPwzpR0kTlylRrAIwus5gKTDVyFj17ZokOodIRXsVY0jhFA5XizHLlJ2OhyzFfO9+WN
	 rfOQI6JqVnrMIYDpdI/L4vaARhyqK/Vtawg1SMGLypMf+kXpdS3KmmoOschinTr3POJ6R
	 Cx1uRGlFS/rU3yNETaBuFtEv1fwqL87DKySsFRXjjKx6Y9N7tU+dG3Zsj0kymFg72Bg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724006;
	bh=vs4JcTy9i/s9F9QDXsQAo0apDu5Ztdnl7KL4wrJR3Xo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JM84W4BqVKRL0+yswkJIuWWH8F550wqYH+vTHGEUg2yx5vxcwO28KgITTN0mKfWMw
	 WQvTZy5BM4xWXnRzS0zqp9Q5abObpp1JcesIyV8eV37prtDVgfmhV7IMOAN/yO6mrG
	 lZVOrfL0vRlV5yRxR9E1IdbxPv+qfw+lgKIqdHFpccuvY1czhPSitHSqRbmuH8pBT6
	 bEc3SExhbxw4tfiGismCQKuVB5inlXyf//zgcMhZuwt0sxK0/AoWaa/VNRnWwUDrL9
	 zl2rTU3GJsBUpBUbVcZXiURybzxdCBXtFsDBxH5pnBd+rUvCVxjtEirpgmoX3wdOL5
	 uguzd1QLrlicw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70624059E;
	Sun, 11 Oct 2026 13:06:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C3C1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F71580D93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKyk3ZU2Qr0P for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7437980D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724004;
 b=mA7oDwjuxA5a6Cy32L+d2SCAtu1Ae1OnQW5RjyCIV8aXrJbMlvByGJQboT+K4E3+qGir
 SfjMRDUl/kw24lJ7/EiWfKaf8iRdc/K+bch8REKZy59T/SfZpn1oaJNdix/lEh2AKw+1C
 jSSjdO6xYDos5WzhYozijVhyNaMEvnszcZA/iua2bTGPGU3lTqt32+ippT+7pAeWJyVhw
 d2XoYXm9Z1K5i4Ao2Nqfw4epwIMnEe1LqTHe/4hpbOg3Mmx1GLpF3E7Tppyp9rrXyZwSn
 7lClA4cHsjOfhkftZDadD2W0n48MRIwswaO5r5VjCj7yWIiJ59/GqFu8fwvyxLWhffQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724004;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1MtoqvhvSbOuA0WPm0NpaNnsRky+ky8xv0u+fHdOwps=;
 b=JyrghnzEve5twNqrviYwxoujK42pxFx6oj5rxmgKWi5vuMyL0Fxc3KwTw/lQKrnfRxWj
 O81xDjCO3UdIMc6Dqc/MmTi6HO/Qxizu8FFVy3Knq8k4Mbr0/hmZPYd41CgB5alTLt7lq
 IU1tyq4OlG7hXJ9p7F5GCqpTLqXy5fheBw9pW27balH5m5tvF0K34PAx5Ta29Akc+WPgq
 v5va958fbOWhcKwBt/wC2semSUGT7ZS9VZ8CrTgtNXSHvkY035rM4RCmgHAiVWnvbFb9d
 9b7eE8LHJN3H4H15yTOUerrRk0CcXdVp6beMZmGkDLM1Q/Fstl1gTE/1qEnb7p3HtfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NTQxkTLp; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NTQxkTLp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7437980D91
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=1MtoqvhvSbOuA0WPm0NpaNnsRky+ky8xv0u+fHdOwps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NTQxkTLp4Na1ASUgZn0uGXMAtAe3xKie2hcDWM7TehEgDpF6Ey367pBoy5S+QliXI
 di05O3yuVYRjKj3LfnHSJQh5XHdEsefZG4wq8Ts0vuSvlZCmX2UlE0q0OcLb9fYXBb
 M3rc+q+yRUomoca4zhe09M1IN5bQxBdsFuPBOD7FmdSzaFoPvkPVMMkBqz10smlaPW
 PB0MS6w1a/C8frFXKuM+SFW9ddbKKvrc69xI7d047zAL0ve4ZRymC0uSVpDPfia3Eu
 mW5kw3SEK9Kb06wmwj8sN6zZ6rpKyXVEsTbCUf9ggq5FTc7RfM+W6RMLw6i2jpsz4X
 UsxlX+V3O68Jg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 gvm19urysA3n84ePqNKILU23BYAJGScW4U//3K2d+Cy4W8cON3S8LbW+uXRRocYWhkDdcnuuPJF
 FZowxyzw6X8BKc7OKHxmkFGBsLVEnvQdbFZEUN92a9EsbH0xIR7My6h21soTPHgiXdDs5AlXYmQ
 W/i3m1UekY+PoBuZDXbrX7O3ies4TgMqRO8Dc7/TrRDw/R0jKZVvnS35LpV+QAZgtpgo40oM+jZ
 yREdFX9lTrIBHrVi1H3kY02QAnMq6BVcFnl67v+fuT1+HVeAOBk1W3GiLo/UUT3PXrUKFikxdsd
 84xyMZuifJAQhiWBZGoSvpqnYVXUyv8CGMUkGzrP183bvQA9rOTYRj1lEl7EGAmEvVH1rhX3yPo
 /3TZj7Y8FbQgFOANl6GsJSBe6CGBZ+/UyoZNP8YSqT+GluLXj1DQZ9hVMPZhKkowPurub1icD9R
 TROFupDiv+DgPxDgCsq5D0p1KUbixytrBR9h+Zza9ooVzOOPwpydCCHL0yuYlJXCq/0slHd/E96
 Q7kdnHsm0iH6R+AShlO3cmo6GFpnoYYFRW9jPzSTMSy3KUbaYFsMRBZlR7PF4Jqawj8XT/NxIRV
 ZtfO7zluF9DZrHw4eJSYI13JgnwVtrU=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F44CA4C586E;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-35EO;
 Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Sun, 11 Oct 2026 15:00:31 +0200
Message-ID: <20261011130058.3443432-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v9 26/52] package/znc: Fix build with OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEPDqWRyaWMg
Q2jDqXBpZWQgPGNlZHJpYy5jaGVwaWVkQGdtYWlsLmNvbT4KLS0tCiAuLi4tRml4LWJ1aWxkLWVy
cm9yLXdpdGgtT3BlblNTTC00LTIwMjQucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uvem5jLzAwMDEtRml4LWJ1aWxkLWVycm9yLXdpdGgtT3BlblNTTC00LTIwMjQucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3puYy8wMDAxLUZpeC1idWlsZC1lcnJvci13aXRoLU9wZW5TU0wt
NC0yMDI0LnBhdGNoIGIvcGFja2FnZS96bmMvMDAwMS1GaXgtYnVpbGQtZXJyb3Itd2l0aC1PcGVu
U1NMLTQtMjAyNC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4x
ZGM3ZWIyOGZiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS96bmMvMDAwMS1GaXgtYnVpbGQt
ZXJyb3Itd2l0aC1PcGVuU1NMLTQtMjAyNC5wYXRjaApAQCAtMCwwICsxLDU3IEBACitGcm9tIDk0
YmNmOTE5ZTExNjM1NjRlNjM3ZGY4ZDQzNzU4NWJjN2I1NWU3YWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBSYXZpIEthbnQgU2hhcm1hIDxya3MxOTg2QGdtYWlsLmNvbT4KK0RhdGU6
IE1vbiwgMjkgSnVuIDIwMjYgMjA6MDM6MjcgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGJ1
aWxkIGVycm9yIHdpdGggT3BlblNTTCA0ICgjMjAyNCkKKworTW9yZSBkZXRhaWxzIGhlcmUgaHR0
cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz0xMTM4MzU2CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vem5jL3puYy9jb21taXQvOTRiY2Y5MTllMTE2
MzU2NGU2MzdkZjhkNDM3NTg1YmM3YjU1ZTdhYQorCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgorLS0tCisgc3JjL1NTTFZlcmlmeUhvc3QuY3BwIHwgNCArKy0t
Cisgc3JjL1V0aWxzLmNwcCAgICAgICAgIHwgNSArKysrLQorIDIgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL1NTTFZlcmlm
eUhvc3QuY3BwIGIvc3JjL1NTTFZlcmlmeUhvc3QuY3BwCitpbmRleCBjY2MyMDg5OC4uOTliMjE1
YmMgMTAwNjQ0CistLS0gYS9zcmMvU1NMVmVyaWZ5SG9zdC5jcHAKKysrKyBiL3NyYy9TU0xWZXJp
ZnlIb3N0LmNwcAorQEAgLTMwNiw4ICszMDYsOCBAQCB0eXBlZGVmIGVudW0geworIHN0YXRpYyBI
b3N0bmFtZVZhbGlkYXRpb25SZXN1bHQgbWF0Y2hlc19jb21tb25fbmFtZShjb25zdCBjaGFyKiBo
b3N0bmFtZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgWDUwOSogc2VydmVyX2NlcnQpIHsKKyAgICAgaW50IGNvbW1vbl9uYW1lX2xv
YyA9IC0xOworLSAgICBYNTA5X05BTUVfRU5UUlkqIGNvbW1vbl9uYW1lX2VudHJ5ID0gbnVsbHB0
cjsKKy0gICAgQVNOMV9TVFJJTkcqIGNvbW1vbl9uYW1lX2FzbjEgPSBudWxscHRyOworKyAgICBj
b25zdCBYNTA5X05BTUVfRU5UUlkqIGNvbW1vbl9uYW1lX2VudHJ5ID0gbnVsbHB0cjsKKysgICAg
Y29uc3QgQVNOMV9TVFJJTkcqIGNvbW1vbl9uYW1lX2FzbjEgPSBudWxscHRyOworICAgICBDT05T
VF9BU04xX1NUUklOR19EQVRBIGNoYXIqIGNvbW1vbl9uYW1lX3N0ciA9IG51bGxwdHI7CisgCisg
ICAgIC8vIEZpbmQgdGhlIHBvc2l0aW9uIG9mIHRoZSBDTiBmaWVsZCBpbiB0aGUgU3ViamVjdCBm
aWVsZCBvZiB0aGUgY2VydGlmaWNhdGUKK2RpZmYgLS1naXQgYS9zcmMvVXRpbHMuY3BwIGIvc3Jj
L1V0aWxzLmNwcAoraW5kZXggZWQyYzljODMuLjc0NGY2MWQxIDEwMDY0NAorLS0tIGEvc3JjL1V0
aWxzLmNwcAorKysrIGIvc3JjL1V0aWxzLmNwcAorQEAgLTEyOSw3ICsxMjksOCBAQCB2b2lkIENV
dGlsczo6R2VuZXJhdGVDZXJ0KEZJTEUqIHBPdXQpIHsKKyAgICAgc0VtYWlsQWRkciArPSAiQCI7
CisgICAgIHNFbWFpbEFkZHIgKz0gc0hvc3ROYW1lOworIAorLSAgICBYNTA5X05BTUUqIHBOYW1l
ID0gWDUwOV9nZXRfc3ViamVjdF9uYW1lKHBDZXJ0LmdldCgpKTsKKysgICAgWDUwOV9OQU1FKiBw
TmFtZSA9IFg1MDlfTkFNRV9uZXcoKTsKKysgICAgaWYgKCFwTmFtZSkgcmV0dXJuOworICAgICBY
NTA5X05BTUVfYWRkX2VudHJ5X2J5X3R4dChwTmFtZSwgIk9VIiwgTUJTVFJJTkdfQVNDLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgY2hhciopcExvZ05hbWUsIC0x
LCAtMSwgMCk7CisgICAgIFg1MDlfTkFNRV9hZGRfZW50cnlfYnlfdHh0KHBOYW1lLCAiQ04iLCBN
QlNUUklOR19BU0MsCitAQCAtMTM3LDcgKzEzOCw5IEBAIHZvaWQgQ1V0aWxzOjpHZW5lcmF0ZUNl
cnQoRklMRSogcE91dCkgeworICAgICBYNTA5X05BTUVfYWRkX2VudHJ5X2J5X3R4dChwTmFtZSwg
ImVtYWlsQWRkcmVzcyIsIE1CU1RSSU5HX0FTQywKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHVuc2lnbmVkIGNoYXIqKXNFbWFpbEFkZHIuY19zdHIoKSwgLTEsIC0xLCAwKTsKKyAK
KysgICAgWDUwOV9zZXRfc3ViamVjdF9uYW1lKHBDZXJ0LmdldCgpLCBwTmFtZSk7CisgICAgIFg1
MDlfc2V0X2lzc3Vlcl9uYW1lKHBDZXJ0LmdldCgpLCBwTmFtZSk7CisrICAgIFg1MDlfTkFNRV9m
cmVlKHBOYW1lKTsKKyAKKyAgICAgaWYgKCFYNTA5X3NpZ24ocENlcnQuZ2V0KCksIHBLZXkuZ2V0
KCksIEVWUF9zaGEyNTYoKSkpIHJldHVybjsKKyAKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
