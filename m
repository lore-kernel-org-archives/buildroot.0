From: Christopher Boumenot <boumenot@gmail.com>
Date: Mon, 30 May 2011 08:05:51 -0400
Subject: [Buildroot] Build Fails with ruby-1.9.2-p0
In-Reply-To: <BANLkTimm-3LX2S8-17VyPhuiaLqZC3m4jg@mail.gmail.com>
References: <BANLkTimm-3LX2S8-17VyPhuiaLqZC3m4jg@mail.gmail.com>
Message-ID: <BANLkTi=uKZXy-_8wZKoNA6ohoOvh2rsYOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I bisected from the last commit against the ruby package to tip, and it
appears that this commit broke the ruby build.  If I revert it on tip, it
builds just fine.


commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Fri Apr 29 15:40:58 2011 +0200

    package/Makefile.in: CFLAGS/LDFLAGS: don't add -I / -L args for
STAGING_DIR

    Now that we use sysroot for all toolchains, the explicit -I / -L
arguments
    in CFLAGS / LDFLAGS aren't needed anymore (And having them makes the
build
    quite noisy for certain packages as STAGING_DIR/include normally doesn't
    exist).

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>



Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110530/499ff35e/attachment.html>
