From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Jun 2017 17:29:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdbm: fix build error
References: <20170604220950.22746-1-bernd.kuhls@t-online.de>
 <20170605101420.2c585336@free-electrons.com>
Message-ID: <c0ag0ex6ur.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 05 Jun 2017 10:14:20 +0200 schrieb Thomas Petazzoni:

> Missing header include? __USE_UNIX98 not defined?

Hi Thomas,

I tried __USE_UNIX98, but it did not work because it gets unset in 
https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/tree/include/
features.h#n105

It seems we need something else: http://patchwork.ozlabs.org/patch/771300/

Regards, Bernd
