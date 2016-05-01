From: Christian Stewart <christian@paral.in>
Date: Sun, 01 May 2016 03:43:58 +0000
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <20160430140314.4ff30ff1@free-electrons.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <20160421224301.6a05f711@free-electrons.com>
 <1461965160.27026.9.camel@infradead.org>
 <20160430140314.4ff30ff1@free-electrons.com>
Message-ID: <1462074238901-b9436b8a-0eb718e2-8f9a915c@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geoff, Thomas,

On Sat, Apr 30, 2016 at 8:03 AM Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote: > Hum, I'm looking at this repository, and I see only 3 branches, and none of them seem to contain things that look like fixes. Did I miss something?
If I try to directly compile something that references Go, it seems that Go does
not have the cross compiler as a dependency in the Makefile tree.
# runtime/cgo fork/exec
/home/paralin/Documents/skiffos/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc:
no such file or directory
Indeed, the cross compiler toolchain is NOT compiled before Go. I think a
dependency needs to be added for this.
Thanks, Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160501/a2286545/attachment.html>
