Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF2D74963
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 05:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1431C40144;
	Wed, 30 Oct 2024 05:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HCtL3xasVhd; Wed, 30 Oct 2024 05:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E586340147
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E586340147;
	Wed, 30 Oct 2024 05:11:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2770B494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 05:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 153D440144
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 05:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYrwZXwR7k79 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 05:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.169;
 helo=cvsmtppost37.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FA2C40110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA2C40110
Received: from cvsmtppost37.nm.naver.com (cvsmtppost37.nm.naver.com
 [114.111.35.169])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FA2C40110
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 05:11:20 +0000 (UTC)
X-Originating-IP: 125.132.232.68
X-Works-Smtp-Source: mXnqKogqFqJCpNm/FqMZWHF0
Received: from cvsendbo001.nm ([10.112.18.53])
 by cvsmtppost37.nm.naver.com with ESMTP id LgznziUZQmWHJkortKPmgg
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 05:11:18 -0000
X-Session-ID: d11db46559d5913c8fa55c6c4472bbf6b7d993c67acf49daaad494309c1202a9
MIME-Version: 1.0
Message-ID: <516a3de7501283e67b1fa11e1a255a5b@cweb008.nm>
Date: Wed, 30 Oct 2024 14:11:18 +0900
From: =?utf-8?B?Q0hFUk5JQUVWIEFORFJFSQ==?= <dungeonlords789@naver.com>
In-Reply-To: <CAOrEah7eaaeMDJc882HtW=NQp-SpWMSVDO+OqyYYhmAbL+YnTQ@mail.gmail.com>
References: <20241029125847.1300382-1-dungeonlords789@naver.com>
 <CAOrEah7eaaeMDJc882HtW=NQp-SpWMSVDO+OqyYYhmAbL+YnTQ@mail.gmail.com>
Importance: normal
To: =?utf-8?B?VmluY2VudCBGYXppbw==?= <vfazio@gmail.com>
Cc: <buildroot@buildroot.org>,
 =?utf-8?B?QW5kcmVpQ2hlcm5pYWV2?= <dungeonlords789@yandex.ru>,
 =?utf-8?B?Q2hlcm5pYWV2IEFuZHJlaQ==?=
 <27889022+AndreiCherniaev@users.noreply.github.com>
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: EeYdjAIYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730265078; bh=sCTI2600jXKzH/vLW5fnUwjhOWBbf18hGvZYukeagLE=;
 h=Message-ID:Date:From:To:Subject:From:Subject:Feedback-ID:
 X-Works-Security;
 b=ZHU4FNUAZjRhDRxVpOqsSPh7k73fqvcHIm00Zq9dcmsMkbVBLnwwnLzjgOTUnVcG8
 Mm1SlybeCO5M8xKgG0gEXgzfc68INUClcQKHJZn7nFIBMJxwCmwMMo6//ARWrhVX+G
 KXVoqATaFuPnSworkjFnl9REgZqdTTLpKETNgqP8YS/nxRt9OzOYKd8vEo//11CjmI
 iMWj5M3J4SzK8NuwHfQSYGiaqg5C2McZs9+jv6JTl3XUQqY/cXGCGw+3IhJdijnlLL
 D1gktCCjg4w1YRjChGEZ+oeeLELuPfI3+KSxX+bcNuFxSbhG6FT15f91qZcqeZggwz
 0xKbwcyA11Img==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=ZHU4FNUA
Subject: Re: [Buildroot] 
	=?utf-8?q?=5BPATCH_1/1=5D_arch/Config=2Ein=2Ex86=3A_?=
	=?utf-8?q?sync_prompt_and_help_with_Linux_for_Geode_CPU?=
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
Content-Type: multipart/mixed; boundary="===============6704295026813143801=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6704295026813143801==
Content-Type: multipart/alternative;
	boundary="-----Boundary-WM=_7f31d8ffb700.1730265078690"

