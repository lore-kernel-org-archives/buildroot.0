Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA58606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZfEn0tq1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB61081673;
	Fri,  6 Nov 2026 21:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4QX2G3iUtDn; Fri,  6 Nov 2026 21:20:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 229DF8168E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000039;
	b=JLk57UDIJrSdDhOwWSTegh97aN9I8/2AuP/YZNR0tU1mw/BcOGalbzpMkwjZMn+l69y2
	 RDZBc5o4kPZ/Cf9ufyPx28wBD1jK03qNgFcIxs7ddzwMVQHL4sYUAyXUXuuB0XLNHqO3t
	 VxD8MBcg7XYGRl8e81yNkj3HKi36f6/yf4fqFw3iG3mY0FoPldNIS0e2VrVNRsxb7ftr+
	 xzNg/IjG49Bppt+TpVDdgNW+Dt4mARcickcQ5R7njDUUI2Vaaiz4YPXCPTJ0B/PPb2LBb
	 sI3SOxrjue05mWocc55Lz1XvxZHeD1y1+P8QSrI5yxyHZmtBLBYQYfweo6yValFIIIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=WbeGg5I1eZxunp+g5Ygjr4yX7UNVWENJYWccfk42snSOcRuUMXc84H52lRHfiijI+8/x
	 V2l1XTyTULdmXRwb9vMWfCIJPQ0XV8rVc34h4TkaOkmPInLjewBbCcc0H5CcjmsqdRdEv
	 LdRTprlO2dC3f4xosBe/9/GvC98MjbUvyVoeH5Dwl8kGAFSD3GvHPCoAip3F4EIC+Cc+c
	 KDJaTZBiawLLBJs16cxKs6owQl2mN4UHtdhkkEhva5kfHj+qS2z/zRICkg1FeIKul9LB4
	 n0gEQQhZ3UJVqvL/4ZPAeiRRu+QhemZBAz9c8Po7xdy5UXbW8x8VXpy5IYMVV8UDQNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000039;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZfEn0tq1Iq/Or8kiKa05nusB9nN5jHGgfLE03BzSo4yb0RBygKl1w/o6DwXPCQrIA
	 KC5VtJj2cT42GXoLFW2uNGs18IAAnI99YoszcV4GBtxJkgPiOfu0XyrVZwTQ8PWrUx
	 WuypLb18LZXdmo4PCSZtHHqCysKzxkt13dfoKBNYWwQ4KSvER13giAIHf13lkvWUVF
	 l8/hA2mRg9Sjw3Px/VID2qQp0G2Qox74QXfB1cKEb44x/Hpq3tgak0DQ+NfvN6aiMz
	 Crh9J4YTkz0r/qtT8AphPnOihAHfqbOWpChBiVI6TDkHvJiSDeHpyY8nKuQZmi0wE9
	 Y3K9wARUgs/iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229DF8168E;
	Fri,  6 Nov 2026 21:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58E7A31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F0854094D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8av53z88AUt for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:20:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9BFC640907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BFC640907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:20:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 867FA78035B;
 Fri,  6 Nov 2026 22:20:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:20:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:20:32 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Kellermann
 <christian.kellermann@solectrix.de>
In-Reply-To: <20261106191536.2120153-22-james.hilliard1@gmail.com>
References: <20261106191536.2120153-22-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <187cf2ecc87208d3cd88e92ac5d8b446@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pylibftdi: bump to version
 0.25.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
