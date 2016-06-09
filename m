From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu,  9 Jun 2016 16:46:14 +0200
Subject: [Buildroot] [RFC/PATCH next 2/2] couchdb: New package.
In-Reply-To: <20160520162929.04ca1b1b@free-electrons.com>
References: <20160520162929.04ca1b1b@free-electrons.com>
Message-ID: <1465483576-28267-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Do we want to package couchdb ? :-)

In case you still do, here's an updated version of the patches.

Couchdb 2.0 is way to immature to attempt to package it now: --prefix
does not work and is hardwired to '.', there is no "make install",
it depends on unreleased libraries...  So even with a self-built tarball,
it's still not ready for being packaged.

I've somewhat test compiled spidermonkey on several architectures where
debian's patches implied there would be problem and fixed them by taking
patches from upstream.  I also addressed the minor nits on Couchdb 1.6.1.
