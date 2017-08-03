From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 3 Aug 2017 07:48:28 +0200
Subject: [Buildroot] buildroot uClibc-ng build failure
Message-ID: <20170803054828.GB7682@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

we are seeing a build error on your machine when
locales in uClibc-ng are enabled:
http://autobuild.buildroot.net/results/d5b/d5ba81eea9223569ba5b363551c4a2f7044ff8ec/

Can you show us locale -a from your machine?

For a working tolower(), the uClibc-ng code needs to use setlocale
on the host.

But it seems only these are tried to use:
en_US en_US en_GB

best regards
 Waldemar
