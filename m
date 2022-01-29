Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C37C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDD1B400F1;
	Sat, 29 Jan 2022 19:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ij731a2wc2f2; Sat, 29 Jan 2022 19:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D592A4019E;
	Sat, 29 Jan 2022 19:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 101A91BF3DC
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 19:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D6A82BD6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 19:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DM9c6s-ksnM7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 19:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5546D82438
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643483276;
 bh=9B8XqFP5hzCecfFy3r42txzRlbhIgoRmaE3whZMgy6I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YhnFjrmvgw+ItXfbDFngeAyJqfIRQ5WDZ46nh4Dyjwp9cDS7MvicP29U55jGG7mxl
 MOl1+q1zRkKI7s0Q49cugXby0Wb/qX6LhPD44VLCz6rbGhFTCXPkLFhw8dITOs7Lwp
 iHy9ctG4Bv9+PzBLLfHGv7SxU4KHv/7HIqxhNxtk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.98]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzhj9-1mIKa51VYX-00vjRv; Sat, 29
 Jan 2022 20:07:56 +0100
Date: Sat, 29 Jan 2022 20:07:55 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Chris <cheart0@gmail.com>
Message-ID: <20220129200755.17188a26@gmx.net>
In-Reply-To: <CAA6F-SOWP+gotpC8jtANa8-GZRu7ZvwcQuEMH_uNc54Yb0ibPQ@mail.gmail.com>
References: <CAA6F-SOWP+gotpC8jtANa8-GZRu7ZvwcQuEMH_uNc54Yb0ibPQ@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:dfk+7M4saOc9iRJjGllMsLSctKJ4nUcQl8tBchpTdaxfPniU/CC
 2ExuZuoBXTTriN+8/RIfc4P7DgCgmIyguap+zSm+gJbFTjRNxlrLJLj+nmeIyNYN+a3xJ1c
 +iwrxYw8Pl2ApLvdtI5KB8g7ruIZrewI36XIO1StjNAXE+RQIDhWatqscZ1+abRK8C7+apT
 9iyftyZ/nVP16qkYJsUaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wfXrWjYMNrU=:3+yfJjgFrSBpEeeLYYlnpj
 ngrz3yrOFAjRWk5LvIiTQQs6596kTQKbXl+Ryt9iks7VhINfAFzdM++x/B5H/YcQp5vVPawFu
 MXk+cQZ6j2Pyyer3sukKPiEmyf9+20NteOzrj0RwdgtNxVgOBj1I17ohO4zACd6th0WHsv9ot
 BYN1B1+vKNDYGZah4WaYzUTuRHFQTmgO7UHx6oosvxB+1u9loAXq6wsdR31npnwmIoPUXPVwP
 xO2le+7qSwUSO5aoZtxcR/64ewEmid/GOSdF3tdeXnyAkNDz1xWpIv6Wp2P6JyY64pxu7RmTq
 au+y2L9kk6byrC/argrs24tl0ge5AbzDkjgP/RPjYyGqdpLgSKgs2M7nCTWjb6INLgRFnOtZ8
 TS0LgTrZZHcg5cgSCS9AbGLT54hx60wT0zVmrNkt2GuFoilRuZGhIOVXKvAELhqXwmIwKqJi2
 shS7VAXkoJm9VksK/g3UuG//tV/oajRUfmlYHMn3/fBBtCoL0jNPUbBbBDQb72FQxC+YwRM/G
 uJMumX91J31Q0aOzRwNtpd2IocJm9xWxlJ7bn8aV0sBVrt7ABVAhnfFkW+EBRmIClV+XchKcT
 r6/o9fJkFvUBkCtSHu4qSYUgxA/SnXQgIFzkeu5sjqR9F+SG1Wo4VT4O2ACdCxZWhcwQQvu5j
 yNXoBWN0gtvCDiq4oWTd9qjDkdw4tp3YyLvfW0iP9857Cd5fSAUoYKlFUDrnuMFq8sWCE9jd2
 Tw79lzcvN9XldiixQVW+aEIEiGeTlIqNE+Yyp9kGlVHezHawNCybwrclMerr7tT7FyD1DqjWO
 cG8888vYvX7TZBFC079dl5dW6dnT/I5BZUqr40MEh0GvMzc5lqwBK7PX7v2NwkAXDB798Tn6M
 MNa9X8rgAIe+dmycHlgt2Htgyvvch5QtpARbJFGWjV+wPqQO+C78c1R3OrffJicZmXBFk1dmV
 QCJ0v91cqKn//BSCJliGvRezllbNP2kq0se1JXJsksUWhbQKCRkRNoIcB9CVoeATS3LrEFLJm
 WhDvOgzJ1IAo6TO/u19wyiV3UU48Cj4ibChPKsEN52hgC15BpD0RBcDZiHyHn3eQTR1EW7v53
 I3FBLWlzPoQWa0=