-------Boundary-WM=_7f31d8ffb700.1730265078690
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbHNvIGxpa2UgIkFNRCBHZW9kZSIgYnV0IEkgdGhpbmsgd2Ugc2hvdWxkIHN5bmMgd2l0aCBM
aW51eC4gQmVjYXVzZSBpbiBmYWN0IHlvdSBzaG91bGQgc2V0IENQVSB0d2ljZSwgaXNuJ3QgaXQ/
IEZpcnN0IGluIGJ1aWxkcm9vdCBjb25maWcgIChCUjJfeDg2X2dlb2RlKSBhbmQgdGhlbiBpbiBM
aW51eCBjb25maWcgW0NPTkZJR19NR0VPREVfTFhdKGh0dHBzOi8vY2F0ZWVlLm5ldC9sa2RkYi93
ZWItbGtkZGIvTUdFT0RFX0xYLmh0bWwpLiBJbWFnaW5lIHVzZXIgZXllcyB3aGVuIGhlIG1ldCBk
aWZmZXJlbnQgbmFtaW5nLi4uClZpbmNlbnQgRmF6aW8sIGRvIHlvdSBwbGFuIHRvIGNvbW1pdCB0
byB0aGUgTGludXgga2VybmVsIHRvIGNoYW5nZSBwcm9tcHQgZnJvbSAiR2VvZGUgR1gvTFgiIHRv
ICJBTUQgR2VvZGUiPwoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogIlZpbmNlbnQg
RmF6aW8iPHZmYXppb0BnbWFpbC5jb20+ClRvOiAiQ2hlcm5pYWV2IEFuZHJlaSI8ZHVuZ2Vvbmxv
cmRzNzg5QG5hdmVyLmNvbT47CkNjOiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+OyAiQW5kcmVp
Q2hlcm5pYWV2IjxkdW5nZW9ubG9yZHM3ODlAeWFuZGV4LnJ1PjsgIkNoZXJuaWFldiBBbmRyZWki
PDI3ODg5MDIyK0FuZHJlaUNoZXJuaWFldkB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+OwpTZW50
OiAyMDI0LTEwLTI5ICjtmZQpIDIyOjEyOjQ4IChHTVQrMDk6MDApClN1YmplY3Q6IFJlOiBbQnVp
bGRyb290XSBbUEFUQ0ggMS8xXSBhcmNoL0NvbmZpZy5pbi54ODY6IHN5bmMgcHJvbXB0IGFuZCBo
ZWxwIHdpdGggTGludXggZm9yIEdlb2RlIENQVQoKCgpPbiBUdWUsIE9jdCAyOSwgMjAyNCwgMjE6
NTggQ2hlcm5pYWV2IEFuZHJlaSA8ZHVuZ2VvbmxvcmRzNzg5QG5hdmVyLmNvbT4gd3JvdGU6CgpG
cm9tOiBBbmRyZWlDaGVybmlhZXYgPGR1bmdlb25sb3Jkczc4OUB5YW5kZXgucnU+CgpMaW51eCBr
ZXJuZWwgZm9yIEFNRCBHZW9kZSBDUFUgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4
L2Jsb2IvZTQyYjFhOWEyNTU3YWE5NGZlZTQ3ZjA3ODYzMzY3NzE5ODM4NmE1Mi9hcmNoL3g4Ni9L
Y29uZmlnLmNwdSNMMjMyCgpTaWduZWQtb2ZmLWJ5OiBDaGVybmlhZXYgQW5kcmVpIDwyNzg4OTAy
MitBbmRyZWlDaGVybmlhZXZAdXNlcnMubm9yZXBseS5naXRodWIuY29tPgotLS0KIGFyY2gvQ29u
ZmlnLmluLng4NiB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluLng4NiBiL2FyY2gvQ29uZmln
LmluLng4NgppbmRleCBmOWIzMjEzMGIyLi40ZjI2ODJlYjc0IDEwMDY0NAotLS0gYS9hcmNoL0Nv
bmZpZy5pbi54ODYKKysrIGIvYXJjaC9Db25maWcuaW4ueDg2CkBAIC02ODIsMTAgKzY4MiwxMiBA
QCBjb25maWcgQlIyX3g4Nl96ZW40CiAgICAgICAgc2VsZWN0IEJSMl9YODZfQ1BVX0hBU19BVlg1
MTIKICAgICAgICBzZWxlY3QgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEzCiBjb25maWcg
QlIyX3g4Nl9nZW9kZQotICAgICAgIGJvb2wgIkFNRCBHZW9kZSIKKyAgICAgICAgYm9vbCAiR2Vv
ZGUgR1gvTFgiCgoKCkkgdGhpbmsgSSBwdXQgdGhlIG1lbnRpb24gb2YgQU1EIGhlcmUgdG8gc3Bl
Y2lmaWNhbGx5IGF2b2lkIGNvbmZ1c2lvbiB3aXRoIG90aGVyIEdlb2RlLWxpa2UgdGFyZ2V0cy4g
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMzA4MDEyMTE3NTkuNDVDQTQ4
NDA0NEBidXN5Ym94Lm9zdW9zbC5vcmcvVC8KCkFzIG9wcG9zZWQgdG8gcHV0dGluZyBpdCBpbiB0
aGUgaGVscCB0ZXh0LiAKCkltIG5vdCBzdXJlIHdoYXQgdGhpcyBwYXRjaCBpcyBjbGFyaWZ5aW5n
IGV4YWN0bHkuIAoKCgoKICAgICAgICBkZXBlbmRzIG9uICFCUjJfeDg2XzY0CiAgICAgICAgc2Vs
ZWN0IEJSMl9YODZfQ1BVX0hBU19NTVgKICAgICAgICBzZWxlY3QgQlIyX1g4Nl9DUFVfSEFTXzNE
Tk9XCisgICAgICAgIGhlbHAKKyAgICAgICAgICBTZWxlY3QgdGhpcyBmb3IgQU1EIEdlb2RlIEdY
IGFuZCBMWCBwcm9jZXNzb3JzLgogY29uZmlnIEJSMl94ODZfYzMKICAgICAgICBib29sICJWaWEv
Q3lyaXggQzMgKFNhbXVlbC9FenJhIGNvcmVzKSIKICAgICAgICBkZXBlbmRzIG9uICFCUjJfeDg2
XzY0Ci0tCjIuNDMuMAoKCg==

