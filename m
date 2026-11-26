Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883F606A329
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NvyoPycD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=g/kNV6TY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F2940A01;
	Thu, 26 Nov 2026 17:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5baRggSz0QY; Thu, 26 Nov 2026 17:01:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BFB340A02
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795712507;
	b=m5DvIZoSwT2CEIuE3C6xQtemNF6vpr83BC9BK5bP2LbuuWxLnTUnZf1Ztk0ajss8n+Ei
	 dSNYmoGbiIPWZYsez5tzgURDiEdBOPIVwN/mz9+Ec+7lw0Mh+KXXG7Tqz4lSP0Pd/5baV
	 jpTk0MzjVBqHcqjc5XmIxpt+pBtWsR+nD8lcc4Ssz/ow4dcq0G8JAVdLn5pNw8fPuzWj5
	 ZmGBd2vYm7Lh6BaT1GY3rhT9WksLPQNZRbHBHzxDzV9kCp0bOUGMmexqot+10xUjJxVtv
	 620/ZThWU1NTxh6dsseM3srF1xDwE+kc9i06v/huS71T9SW8b9LAhYWiBy9NJ3rmLKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NvUZcI0FfFyUadmwgLyiETGIudkvVw2+e2g9h4e1D/U=;
	b=QG9QSf9YCd58AmETuAvq4hrZEOI6hzq3SQoj0ei4G0mOC4EuA87xTIxohOpFxarnB9Jl
	 w7aFTPhQ7hIgt+JT/Q95miPeXJ7mJYU5r5GZgSceYUKwRfNGg+EOsZv2WPD5zX1YGMK3+
	 gvmyWvdjt18xkRvACGAUWiEu24D+d6Nibjp/wnb+Mjn8A48UOGjC1+0CPGKD4TbnD1sW3
	 mnj+zsbJm7rrGyXs6SBoHQM7lYrenwXkRAoqaOi0ZmhbIf2cZlkRIB03zc4whmdnm0xRb
	 UUFu4cgTTPyKrzLUMziFuYV6Dcjw57vW/SxqH+Q8dFR4wn+6wpE6i32MoDuQS+Dzdnw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b="g/kNV6TY";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795712507;
	bh=NvUZcI0FfFyUadmwgLyiETGIudkvVw2+e2g9h4e1D/U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NvyoPycDJjuaAh0bsRnRmrm50KxYqHBjSOPFjYbUImTBDK60fwgEW2dbVxvUSqLAn
	 R4ntlpAFVqKME9zq82fQHRGT8Ijqh5DjzVOQ6KxIzqxXmQ3d1Xl2erA0fjwDubO5Rr
	 PjqBYot9GNLRCNKcxZR88whUQ39JHxfpmPK7qoOpm9PV6z3UdvTMvm9vqGR93fulVy
	 pKqH+Q2x4vqhD3SAZBvZ828cvkI19L8clbdbt8ZAbuXqgu84lG1MEqmhsf4Q6RiS9K
	 0xcg223JAJL2NbqErB1ZXGvju6JWBYXy/8N66H8cp0wm220IowvdYD525099zdIkqO
	 CUxE7abxM4/IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BFB340A02;
	Thu, 26 Nov 2026 17:01:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3233622B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18AEE40A02
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDSXtuKQ8UTW for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 17:01:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E055940A01
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=g/kNV6TY
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E055940A01
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:01:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=g/kNV6TY1njHXQy6f4/rj7ClySM3R8VcMJNV6hAuxSwz/rwhUx0lTzaVlx3WUABtrPodrhdy722nJYkUxIZYAYgFihHNyCHLioMiAQ0noXafT1+iHKNyK1wOu7oc4BYBxnJziJSc2XAamoGPDkUhl+hk/+M3dZHkHejbG1c+6an17ks0ZopBUKSpzz6+3fOWI21j/ntfbC04ox4X4ClDeV0jPAj+TfZheA1vW8lKr9BChCT5I0Z8HnovtAB5jqQzJPz4vcV/MubfLNTfQ2Lw/RyeAfzvp7h4siTzXlv4JMd185SO6TSb8Tqeh+zXSD4g2OmJ69EbAY192O/wElWLRw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=znP2KEQu44FepbMsedoGmDAdU7+mxeEM/XG1EDxlgVU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 142238929; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Nov 2026 17:01:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xWcqX-0000000BuUR-2fJW;
 Thu, 26 Nov 2026 18:01:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261125053708.1396093-1-br025@umbiko.net> (Andreas Ziegler's
 message of "Wed, 25 Nov 2026 06:37:07 +0100")
