Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63D0CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7454260E50;
	Sat,  3 Oct 2026 08:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rxZd7Q6sqxN; Sat,  3 Oct 2026 08:48:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9BAB860E51
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017305;
	b=ZmJkxlaM99gBJ6EJ9vdehNQDgrkh02NGhCaC/w2oHxGAoVcRM8L0Sf9ZFgWD0OeIUH8J
	 uuMhl6N859M4rsQj74i3Rq0hqYi/A2J+75WTBX4PnUbaU+1vFM8qUMVc/TjBhIdxyfMiV
	 HzyraNbPMRGA55cGL6u+dn+YchnqYbWGdVM/4euZUuLwXnZn2Y30xRnRh2hlsr8pQVy4J
	 939WvQ/a/EkNYlqRQPU8t3EEc++7+jVK7vUjWRCAL1VUqRwH11dwVElhUjiNqdIgkybsL
	 0S1X7hsmQn2CrsFObLjTGdc2zOIZ6WJRpWiTw/jkY9rHcw0qNJYqjz6Gn4xdOn4jBuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OJg4s6dTN5Z68jqF/zAEq9TbpCPIePC6L2Kwj27EY6U=;
	b=oIJEOJXE/yxbpY0y+BqyrIxvA4agjZB086IeVeP/B9GgxsR1KWE2ahpNBrw9598Ag1vF
	 yS+D52oNr5ZH6kXgcQEE0loQiUCE6hZFaT9DiEZTkhLIG3TjHLKn9r/Ajhvfk/3H95cyR
	 wzUYyPASC9eYPbYaD+jwRJ9KZLdVDEw/FZsgrTMmqjqk8SFmRv2yiWZhTx+i8RjvHD2T7
	 42AV2U0ljMBKqPRmH8IINlAcfYWCeeGv4QTLcTxiq6ydF7dev8pwCh0QRKH3twgMh1G6V
	 r5zoWNC7FyFahseSad5523+V9ndNcUXnS2A6f9pc5Zd6WD7ZQPdqYbswUS3vwzlXYWQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017305;
	bh=OJg4s6dTN5Z68jqF/zAEq9TbpCPIePC6L2Kwj27EY6U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BDDtba+YAJXll6Sl7kMH9GJaZU7F8riwzHFV6Fa4t4JjGIZomwZa3TfFEn1i/nzEe
	 gNl7D86zYs/qGlSXXo0Cgp/po4arEchId9nTkc4uducbDUVduPqwdipG5VmqKT+01g
	 dlyHHmM5rcngl8yGUR8bstxDlEA6lL/txwMaOPNFZ+IwNxy8E0bbPxD8jkJHSRYmQl
	 TzHp6Qjsm0zLfdX4ei6UP6oveESJilUb/VLA/TLkGlWjPRRVGo6Rm5nLiVt4G7R0kD
	 Z8ilb561wyCtsw+P+DUxlkizrwFWgZW896PZkt9VoDQPX2BXyUuw/4Wn4fcRZ0CAJv
	 8rUEEG+4bSifA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BAB860E51;
	Sat,  3 Oct 2026 08:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7280332F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F80F40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxB0T1-yYVew for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:48:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4C53340059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017287;
 b=ANOiU5RK7rQQXp93cQDUNjlLE+I0/Fsomoud7r8f/mj0+nnbWsIHakf1Hg9ImdFuj9zH
 i/lxd/OH6IWejeY36klbRlqQPV+5eOZPQTbIyMDuclPcn1GEwlMVqvbSBhbd///XDQqaZ
 f46lZ49ZlEbmudcrGEyewStVDQEUudFIuihpS3zcYOOrFj09NOYbDfz2/U72iHJDqKNb4
 MPC1f5lSk/V6Cwzr0+t3/sdvS6Rq25rZyPxSrt/ZyPqkLHSkwyLSNHDLYkrwWZBymUepK
 wkXW0usN9ysvTTqlN6qJJ6jXhOFjxjRSAkBRPH9VQE+9WhMVYvgmHH80rrJcDqQqWMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017287;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KECgK9J33ezWnchW775YeYc/nRNCDtTMIbOA0Gxe+Ms=;
 b=Yw4cbZxkAdWmgOjXgKCxZfj5Ejo+qagnPL0PehQ5JZE3iukVQA0/bVWsLWnAqbf80zWi
 9GbCWlRzMkASC2aOaQVXzTmuZMkfniubDndaFkLBRqSXGMQ1+VpaDebcvgpDOzNSLmwSj
 FW3yzk7GHB6eLva+82WHX1pdzd5bQmBFPuUmLmu8okEJ50X/yAggnt78/sGDLL8FtfNOy
 5LDq56/s4ofjfykTQNx2bfaMVXZeAE6o0KJ8oYcxX/kIKhJH9VOFpwyaoIWHYCNwx/9iG
 FEN8M0jUsvDez+Ps+XKucU/bZ6j/uyLQnN0HmnWgCb1nVZNFGSSLLLKw98DNWksPUAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PtPrhC9A; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PtPrhC9A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C53340059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791017284;
 bh=KECgK9J33ezWnchW775YeYc/nRNCDtTMIbOA0Gxe+Ms=;
 h=From:To:Cc:Subject:Date:From;
 b=PtPrhC9AkD6nHCi6I0KzvPLS53vwjhXWwWIlnIJia1d1nBk33NFua2859XGe0puOw
 LM4+n2Hl6snditrWK3OYzcrvrP+lDeiktSwNCLDJqJ58e85m82e5DsHtd29GA3r21b
 67Ah+9Cnfs88fyNYQmFZyyKLJ5Q1o3k5qFuLLl6IT959fSHHJkn0aLgi4f7840Iedr
 NT6/PTXI++gGqa1K0GT9vdV8xZ1jlwav5lSJ2v2rIt1/SazHBI0Kgt+x6Ug2hjgbXq
 ZjmmdVG6WNDrESWIw2ap95Ck5qvx8gzX6BWZm/nIn6wx0+SPYPNej+LJ/30JnlWES+
 mVc3yiBMtBzpw==