Subject: Re: [Buildroot] swupdate suricatta build error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXMsCgpPbiBGcmksIDI4IEphbiAyMDIyIDEyOjU5OjIzICswOTAwLCBDaHJpcyA8
Y2hlYXJ0MEBnbWFpbC5jb20+IHdyb3RlOgoKPiBIaSwgdGhlcmUKPiBEaWQgYW55Ym9keSBldmVy
IHNlZSB0aGUgc2FtZSBpc3N1ZT8gV2hlbiBidWlsZCAyMDIxLjExIGZvciByYXNwYmVycnkgcGks
Cj4gd2UgYWRkZWQgc3d1cGRhdGUgcGFja2FnZSBhbmQgZW5hYmxlZCBzdXJpY2F0dGEgbW9kZSBi
eSAibWFrZQo+IHN3dXBkYXRlLW1lbnVjb25maWciLCB0aGVuIHdlIGdvdCBlcnJvciBhcyBiZWxv
dywKPiAKPiBzdXJpY2F0dGEvY29tbW9uLmM6Nzk6MjY6IGVycm9yOiBzdG9yYWdlIHNpemUgb2Yg
4oCYanNvbl9yZXPigJkgaXNu4oCZdCBrbm93bgo+ICAgIDc5IHwgIGVudW0ganNvbl90b2tlbmVy
X2Vycm9yIGpzb25fcmVzOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+Cj4gc3VyaWNhdHRhL2NvbW1vbi5jOjgyOjE1OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbgo+IOKAmGpzb25fdG9rZW5lcl9wYXJzZV9leOKAmSBbLVdpbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgICA4MiB8ICAganNvbl9yb290ID0ganNvbl90b2tl
bmVyX3BhcnNlX2V4KAo+ICAgICAgIHwgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiBzdXJpY2F0dGEvY29tbW9uLmM6ODI6MTM6IHdhcm5pbmc6IGFzc2lnbm1lbnQgdG8g4oCY
c3RydWN0IGpzb25fb2JqZWN0ICrigJkKPiBmcm9tIOKAmGludOKAmSBtYWtlcyBwb2ludGVyIGZy
b20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KPiAgICA4MiB8ICAg
anNvbl9yb290ID0ganNvbl90b2tlbmVyX3BhcnNlX2V4KAo+ICAgICAgIHwgICAgICAgICAgICAg
Xgo+IHN1cmljYXR0YS9jb21tb24uYzo4NDoyMzogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24KPiDigJhqc29uX3Rva2VuZXJfZ2V0X2Vycm9y4oCZIFstV2ltcGxpY2l0
LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIDg0IHwgIH0gd2hpbGUgKChqc29uX3JlcyA9IGpz
b25fdG9rZW5lcl9nZXRfZXJyb3IoanNvbl90b2tlbml6ZXIpKSA9PQo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBzdXJpY2F0dGEvY29tbW9u
LmM6ODU6NDogZXJyb3I6IOKAmGpzb25fdG9rZW5lcl9jb250aW51ZeKAmSB1bmRlY2xhcmVkIChm
aXJzdAo+IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgIDg1IHwgICAganNvbl90b2tlbmVyX2Nv
bnRpbnVlKTsKPiAgICAgICB8ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IHN1cmljYXR0YS9j
b21tb24uYzo4NTo0OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRl
ZCBvbmx5Cj4gb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gc3VyaWNhdHRh
L2NvbW1vbi5jOjg2OjE4OiBlcnJvcjog4oCYanNvbl90b2tlbmVyX3N1Y2Nlc3PigJkgdW5kZWNs
YXJlZCAoZmlyc3QKPiB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhqc29u
X3Rva2VuZXJfZXJyb3LigJk/Cj4gICAgODYgfCAgaWYgKGpzb25fcmVzICE9IGpzb25fdG9rZW5l
cl9zdWNjZXNzKSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgIGpzb25fdG9rZW5lcl9lcnJvcgo+IHN1cmlj
YXR0YS9zdXJpY2F0dGEuYzoxNzoxMDogZmF0YWwgZXJyb3I6IGpzb24tYy9qc29uLmg6IE5vIHN1
Y2ggZmlsZSBvcgo+IGRpcmVjdG9yeQo+ICAgIDE3IHwgI2luY2x1ZGUgPGpzb24tYy9qc29uLmg+
Cj4gCj4gCj4gICAgLSBob3N0IG1hY2hpbmUgKE9TL3JlbGVhc2UpIC0tTGludXggTUlOVDIwCj4g
ICAgLSB2ZXJzaW9uIG9mIEJ1aWxkcm9vdC0tMjAyMS4xMQo+ICAgIC0gdGFyZ2V0IGZvciB3aGlj
aCB0aGUgYnVpbGQgZmFpbHMtLXJhc3BiZXJyeSBwaSBiCj4gICAgLSBwYWNrYWdlKHMpIGZvciB3
aGljaCB0aGUgYnVpbGQgZmFpbHMtLXN3dXBkYXRlCj4gICAgLSB0aGUgY29tbWFuZCB0aGF0IGZh
aWxzIGFuZCBpdHMgb3V0cHV0LS1hcyBwb3N0ZWQgYWJvdmUKPiAgICAtIGFueSBpbmZvcm1hdGlv
biB5b3UgdGhpbmsgdGhhdCBtYXkgYmUgcmVsZXZhbnQKPiAKPiAKPiBUaGFua3MKPiBDaHJpcwoK
U2VlbXMgc3VyaWNhdHRhIGRlcGVucyBvbiBqc29uLWMsIHNpbXBsZSBlbmFibGUgYWRkaXRpb25h
bAoKCUJSMl9QQUNLQUdFX0pTT05fQz15CgppbiB5b3VyIC5jb25maWcgZmlsZSAob3IganNvbi1j
IHZpYSAnbWFrZSBtZW51Y29uZmlnJykuLi4KCk5vdGU6IHN3dXBkYXRlIGhhcyBhbHJlYWR5IGFu
IG9wdGlvbmFsIGRlcGVuZGVuY3kgb24ganNvbi1jCihzZWUgWzFdKSBidXQgYW4gaGFyZCBkZXBl
bmRlbmN5IGZvciBhbiBjaGFuZ2VkIHN3dXBkYXRlCmNvbmZpZyAodmlhICdtYWtlIHN3dXBkYXRl
LW1lbnVjb25maWcnIGlzIGhhcmQgdG8gZXhwcmVzcwppbiBidWlsZHJvb3QpLi4uCgpSZWdhcmRz
LApQZXRlcgoKWzFdIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3RyZWUvcGFj
a2FnZS9zd3VwZGF0ZS9zd3VwZGF0ZS5tayNuNDIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