References: <20261125053708.1396093-1-br025@umbiko.net>
Date: Thu, 26 Nov 2026 18:01:21 +0100
Message-ID: <87a4mvplwe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: Update version to 0.24.20
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Andreas" == Andreas Ziegler <br025@umbiko.net> writes:

 > Contains two bug fix releases; .19 was predominantly Windows and OSX,
 > .20 is mostly Linux related and contains fixes for a lot of corner cases.

 > Change log:
 > https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.20/NEWS

 > Consolidated changes 0.24.18 -> 0.24.20:

 > * configuration
 >   - fix crash if "audio_buffer_size" is too large
 > * protocol
 >   - "max_command_list_size" limits the real memory usage of command lists
 > * input
 >   - fix hang after a failed seek
 >   - curl, ffmpeg: disable the Gopher protocol
 >   - ffmpeg, mms: fix data corruption
 >   - ffmpeg, mms: fix broken stream after seeking a non-seekable stream
 >   - ffmpeg: don't block other threads while connecting
 >   - ffmpeg: fix error and lost data at the end of the stream
 >   - ffmpeg: fix bogus size of non-seekable streams
 > * input
 >   - nfs: fix buffer overflow if the server sends more data than requested
 >   - nfs: fix hang if the file is shorter than the reported size
 > * decoder
 >   - mikmod: fix crash when scanning a module during playback
 >   - mad: fix crash when the channel count changes
 >   - dsdiff: fix uninitialized sample rate and channel count
 >   - opus, vorbis: fix crash when seeking past the end
 >   - sidplay: don't block MPD while seeking
 >   - sidplay: work around deprecation warning with libsidplayfp 2.14
 > * output
 >   - fix data race in the ring buffer on ARM and other architectures
 >   - osx: fix noise when playing DSD with DoP disabled
 >   - osx: fix buffer size overflow with many channels at high sample rates
 >   - osx: don't cut off the end of the last song
 >   - sles: request audio focus, fixes silence with Android Auto
 >   - wasapi: fix crash with DoP
 >   - wasapi: fix rare hang while disabling the output
 >   - wasapi: fix crash with "enumerate"
 >   - wasapi: fix crash after the device has been removed
 >   - wasapi: fix device names beginning with a digit
 >   - wasapi: fail if no supported format was found in exclusive mode
 >   - wasapi: fix format negotiation in shared mode
 >   - wasapi: fix crash after device error
 >   - wasapi: fix output failure after pausing or stopping while draining
 > * mixer
 >   - alsa: fix crash after the mixer control was removed
 > * database
 >   - proxy: fix memory leak after receiving a malformed song URI
 >   - proxy: reject RealUri with Windows drive path
 >   - upnp: reject song URLs with newlines and null bytes
 > * tags
 >   - id3: fix excessive CPU usage with many frames of the same type
 > * playlist
 >   - ignore the URI fragment when detecting the file type
 > * Linux
 >   - fix "chmod failed: Invalid argument" on kernels older than 6.6
 > * Android
 >   - fix crash after setting the volume fails
 > * macOS
 >   - fix empty pid file in daemon mode
 > * Windows
 >   - fix service stop and system shutdown
 >   - fix service timeout error if startup or shutdown is slow
 >   - fix race crash bug during shutdown
 >   - fix service hang after startup failure
 >   - fix encoding of WASAPI error messages on non-English systems
 >   - playlist: reject Windows reserved device names followed by a colon
 >   - archive: reject ".." in archive entry names

 > Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Committed to master given the bugfixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
