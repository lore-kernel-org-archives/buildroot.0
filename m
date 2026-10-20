Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5DE60A2610
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PrBZVn2M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=GD69ferD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C704081C;
	Tue, 20 Oct 2026 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UBv6iQQptq9; Tue, 20 Oct 2026 16:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90F3040649
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514697;
	b=PM0Xo/zzoksf+EF/1R609C23QX/eHU4eBzHwGmUpAJNX8K5DtW2FCXG1t9a0QLErXO2m
	 Il8lUSiJOh5Lfkaf5ij3e0ca44QQVSf7i+MYCrBHlp+fRdo1jq+gZ6hkf9MkKmvpjl1Aw
	 qSYjBTpCa1zEdGYgAS4GCJ1ak672qhvuLoMDDpIZBhKUDiREGkjOGGkr+noTqksgc/tyP
	 nIj5TiRVBHDhcd0Ql5UYhUZdO5V/iq+k37HYoO621hcVZ76QGVrL0vyxE7qWlo9phVdUU
	 BjTJLESQMY6xxeMkbaRiwLow3q433WlFNzak4n2zHdrDWIIH5EBI2BXu9i2x7Ma9HGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/iUsnKNn05N2owdRmHvG63MUhAHjOby9utF7iMxQPDc=;
	b=kIRDcgQRAQGcuNopsFDbyOLyz8wgQsYBh1cB28XzU6He5Vbw7lTxgPJyzxuiHAbu2Lcd
	 tBj93cUWDXBnI8PmDfCUULupyGdbQsTNcdDCneVaYTYmYKH8dentl2/2hLpsjtKJ+de+S
	 srUkdMDfAWYDOIYl6HtRiJGIJ6lrXzE7XmvNo+ngwcDpKpe4nnEphg3OX62SRnS4e+uIO
	 CtyzCmz4DfYB7B+OWlpAtcCQga59hB8iFJ+DOwrJiGXWbYU+a1seQEaJp37JpHaVPLUgd
	 1/DBl6XY/SMtFQYVS4m4LSEnPZES9DoKvWxTrpdwQV2g1MTytamLTNbHzd59HcoBk6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514697;
	bh=/iUsnKNn05N2owdRmHvG63MUhAHjOby9utF7iMxQPDc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PrBZVn2MjWWqcoEmhCA3YpkyQxQ+rrkDPr4+vhpbay6fYPz6CESiJ3ShvoXUF1HHD
	 AbqiJlTGqrCigJjcRseWR8BrHMBX67tbBQi29tUWJqOBxac4SjRPOfAFaLTD4L1XlT
	 P8f1cJfPPktuW7BZG5zO1UG9mnBMXe5VMVDNoqra2FSw1xDMjacbYtW1KWwiWLjSiW
	 W/0ZQrDf1gzmZkuN5sHmxxWSwcktcTTi/ctaAL6eql/hRxx65xYrsmS3ya9WmF1iH0
	 iQrg9HZmF+f6h8zdmZ6QmK+tGsHMO6/1GULMMzmeqTdC93ZN/Pre5uEkdPLRexp43W
	 mV2cVWwJavc1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90F3040649;
	Tue, 20 Oct 2026 16:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C831E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180476077F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C59SVWPGMI8y for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:44:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 65B7160773
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514695;
 b=jRJGLVIGy93mP8hnwTq8BM2Nm9FuwXAjaLMylgUwqGIjqOS+rKyf9Q+98Hi7qL/HNMaB
 3axU2OFGFvNNk8XeEL8fjfj/U6VN+wKbXd5rg+wKXqJyopSp5Q00MmSw48DCctocuLpEq
 vQuwfSc2w/JOOFElGEpZEYsy2wE+OjPrwepoeUnlJzTn6IWvIaTo6UvPtFxZNx2RQNxHq
 4Z01tIbCcMo/om8nc+JnEKu5Bq+f4CwfiV7gZ/hDaQgCxU8pm82bfTJk3ttxy0unfimeH
 XpVmAxzrxWpPDwhy/NE1jxBB2wMSarHml2gZpsWocUwo0QWxy90glcRszYzsMUMzzwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514695;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=bgzHBXXKzj7Nsr3/M0tCuOBFRc1WNj3mOEkN3qQaE60=;
 b=KeLIFiEtVvqttVf6wI1QMLUjJH+I3o9nuMMgGuCJlDp9538GZ0WISVoKDwE8NbXQsjE1
 FKbdnEWlD3Oe4sQpzHh+cfFErACuU7MjErEgm2vNbHo4ERQ8npnpOw2opBIVlniUXiQSr
 Yh02V3L2o+3ddbavofJcAO4qiwYC/RfrvjAADDXGVDf0aOTMBLrPOLX2qRizeP3lbyLLG
 yKkdjkN/yUd3tFkwkQRAouphIQZEJBEczsOz6M7v/l1Xq7yairbEFDpXCk3wl/p8h86VM
 /lxITo1NVFT2urGZs2TcaakfxVo/BPbmaUKt2sowlGcMLWrBDbFezODp3It9q/ok57w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=GD69ferD; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=GD69ferD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65B7160773
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:44:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GD69ferD8d4KpLNfW6skNqbQH9nFRyszXp/zfWm6U9wpfK0fqtmXo7Oo5SWx74F2TpFd/Z+YkUdf30X7YFNu2nwuSuBrMJKKYdLQa9QKIuNjul4AXE6VAcRzSoRC2KFmsDchhX0TC6y8iV1Wvu8IlMqo38l3JBwJkwGwKplz12BrzmIMSikhPXy/dDuY818cQmPiYwVUPv9anjj87GAVgeGDJxkW2pCO61V2bT4ZBozbuf2xn4iED5mHljdeGeVOIKGzUJm/be4P/ZL2IkAjNxzSAWtq5YarXXQwjgiWtqbkqYhBLoBfHEDUwtD01Ac9TUbA2gYKJWQPghR1tcvETQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=nflFnKS4Y+6Lc+zJMordUaUYoQ+SZHXlrOKt1jMGsI4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1584967272; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 16:44:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJCxE-00000008CH3-2Ri3;
 Tue, 20 Oct 2026 18:44:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261020153353.1865260-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 20 Oct 2026 17:33:52
 +0200")
References: <20261020153353.1865260-1-thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 18:44:48 +0200
Message-ID: <87pkx48gov.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libvncserver: explicitly disable Qt
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Qt can optionally be used to build an example VNC client. Like for the
 > other example clients (Gtk, SDL, etc.), let's disable building this
 > example client. First because we don't care, and second because it
 > fails to build:

 > CMake Error: Cannot determine link language for target "client_examples_qt5client".
 > CMake Error: CMake can not determine linker language for target: client_examples_qt5client

 > This Qt client was introduced in libvncserver version 0.9.15 (by
 > upstream commit b44665c0a28ba3776edebb57548562cf7ddc117f).

 > No autobuilder issues were found, but the problem can be reproduced
 > using:

 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 > BR2_PACKAGE_QT5=y
 > BR2_PACKAGE_QT5BASE_GUI=y
 > BR2_PACKAGE_QT5BASE_WIDGETS=y
 > BR2_PACKAGE_LIBVNCSERVER=y
 > BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD=y

 > Fixes: 3b62f17f327ddacaca9ba134c4a9c1570bd869b6 ("package/libvncserver: bump to version 0.9.15")
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
