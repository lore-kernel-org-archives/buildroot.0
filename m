Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2429606A328
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F+zuJqfQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D5C940776;
	Thu, 22 Oct 2026 09:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_iRx4LZG7dN; Thu, 22 Oct 2026 09:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A6E7040940
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661677;
	b=otUKoeooM1Ay860+1hUbbc9EhS2D6GesxmLuxShCZSjhVsBAodbdHENptqrAuHYOPt70
	 nLBDnXMLBQ6DLlCt0lm9lP285PIxnaSMA9kR8Yk8gYCAtC8QXxCxzYhlSB1rlnzuIjokU
	 LGxn5PhU/17Ramw7Hmhc9eEC70EuUyhqa9XkpyYFLScXOcOFjCelTmEB4CKdrOwXnf0ap
	 IdnrLDcrkisVTv4nQP6fo7MqV4AqAyaNWVCLNaVa+4uCdGBBgAGxjDI/H9CEv1lek0+4B
	 9/u4qk69BqVkZ7m4SEmCDVz9IqQdWAhHxxNIHSM6zRPaUIRwNr/YX2XKTYQOkJ/jfGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661677;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ECs2rneUQ2bqKNPWXKiyI61obXw0fjpY4+skkoXdNxk=;
	b=VbbnrfUjPJxAcZ3s52obBskO/5iGLTFE7CVuEP9lJ9wFfRV0BdnpkEVjK8DDFrVMXHci
	 ZoHzE8XEaiHDY3ExXtVl+VR3GYlZexiwjkUL+03w0ir74XkXHSVkvqBOf4/XB9yBBr4du
	 QZVxkIuXRruUFaDct0/U8tCHk0wIDhOeh4Q5eDF3zShe7DubKqhvHSylzUGJJpYtzoiSx
	 y6w27IAKawD7xEwI0Zh7VRm7KLOPxlL86wetTppkSVXG9KrTYT5f3C6TBCH+Nwm075hlL
	 telh0u/DsllQmykVhnRyJtvJBvrAxzxEX3NMdo+CgtE89XB3DOQDiXCfeHQyluaPBRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661677;
	bh=ECs2rneUQ2bqKNPWXKiyI61obXw0fjpY4+skkoXdNxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F+zuJqfQj/W1ztkhZchlJuCzDC89AjByMq7g5UGy2oCy8A1eEQKI7twCjR2tHlOvh
	 OwPEcBtGi9DIdQbUDW5VjYLWMI8IpLedwFXILBDlAFB20sokGW3HIzqEuYLoGXRm8j
	 aR8lHPIylKGm3AtdTW9UpcpMEEuXYJxkac+P4H9Y/bp1ucQ0+YhlyyiDc/hE+yfTFL
	 41oUunpMWrusp7Sp3Y7028xmp2NJGWQ14A9MtgdlOzCD1mfqg629IOf5k3jU7Rgdq8
	 SwpnWNOVpEpoEq+PxMIqGXAvWpPdr2lhf29J8OYQNpMMtcUVSZipL0fXqa1iqZ7/sJ
	 1h4cZGD5FnWgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E7040940;
	Thu, 22 Oct 2026 09:34:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E565595C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E34E060852
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO6Nh6ZfImJw for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD0D060823
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661672;
 b=bAxy+peRx8WNzTNp0+jwRLGxN/cxUsDhPDTVVmcHrhiIn3ltIVgAyn81hrpS5QSodBgl
 WQS49iZ30UGIH9m6bmf4fniOqzdR0X1LHYoVHlIApkrZ3O37T0NW5D1Aj6RdMyTgenMrV
 /akZQr7QZy3eVdlGq82WmnoTXzdIKwxVsvBcbqIHnqMt8oGXxc8BBS51Ldc8A+Rc/YoD7
 Rj3OMAei4enYvFWIwQxM/pghYgTdbHbKfDljZoxCGnwVOXYU4t/S3kCI+E4UroYpU+XT1
 VKPh6rTyYzCvk/FDqCTjEoLRil15MNaNZ3Blj9Hc5I9FHRUgtcCvva0Fl/thAxeTiNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661672;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PB0Q4x4s4LO9r2EDBeDc4VxgSoS8Q2eYOXgmQgFmcU0=;
 b=dHNB4CilLoK65dD9xQ09XttWf4u59rq2yDU3cTnp0WJjNSxq+Ih9nm8i6L32aMmEBuZ/
 8dwgar9DjOqFsfP8cGRDBoAi0JVbl8yyClYEh5iRCPDkr2Tre85GUT+2gxcbT3p/lFhD4
 JoyxC21iMc2fVmC/KTq6oAGdCbsC9VKalF4tEJU2mWROWJirbSOWKK/7RK7QeMIYE0DuC
 A7a/9/BCyeaN2c3Szzw0ebr1pEwyQoFNo08bdjoIqvUyeq53m0wyRcpkEH7EeTVFOwWMk
 PdqcRzGaMYdco5tfRbfKQRefLcNAB2i/PnZwgdFWX02jKtEHEsbnKeKrZnjRztUFR1w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD0D060823
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8DF89B985; Thu, 22 Oct 2026 09:33:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:38:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 352c1fb59eebaff863f07182fbddacd00b82daeb
X-Git-Newrev: e81cea88313cfe308a9b07d6c0ab4ee87965165e
X-Patchwork-Hint: ignore
Message-Id: <20261022093308.D8DF89B985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 TestPythonPy3NetworkmanagerGoi: fix assertion
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e81cea88313cfe308a9b07d6c0ab4ee87965165e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since python-gobject version 3.51.0 [1] and PR [2] the pygobject Enum
are using the standard python Enums [3].

At the moment of the changes that introduced this code in the
NetworkManagerGoi tests [4], the master branch was based on
python-gobject version 3.54.2.
The 2025.02 version of python-gobject is version 3.50 which doesn't
support enum as standard python enumaration and thus doesn't include the
'.name' property.

This commit change the assertion to compare the 'DeviceType' &
'DeviceState' object instead of the name.

[1] https://pygobject.gnome.org/changelog.html#pre-release
[2] https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/394
[3] https://docs.python.org/3/library/enum.html#enum.Enum
[4] f38f5bb593 support/testing: TestPythonPy3NetworkmanagerGoi: check we actually get data

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/17125191068
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/sample_python_networkmanager_goi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/sample_python_networkmanager_goi.py b/support/testing/tests/package/sample_python_networkmanager_goi.py
index dff68e66f9..faf78aed3d 100644
--- a/support/testing/tests/package/sample_python_networkmanager_goi.py
+++ b/support/testing/tests/package/sample_python_networkmanager_goi.py
@@ -30,5 +30,5 @@ assert len(connections) > 0
 # check that we can find the loopback device ...
 loopback = client.get_device_by_iface("lo")
 # ... and read its type and status as expected
-assert loopback.get_device_type().name == "LOOPBACK"
-assert loopback.get_state().name == "ACTIVATED"
+assert loopback.get_device_type() == NM.DeviceType.LOOPBACK
+assert loopback.get_state() == NM.DeviceState.ACTIVATED
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
