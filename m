From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:54:01 +0200
Subject: [Buildroot] [PATCH v2] iproute2: fix static build with uClibc
In-Reply-To: <bfb13bad98d6d1680e521228b337ea0fae7d500e.1506622600.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 28 Sep 2017 21:16:40 +0300")
References: <bfb13bad98d6d1680e521228b337ea0fae7d500e.1506622600.git.baruch@tkos.co.il>
Message-ID: <878tgyilxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Version 4.13 added a local definition of strlcpy(). This clashes with
 > the uClibc provided one when linking statically. Add a patch that
 > detects libc provided strlcpy(), and avoids the multiple definition.

 > Fixes:
 > http://autobuild.buildroot.net/results/f34/f34684dcdb47938a3da8b00c8b29000cc23b4e3d/
 > http://autobuild.buildroot.net/results/a01/a01c5775945f5ffe75451722b676fc93333a0f14/
 > http://autobuild.buildroot.net/results/0ee/0eeab1a0ca943f9a035a0d458ddf9cc210bc87f4/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Fix order of strlcpy parameters in the patch as noted in upstream
 >     review

Committed, thanks.

-- 
Bye, Peter Korsgaard
