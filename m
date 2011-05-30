From: Christopher Boumenot <boumenot@gmail.com>
Date: Mon, 30 May 2011 10:35:44 -0400
Subject: [Buildroot] Build qt failed after update to 2011.05
In-Reply-To: <BANLkTikfUw4jOL6zYGxdqbFyWT+pjV7X3w@mail.gmail.com>
References: <BANLkTikfUw4jOL6zYGxdqbFyWT+pjV7X3w@mail.gmail.com>
Message-ID: <BANLkTimquVO2HCyVDp4ekXJGGL+vGDTkAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 30, 2011 at 3:47 AM, Bob Liu <lliubbo@gmail.com> wrote:

> Hi, folks
>
> After I updated to 2011.05 release, I failed to build qt.
>
> [snip]


> Any ideas is welcome, Thanks!
>
>
I figured if it worked for ruby it would work for qt.  I was able to build
with this commit reverted.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110530/24ad9eb0/attachment.html>