X-KAS-Sym: v3:f51bdf72230551df:ovjtVWi/4YQWIzAORb+3fcoyG8FQpBhWNV7oAw9NtEbMd
 wg35e3TSUqmSXtrtB2Nug8L3nK3h+2wDnWaGdT3QdcvZmsHSa/Sh+dXK5qu9I+1sdE1HLrIwdMc
 DX2wOZdLu+yfWxEOnB/kZNFBGLZoNAX+5qRbTUeyyMsAtJ7phNaj+bNW3Ulm+eI3B6a6wBle6oH
 TFJjWZRzAdUCyOzofK8mBuHorvC6HjesIVO8n6v5aQA7kX/k0hmkIGOnebyxiUuM9BDCyIKYTov
 1SBvVPWLMepqgaxQUXcX/PBn7fV6l2PRGMIzVG+bDqusGGWwckWNt2Pcw+8HSMJY+RRu5apw==:
 Litxh2YWVzaW+63EFKqNfCjtwGUs8GNPUpEk7SA8+t7SL8APiOfqhs1f7+6Ur/8/zgj5GRgMbYe
 5x1d0Gq2jUfkuoSTS8P3TNlEyPzp+Hn1JOJQRQUCDCYWuj9ALpno4ca9TjNRHN9mDkGlsP3VNee
 cZRsk68Te1L/EwHKNu2kaFkNRk3jkM4TwITHhuOCPwgtlBUV/IwGVPmOTibUShpbHx/nCZxa+jv
 7l2MHFPRAm4ariyaM1o9Dow++0bfYo3vPViuxTRTJodehYImB9gxqJIaKuwMX9YZgOV8Me0xiLI
 HtymzUs0u1viwIITpxQ10flNnlat6w3KishyvOgPPrwyudkLpaatRTU/jIwITS6Nq9nqR4stru/
 R5SY7xwbS8LljOIg0XHU7W1nb8Kk1dA7xynx6jvhQq2zjLk+SOjEssgBwjl4WIauTYUlbeoRVn/
 TzZ/+v5x0pfWJnE4BRJL+Qxnhjye1XyyHAGlHFBekeWVcJ31RkJd+IJ8/k+7ONCDtInDAI+37Db
 muh5KPU/ztn+DnZyYyHSGuIINWKKYEfY2ZJ90tH0DEbRLxWNl0fBoeG2RkqHDs5KlrDIX6G0vte
 bwwrQp8x1S8CMcwIXFm28TyTOqx6YAwHhbzjZoYo/azRRuhaOGUbJEcezLoatQE=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1255A4C53C3;
 Sat,  3 Oct 2026 10:48:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55886)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCvPY-0000000015I-2NGE;
 Sat, 03 Oct 2026 08:48:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 10:48:04 +0200
Message-ID: <20261003084804.2462501-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/python-logbook: bump version to
 1.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/getlogbook/logbook/blob/1.10.1/CHANGES

Updated license hash due to upstream commit
https://github.com/getlogbook/logbook/commit/963dd98736ae223f4f19028d19cc4fc3b5bcb4bf

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index ee812562ea..c308309cd3 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  07d53ef8b7cb1f267862f72df81857c9d6665104535cc5309774de7966164c46  python-logbook-1.9.2-cargo6.tar.gz
+sha256  b9c6fb8f13d295864342a02ec7256a989dbf786370cb5d84e7a259908b2b7b9c  python-logbook-1.10.1-cargo6.tar.gz
 # Locally computed sha256 checksums
-sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
+sha256  5187d311b2de7c67ce4ae6067c36eb62c5c87ff617d0a772ddaa27ef721f0a13  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 2bcd48bc2f..dcb6808a61 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.9.2
+PYTHON_LOGBOOK_VERSION = 1.10.1
 PYTHON_LOGBOOK_SOURCE_PYPI = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/f2/cf/e39c249003caaa7f84e2b00c11c7423892d525f8136ff349f9914914a744
+PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/75/73/2998c9192466f93a63d325866d7c3e3800403ccc49ba9f7dc6bd89963873
 PYTHON_LOGBOOK_SITE = $(PYTHON_LOGBOOK_SITE_PYPI)/$(PYTHON_LOGBOOK_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools-rust
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
