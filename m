Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9A3C77B7A
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 09:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039764042B;
	Wed, 31 May 2023 09:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 039764042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MarWE065JNCG; Wed, 31 May 2023 09:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3D1A40168;
	Wed, 31 May 2023 09:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D1A40168
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42C181BF25F
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 09:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 144D2410D1
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 09:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 144D2410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqYLBH4wOa-q for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 09:30:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2113840985
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2113840985
 for <buildroot@buildroot.org>; Wed, 31 May 2023 09:29:59 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBB98FF802;
 Wed, 31 May 2023 09:29:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q4I9T-00AGpz-Qz; Wed, 31 May 2023 11:29:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Chris Packham <judge.packham@gmail.com>
References: <6471963e.df0a0220.90218.04d6SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZCy4CO+Db++9iEDQMRh58STDiLKDU1KRQLEEdCNz6W4WQ@mail.gmail.com>
Date: Wed, 31 May 2023 11:29:55 +0200
In-Reply-To: <CAFOYHZCy4CO+Db++9iEDQMRh58STDiLKDU1KRQLEEdCNz6W4WQ@mail.gmail.com>
 (Chris Packham's message of "Sun, 28 May 2023 13:54:11 +1200")
Message-ID: <87r0qwg86k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] syslog-ng failures related to python modules
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > Hi All,
 > I've had some time to look into failures like

 >> powerpc64   |        syslog-ng-4.1.1         | http://autobuild.buildroot.net/results/e9d3aee88c6da2a490c349e218adbaa5ea826d27

 > The failure is

 > WARNING: There was an error checking the latest version of pip.
 > WARNING: pip is configured with locations that require TLS/SSL,
 > however the ssl module in Python is not available.
 > WARNING: Retrying (Retry(total=4, connect=None, read=None,
 > redirect=None, status=None)) after connection broken by
 > 'SSLError("Can't connect to HTTPS URL because the SSL module is not
 > available.")': /simple/cachetools/
 > WARNING: Retrying (Retry(total=3, connect=None, read=None,
 > redirect=None, status=None)) after connection broken by
 > 'SSLError("Can't connect to HTTPS URL because the SSL module is not
 > available.")': /simple/cachetools/
 > WARNING: Retrying (Retry(total=2, connect=None, read=None,
 > redirect=None, status=None)) after connection broken by
 > 'SSLError("Can't connect to HTTPS URL because the SSL module is not
 > available.")': /simple/cachetools/
 > WARNING: Retrying (Retry(total=1, connect=None, read=None,
 > redirect=None, status=None)) after connection broken by
 > 'SSLError("Can't connect to HTTPS URL because the SSL module is not
 > available.")': /simple/cachetools/
 > WARNING: Retrying (Retry(total=0, connect=None, read=None,
 > redirect=None, status=None)) after connection broken by
 > 'SSLError("Can't connect to HTTPS URL because the SSL module is not
 > available.")': /simple/cachetools/
 > Could not fetch URL https://pypi.org/simple/cachetools/: There was a
 > problem confirming the ssl certificate:
 > HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded
 > with url: /simple/cachetools/ (Caused by SSLError("Can't connect to
 > HTTPS URL because the SSL module is not available.")) - skipping
 > ERROR: Could not find a version that satisfies the requirement
 > cachetools==4.2.4 (from versions: none)
 > ERROR: No matching distribution found for cachetools==4.2.4
 > WARNING: pip is configured with locations that require TLS/SSL,
 > however the ssl module in Python is not available.
 > Could not fetch URL https://pypi.org/simple/pip/: There was a problem
 > confirming the ssl certificate: HTTPSConnectionPool(host='pypi.org',
 > port=443): Max retries exceeded with url: /simple/pip/ (Caused by
 > SSLError("Can't connect to HTTPS URL because the SSL module is not
 > available.")) - skipping


 > The basic problem is that the newer version of syslog-ng has some
 > additional python dependencies but its install process can't resolve
 > the dependencies.

 > I can see the problem with the following (after a failed build)

 > $ . output/build/syslog-ng-4.1.1/venv/bin/activate
 > $ python3 -m ssl
 > Traceback (most recent call last):
 >   File "<frozen runpy>", line 198, in _run_module_as_main
 >   File "<frozen runpy>", line 88, in _run_code
 >   File "/home/chrisp/src/buildroot/output/host/lib/python3.11/ssl.py",
 > line 100, in <module>
 >     import _ssl             # if we can't import it, let the error propagate
 >     ^^^^^^^^^^^
 > ModuleNotFoundError: No module named '_ssl'

 > It looks like something (not sure what) has conveniently setup a host
 > python wrapper (this config doesn't build host python3)

BR2_PACKAGE_PYTHON3 implies host-python3.

 > but however it was populated it did not include the _ssl module
 > (which looking on my system is a dynamically loaded .so). I'm a
 > little unsure as to how to proceed with this. I could unconditionally
 > disable python support in syslog-ng or make it depend on host python3
 > but I suspect this isn't the only package that is doing such things
 > so I thought there might be a better solution.

The fact that it is invoking pip to download extra dependencies makes it
sound as if we are missing some python dependencies. In the context of
Buildroot, a package should not invoke pip.

Looking at the code, it seems to come from scripts/build-python-venv.sh
which uses {dev-,}requirements.txt. It is not quite clear to me which
dependencies are needed at build time for the host and which are needed
at runtime for the target though.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
