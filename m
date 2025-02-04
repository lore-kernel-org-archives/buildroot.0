Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87194C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 10:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24CB74029A;
	Tue,  4 Feb 2025 10:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWWShMQFpOyT; Tue,  4 Feb 2025 10:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C52402AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C52402AE;
	Tue,  4 Feb 2025 10:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 871D2185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD7E402AE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbVZZQe_6tUF for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 10:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82A074029A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A074029A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82A074029A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:56:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41AE6433EC;
 Tue,  4 Feb 2025 10:56:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfGbd-00FeQu-2G;
 Tue, 04 Feb 2025 11:56:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
References: <cover.1738575233.git.yann.morin.1998@free.fr>
 <fcd979d6868b3f34a4392bad6e7c3bdb100ce83f.1738575233.git.yann.morin.1998@free.fr>
Date: Tue, 04 Feb 2025 11:56:37 +0100
In-Reply-To: <fcd979d6868b3f34a4392bad6e7c3bdb100ce83f.1738575233.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 3 Feb 2025 10:34:06 +0100")
Message-ID: <8734guou56.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeehgedtkeeiheelieetveejheeuleefhfehhfdutefgffegledvteejkefhjeetgfenucffohhmrghinhephhhtthhprhgvqhhuvghsthhsihhnshgvtghonhgushdrihhnpdhsihhgrhhokhdrohhrghdpudhhohhsthhsihhgrhhokhdrohhrghenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeihrghnnhdrmhhorhhinhdrudelleeksehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] Config.in: timeout earlier when
 connecting to download servers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some sites have broken DNS entries where some A or AAAA records point
 > to a nonexistent machine. This causes a long delay (~135sec here) before
 > a fallback to another IP is attempted. This is the case for example for
 > sigrok.org, which IPv6 entry is not reachable (at least from the few
 > locations I have access to, while other IPv6 servers are reachable).

 > Add a relatively small timeout on connect for the few download backends
 > where we can easily drive that setting:

 >   - for curl and wget, that timeout only applies when establishing the
 >     TCP connection, i.e. the three-way handshake;
 >   - for scp and sftp, that timeout also include the ssh handshake;
 >   - for svn, it is not explicit what the timeout is about, but the
 >     documentation states "Timeout for HTTP requests in seconds".

 > In modern times, we expect that we can indeed establish those handshakes
 > in less than 10s; anything taking longer is in practice an unreachable
 > site...

 > For other download mechanism (bzr, cvs, git, hg), as well as
 > post-processing helpers (cargo, go), it does not seem possible to set
 > such a timeout.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  Config.in | 10 +++++-----
 >  1 file changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/Config.in b/Config.in
 > index c0c1a6079d..a543091d4f 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -114,15 +114,15 @@ menu "Commands"
 
 >  config BR2_CURL
 >  	string "Curl command"
 > -	default "curl -q --ftp-pasv --retry 3"
 > +	default "curl -q --ftp-pasv --retry 3 --connect-timeout 10"

It doesn't seem to be strictly needed for curl as it seems to use the
happy eyeballs algorithm, but OK:
time curl -v http://sigrok.org
*   Trying [2a05:bec0:20:c01::8c96:bda6]:80...
*   Trying 134.255.237.124:80...
* Connected to sigrok.org (134.255.237.124) port 80 (#0)
> GET / HTTP/1.1
> Host: sigrok.org
> User-Agent: curl/7.88.1
> Accept: */*
>
< HTTP/1.1 301 Moved Permanently
< Date: Tue, 04 Feb 2025 10:56:28 GMT
< Server: Apache/2.4.56
< X-Content-Type-Options: nosniff
< Vary: Accept-Encoding,Cookie
< Expires: Tue, 04 Feb 2025 10:56:28 GMT
< Cache-Control: private, must-revalidate, max-age=0
< Last-Modified: Tue, 04 Feb 2025 10:56:28 GMT
< Location: https://sigrok.org/wiki/Main_Page
< X-Request-Id: e50b7132460e1a6484be9312
< Transfer-Encoding: chunked
< Content-Type: text/html; charset=utf-8
<
* Connection #0 to host sigrok.org left intact

real    0m0.249s
user    0m0.007s
sys     0m0.011s


Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