-------Boundary-WM=_7f31d8ffb700.1730265078690
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHN0eWxlPnB7bWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHg7fTwv
c3R5bGU+PC9oZWFkPjxib2R5PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4OyBmb250LWZhbWls
eTpHdWxpbSzqtbTrprwsc2Fucy1zZXJpZjsiPjxkaXY+SSBhbHNvIGxpa2UgIkFNRCBHZW9kZSIg
YnV0IEkgdGhpbmsgd2Ugc2hvdWxkIHN5bmMgd2l0aCBMaW51eC4gQmVjYXVzZSAKaW4gZmFjdCB5
b3Ugc2hvdWxkIHNldCBDUFUgdHdpY2UsIGlzbid0IGl0PyBGaXJzdCBpbiBidWlsZHJvb3QgY29u
ZmlnJm5ic3A7IChCUjJfeDg2X2dlb2RlKQphbmQgdGhlbiBpbiBMaW51eCBjb25maWcgW0NPTkZJ
R19NR0VPREVfTFhdKDxhIGhyZWY9Imh0dHBzOi8vY2F0ZWVlLm5ldC9sa2RkYi93ZWItbGtkZGIv
TUdFT0RFX0xYLmh0bWwiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIi
Pmh0dHBzOi8vY2F0ZWVlLm5ldC9sa2RkYi93ZWItbGtkZGIvTUdFT0RFX0xYLmh0bWw8L2E+KS4g
SW1hZ2luZSB1c2VyIGV5ZXMgd2hlbiBoZSBtZXQgZGlmZmVyZW50IApuYW1pbmcuLi48YnI+Vmlu
Y2VudCBGYXppbywgZG8geW91IHBsYW4gdG8gY29tbWl0IHRvIHRoZSBMaW51eCBrZXJuZWwgdG8g
Y2hhbmdlIHByb21wdCBmcm9tICJHZW9kZSBHWC9MWCIgdG8gIkFNRCBHZW9kZSI/PC9kaXY+PGRp
dj48YnI+PC9kaXY+PHAgc3R5bGU9ImZvbnQtc2l6ZToxMHB0O2ZvbnQtZmFtaWx5OnNhbnMtc2Vy
aWY7cGFkZGluZzowIDAgMCAxMHB0Ij48c3Bhbj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTwv
c3Bhbj48YnI+PGI+RnJvbTo8L2I+ICJWaW5jZW50IEZhemlvIiZsdDt2ZmF6aW9AZ21haWwuY29t
Jmd0OyA8YnI+PGI+VG86PC9iPiAiQ2hlcm5pYWV2IEFuZHJlaSImbHQ7ZHVuZ2VvbmxvcmRzNzg5
QG5hdmVyLmNvbSZndDs7IDxicj48Yj5DYzo8L2I+ICZsdDtidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZyZndDs7ICJBbmRyZWlDaGVybmlhZXYiJmx0O2R1bmdlb25sb3Jkczc4OUB5YW5kZXgucnUmZ3Q7
OyAiQ2hlcm5pYWV2IEFuZHJlaSImbHQ7Mjc4ODkwMjIrQW5kcmVpQ2hlcm5pYWV2QHVzZXJzLm5v
cmVwbHkuZ2l0aHViLmNvbSZndDs7IDxicj48Yj5TZW50OjwvYj4gMjAyNC0xMC0yOSAo7ZmUKSAy
MjoxMjo0OCAoR01UKzA5OjAwKTxicj48Yj5TdWJqZWN0OjwvYj4gUmU6IFtCdWlsZHJvb3RdIFtQ
QVRDSCAxLzFdIGFyY2gvQ29uZmlnLmluLng4Njogc3luYyBwcm9tcHQgYW5kIGhlbHAgd2l0aCBM
aW51eCBmb3IgR2VvZGUgQ1BVPGJyPjxicj48L3A+PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxi
cj48ZGl2PjxkaXYgZGlyPSJsdHIiPk9uIFR1ZSwgT2N0IDI5LCAyMDI0LCAyMTo1OCBDaGVybmlh
ZXYgQW5kcmVpICZsdDs8YSBocmVmPSJtYWlsdG86ZHVuZ2VvbmxvcmRzNzg5QG5hdmVyLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciBub29wZW5lciI+ZHVuZ2VvbmxvcmRzNzg5
QG5hdmVyLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBzdHlsZT0ibWFy
Z2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFl
eCI+RnJvbTogQW5kcmVpQ2hlcm5pYWV2ICZsdDs8YSBocmVmPSJtYWlsdG86ZHVuZ2VvbmxvcmRz
Nzg5QHlhbmRleC5ydSIgcmVsPSJub3JlZmVycmVyIG5vb3BlbmVyIiB0YXJnZXQ9Il9ibGFuayI+
ZHVuZ2VvbmxvcmRzNzg5QHlhbmRleC5ydTwvYT4mZ3Q7PGJyPgo8YnI+CkxpbnV4IGtlcm5lbCBm
b3IgQU1EIEdlb2RlIENQVSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGlu
dXgvYmxvYi9lNDJiMWE5YTI1NTdhYTk0ZmVlNDdmMDc4NjMzNjc3MTk4Mzg2YTUyL2FyY2gveDg2
L0tjb25maWcuY3B1I0wyMzIiIHJlbD0ibm9yZWZlcnJlciBub29wZW5lciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL2U0MmIxYTlhMjU1N2Fh
OTRmZWU0N2YwNzg2MzM2NzcxOTgzODZhNTIvYXJjaC94ODYvS2NvbmZpZy5jcHUjTDIzMjwvYT48
YnI+Cjxicj4KU2lnbmVkLW9mZi1ieTogQ2hlcm5pYWV2IEFuZHJlaSAmbHQ7PGEgaHJlZj0ibWFp
bHRvOjI3ODg5MDIyJTJCQW5kcmVpQ2hlcm5pYWV2QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbSIg
cmVsPSJub3JlZmVycmVyIG5vb3BlbmVyIiB0YXJnZXQ9Il9ibGFuayI+Mjc4ODkwMjIrQW5kcmVp
Q2hlcm5pYWV2QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbTwvYT4mZ3Q7PGJyPgotLS08YnI+CiZu
YnNwO2FyY2gvQ29uZmlnLmluLng4NiB8IDQgKysrLTxicj4KJm5ic3A7MSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKTxicj4KPGJyPgpkaWZmIC0tZ2l0IGEvYXJj
aC9Db25maWcuaW4ueDg2IGIvYXJjaC9Db25maWcuaW4ueDg2PGJyPgppbmRleCBmOWIzMjEzMGIy
Li40ZjI2ODJlYjc0IDEwMDY0NDxicj4KLS0tIGEvYXJjaC9Db25maWcuaW4ueDg2PGJyPgorKysg
Yi9hcmNoL0NvbmZpZy5pbi54ODY8YnI+CkBAIC02ODIsMTAgKzY4MiwxMiBAQCBjb25maWcgQlIy
X3g4Nl96ZW40PGJyPgombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgc2VsZWN0IEJSMl9YODZf
Q1BVX0hBU19BVlg1MTI8YnI+CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBzZWxlY3QgQlIy
X0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEzPGJyPgombmJzcDtjb25maWcgQlIyX3g4Nl9nZW9k
ZTxicj4KLSZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2Jvb2wgIkFNRCBHZW9kZSI8YnI+Cism
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgYm9vbCAiR2VvZGUgR1gvTFgiPGJyPjwvYmxvY2tx
dW90ZT48L2Rpdj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRv
Ij48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkkgdGhpbmsgSSBwdXQgdGhlIG1lbnRpb24gb2Yg
QU1EIGhlcmUgdG8gc3BlY2lmaWNhbGx5IGF2b2lkIGNvbmZ1c2lvbiB3aXRoIG90aGVyIEdlb2Rl
LWxpa2UgdGFyZ2V0cy4mbmJzcDs8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj48YSBocmVmPSJodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAy
MzA4MDEyMTE3NTkuNDVDQTQ4NDA0NEBidXN5Ym94Lm9zdW9zbC5vcmcvVC8iIHRhcmdldD0iX2Js
YW5rIiByZWw9Im5vcmVmZXJyZXIgbm9vcGVuZXIiPmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1
aWxkcm9vdC8yMDIzMDgwMTIxMTc1OS40NUNBNDg0MDQ0QGJ1c3lib3gub3N1b3NsLm9yZy9ULzwv
YT48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5BcyBvcHBv
c2VkIHRvIHB1dHRpbmcgaXQgaW4gdGhlIGhlbHAgdGV4dC4mbmJzcDs8L2Rpdj48ZGl2IGRpcj0i
YXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5JbSBub3Qgc3VyZSB3aGF0IHRoaXMgcGF0
Y2ggaXMgY2xhcmlmeWluZyBleGFjdGx5LiZuYnNwOzwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+
PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2
PjxkaXYgZGlyPSJhdXRvIj48ZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IGRlcGVuZHMgb24gIUJSMl94ODZfNjQ8YnI+CiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyBzZWxlY3QgQlIyX1g4Nl9DUFVfSEFTX01NWDxicj4KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IHNlbGVjdCBCUjJfWDg2X0NQVV9IQVNfM0ROT1c8YnI+CismbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaGVscDxicj4KKyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgU2VsZWN0IHRoaXMgZm9yIEFNRCBHZW9kZSBHWCBhbmQgTFggcHJvY2Vzc29y
cy48YnI+CiZuYnNwO2NvbmZpZyBCUjJfeDg2X2MzPGJyPgombmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgYm9vbCAiVmlhL0N5cml4IEMzIChTYW11ZWwvRXpyYSBjb3JlcykiPGJyPgombmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgZGVwZW5kcyBvbiAhQlIyX3g4Nl82NDxicj4KLS0gPGJyPgoy
LjQzLjA8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjwvZGl2PgoKCgo8L2Rpdj48
L2JvZHk+PC9odG1sPjx0YWJsZSBzdHlsZT0nZGlzcGxheTpub25lJz48dHI+PHRkPjxpbWcgc3Jj
PSJodHRwczovL21haWwubmF2ZXIuY29tL3JlYWRSZWNlaXB0L25vdGlmeS8/aW1nPVZ3UlRwNiUy
QjUlMkI2dFhicjNaV3J3NWFBdnNoQUV3RjR1cXB6RVhGeGd3S28ycXB4TVhNb0o0TXh1d3B4SkNL
b0U5TXhrU3R6RlhwNlVtS0EyNVc0ZFFhcmk5MTZ3dmI0ZVQlMkJ1SVMlMkI2MG5wSGlUV1h0NVdY
aU4uZ2lmIiBib3JkZXI9IjAiLz48L3RkPjwvdHI+PC90YWJsZT4=

-------Boundary-WM=_7f31d8ffb700.1730265078690--

--===============6704295026813143801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6704295026813143801==--
