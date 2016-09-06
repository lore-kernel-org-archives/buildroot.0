From: Nicholas Walton <nicholas.walton@gmail.com>
Date: Tue, 06 Sep 2016 18:53:28 +0000
Subject: [Buildroot] [PATCH] package/binutils: Disable -Os for Thumb-2
 only platforms
In-Reply-To: <CAKXOQBx=jhz+8464896oWub0JzFuvRvGFfgwTwF6KkcjVVXkzQ@mail.gmail.com>
References: <1472978990-14884-1-git-send-email-romain.naour@gmail.com>
 <20160904144314.2dd0f130@free-electrons.com>
 <CAKXOQBx=jhz+8464896oWub0JzFuvRvGFfgwTwF6KkcjVVXkzQ@mail.gmail.com>
Message-ID: <CAKXOQBz6bodbdaeygsxnD9H++c8sRNB4GDq-QW2A3hOdfqEG3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please disregard my previous message:

On Sun, Sep 4, 2016 at 10:52 AM Nicholas Walton <nicholas.walton@gmail.com>
wrote:

> I found a bug report about a similar error in a different package, and I
> saw it on a non-Thumb-2 platform (ARM9).
>

The error I was remembering was bad code generation causing a segfault
(which I saw in libfb.so). Restricting xserver_xorg-server to -O2
(5500211e201f84b6e2ce0dd5ff3013fb92628860)
fixed it. I suspect the root cause was related to *Bug 63346*
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63346> -
"xserver_xorg-server-1.15.1
crash on RaspberryPi . . . gcc-4.9", and/or* Bug 69614*
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69614> - "[4.9/5 Regression]
wrong code with -Os -fno-expensive . . . @ armv7a". Bug 69614 is fixed in
6.0 and the patch was backported to 5, but not to 4.9.

Apologies,
Nicholas Walton
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160906/cbfe59a1/attachment.html>
