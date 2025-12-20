Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B98EE6689E
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 08:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36734607DA;
	Sat, 20 Dec 2025 08:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb4ytplpIEAS; Sat, 20 Dec 2025 08:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5295E6081A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766219179;
	bh=gOHnMCiTC2jOCn9+6TGTq63LdD9V77cDbLU9SFraUbg=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QUUEIaB/JYs18awevvQnRzO5uiOvNOJE2f+zBVfZxDYuzzaOdvgKWiTa3Zknl9zQw
	 SY6x9Xj/IKg5ouWocivjrkHAxl/lFqHTpZ7CI2OwGXph0AgEWxrwv3RwEzOZyt0bbI
	 1nNsCEzWAEssy1Xe0JfnX7EasYj3gnbb8S0Zm1bChv6rHH5bMIIeuofO973mcb6I2f
	 p/k7vUhhr/vGvSx6wdyIxTkO5EPbWegdPfTU/N5FFZhMiEUobC/Yd8PZm5WVLHDKfn
	 Nsa3TscaxUbBz9LqfVG9Wwdo/MAn+CTXbV1CxxjMK5lbfoKLkPIsho/x2QnsUvLRlG
	 5OacE6g9Nyvtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5295E6081A;
	Sat, 20 Dec 2025 08:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8593423D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F0B811B5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHCof6uTW3n1 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 08:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFB8880CC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB8880CC6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFB8880CC6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:26:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -578776628; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 20 Dec 2025 08:26:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vWsHv-000000008Ng-2N3K;
 Sat, 20 Dec 2025 09:26:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20251219181304.1910105-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 19 Dec 2025 19:13:04 +0100")
References: <20251219181304.1910105-1-bernd@kuhls.net>
Date: Sat, 20 Dec 2025 09:26:07 +0100
Message-ID: <87tsxlftk0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=G0fceOSi8lQ7xeLsM+BkwknPL1fZBoB2mWXV81F++jEQksO+KrVjIH9x2QJvuAkBnHEy1xbCl+yqZXe3lZqOI65ELF4AVD47jDbqE7gwrSZXrQyS85vEJTp2A4b0U3EOKHJ/38OW6YT4RJ1tOSEQIWc/xZayO4IvmRZhJyEE5oBcWZyWqAkclMcdLmANoY7Ceb16CWO+JzGoOnTNV1zbYzx7DDuaYeFTATiRap9YnR6LuPCuUHub2AUaLkWwC5Wb3XdjPKjzj+/hgFAw5y75ZculRkyab+dPJ+yI9nvEVlmoZRrwj3IYz/1jgtaQYaX8t7bwPHV4QQBbvRCAbtNmOg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=yMPJOimc6l1bylQ2x2aKDUCWR2+5jqc+uZ6NGbCVDIM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=G0fceOSi
Subject: Re: [Buildroot] [PATCH 1/1] package/python-*: mass update of hash
 comments computed by scanpypi
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
Cc: Ian Haylock <haylocki@yahoo.co.uk>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > No changes to hashes, only comments in hash files computed by our
 > utils/scanpypi script are updated by this patch.

 > During future mass package updates this patch will reduce the number of
 > changes created by scanpypi to be reviewed.

 > Please note that an updated version of scanpypi was used:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20251001002004.3178942-1-james.hilliard1@gmail.com/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  package/python-aiohttp-cors/python-aiohttp-cors.hash         | 2 +-
 >  .../python-aiohttp-debugtoolbar.hash                         | 2 +-
 >  package/python-async-generator/python-async-generator.hash   | 2 +-
 >  package/python-bcrypt/python-bcrypt.hash                     | 2 +-
 >  package/python-chardet/python-chardet.hash                   | 2 +-
 >  package/python-crc16/python-crc16.hash                       | 3 ++-
 >  package/python-dicttoxml2/python-dicttoxml2.hash             | 2 +-
 >  package/python-docker-pycreds/python-docker-pycreds.hash     | 3 ++-
 >  package/python-dockerpty/python-dockerpty.hash               | 3 ++-
 >  package/python-hatch-vcs/python-hatch-vcs.hash               | 2 +-
 >  package/python-iwlib/python-iwlib.hash                       | 3 ++-
 >  package/python-jaraco-classes/python-jaraco-classes.hash     | 2 +-
 >  package/python-jaraco-context/python-jaraco-context.hash     | 2 +-
 >  package/python-jaraco-text/python-jaraco-text.hash           | 2 +-
 >  .../python-json-schema-validator.hash                        | 2 +-
 >  package/python-libconf/python-libconf.hash                   | 2 +-
 >  package/python-lockfile/python-lockfile.hash                 | 4 ++--
 >  package/python-logstash/python-logstash.hash                 | 2 +-
 >  package/python-mypy-extensions/python-mypy-extensions.hash   | 2 +-
 >  package/python-orjson/python-orjson.hash                     | 2 +-
 >  package/python-pure-eval/python-pure-eval.hash               | 2 +-
 >  package/python-pydantic-core/python-pydantic-core.hash       | 2 +-
 >  package/python-pyinotify/python-pyinotify.hash               | 3 ++-
 >  package/python-pyjwt/python-pyjwt.hash                       | 2 +-
 >  package/python-pyphen/python-pyphen.hash                     | 2 +-
 >  package/python-pyproject-hooks/python-pyproject-hooks.hash   | 2 +-
 >  package/python-pyqt5/python-pyqt5.hash                       | 5 ++---
 >  package/python-rpi-gpio/python-rpi-gpio.hash                 | 4 ++--
 >  package/python-shutilwhich/python-shutilwhich.hash           | 2 +-
 >  package/python-simplegeneric/python-simplegeneric.hash       | 2 +-
 >  package/python-stack-data/python-stack-data.hash             | 2 +-
 >  package/python-systemd/python-systemd.hash                   | 4 ++--
 >  package/python-urwid-readline/python-urwid-readline.hash     | 2 +-
 >  package/python-visitor/python-visitor.hash                   | 3 ++-
 >  package/python-webencodings/python-webencodings.hash         | 2 +-
 >  package/python-xlutils/python-xlutils.hash                   | 5 ++---
 >  36 files changed, 47 insertions(+), 43 deletions(-)

You were a bit too fast. Not all these packages are downloaded from pypi
or a post processed (E.G. the rust vendoring).

Committed with those dropped, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
