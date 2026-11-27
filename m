Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52550606A31F
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W5+RoZU8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=e9xYUJnS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23ED960ACD;
	Fri, 27 Nov 2026 13:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9xNpdlxyXCh; Fri, 27 Nov 2026 13:02:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5E25B60AC2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795784550;
	b=ZHIdfkYq3C8a9mlNOaMBBXyGndBn3G3m05w6XGyJM97azMXBY55FA3dMhm2rNp1ibOMN
	 NIbRRAgy9X4LpwU0KOGirstyQYHwpPDS+iEf/bCmSl5R9JPxs74fvLH8aFjwIEfZisLzO
	 vqiAh5DKfuDVZo6+JPz1L8FGJzU9IFT6Gg08MdMoFSO77P3WQbD6Pmh0yMQCjUB4ANZTJ
	 W6CzaZZhcGT2/JcMVWE4H9tXYzPuSikNhSpZTXp+CjZPZFtIreC1YLevTuE5CAY84waFS
	 k35ecqi4Y1NzuhpOlQ+w4RimyBOSXma/npqZi5NpRZius5m4Zk3ICr1WzxlMF1VPdvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795784550;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rfFQ8w1VUpFYEuGrPpQ8MCgBPzQiIWdz4R2sgAG+vVk=;
	b=ZDjrVJe5GrhvM5OHnUl08dROjk/JiT1N51XS4qce3YEB7x5R9mXbGMH0bf35fxGd6wXL
	 VP52UdRV7yqfjHcnQdzHYYh2gMi0loIZKicJJJlmxopKjvfDmR1L0/kGWrd9XpQZGDJ4E
	 0kvchRMU1KGy0u9FSP7C0dhG9oJ+gvo1hNbzfDjxc0chMHmd1nGfuceWNlQs5xHwEbGMP
	 nilj5azGYIAeDSUqnAfc90ubY2+ZCJXhlDAtuLtO6tTLOFq09S9shQdlIeHL78NXxzPAA
	 /LiqBk+kiB6XpVryIBBO5GSN6xc/u686u3xK8WFn+PrfdtONZSjLY9Ynk6KDL0o7dxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=e9xYUJnS;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795784550;
	bh=rfFQ8w1VUpFYEuGrPpQ8MCgBPzQiIWdz4R2sgAG+vVk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5+RoZU8e8Ix9wO4Xaf27GwwFTAqovTKMHS85jrIxlF65CTftllvJuf2JG5UpHvxG
	 AkloKUdV0YyQOL05p5nC7vSOTssTrnO5Jm7C1DG/FQbAIWZXnrcQITiXzQCAMqR6zW
	 qQYx+xD0sL5XAGd1z8FKvCfSfS8EzKFFSPTvkXvKEtUjuiUK0EVC6JfWedLcc8kOT4
	 gh1jVa+yLdFedLjOqOLP6YcAS10Xoxam3mrj5x1oxvtP2atuQLRxbSu3siaqSEtHN9
	 xUnYMsX4zkvKzpXwySo0FJ/295WqDOOhWkoQ3kD7dZ1FB2RggymJvxQdpmpuQdoKaz
	 3zzwVWlOaOdOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E25B60AC2;
	Fri, 27 Nov 2026 13:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D622E373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C410B60AAC
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSAAPPb5bNPX for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 13:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DAF160ACC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=e9xYUJnS
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DAF160ACC
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:02:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=e9xYUJnS9U3WwSHwy24hKRa/AtHwIlbc8du+CG9NyDXlTYpzhwvxu5wL9oD6EdBoAPOmZwz6j/8KQNEECnC7SHfqxYNLFrDecv9ox9/Zfd17fzMzbofarNA+KNocxUbwzKeh1sYrU0r2lk6uHflJP4Mo8rMbqIL4pEHSflvOlFvawdfj6cpLx2rG6LUuWlKQavyurl2jYdPz3gwPdpdzLpCSCZDx2fqYVMRK43B1OeDK0AadBK97BkgDVGm7ctCacxi+VwqCXj+rBqBHuMt5HxqobabnBZO8vfiYgIPgV8uiquThp7RLkc/+txxTycQFxB+XNq42jGlF1lcs9Yaqig==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Bhuxpa1k8LJcECZ6KAEyzkz/2vDGYKNAMaeA1VOmQkY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 775713929; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 13:02:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xWvaj-0000000EQgo-1c8G;
 Fri, 27 Nov 2026 14:02:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>,  Eric Le Bihan
 <eric.le.bihan.dev@free.fr>,  linux-amarula@amarulasolutions.com
In-Reply-To: <72837f10-3399-4e96-9ac9-f428b4b7cf0d@gmx.de> (Fiona Klute's
 message of "Fri, 27 Nov 2026 09:53:00 +0100")
References: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
 <8733smirz0.fsf@dell.be.48ers.dk>
 <72837f10-3399-4e96-9ac9-f428b4b7cf0d@gmx.de>
Date: Fri, 27 Nov 2026 14:02:17 +0100
Message-ID: <87y0aeh1gm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/eudev: S10udevd: wait for udevd
 before triggering events
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

Hi,

 >> by the move to backgrounding with start-stop-daemon, wouldn't it be
 >> simpler to just drop the --background argument to start-stop-daemon and
 >> instead ask udevd to background itself with -d like we did before?

> The problem is that eudev doesn't write a PID file, and if we don't
 > let start-stop-daemon handle backgrounding the one it writes will be
 > wrong (before commit 41258a81948fddfa7fc8ac06b69d77fa051b744d, the
 > init script didn't create one at all). :-(

True. Is there any uses for having more than 1 udevd on a system?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
