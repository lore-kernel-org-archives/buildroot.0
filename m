From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 23:34:24 +0100
Subject: [Buildroot] [PATCH] libmicrohttpd: disable on avr32
In-Reply-To: <1384115595-13780-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 10 Nov 2013 20:33:15 +0000")
References: <1384115595-13780-1-git-send-email-spdawson@gmail.com>
Message-ID: <8761rzdgy7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

> From: Simon Dawson <spdawson@gmail.com>
> The epoll_create1 syscall is not available on avr32. Fixes build failures
> such as the following.

>   http://autobuild.buildroot.net/results/dbd/dbdc86321c6c85703dd9aed3f974843203124d92

> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Thanks, but:

grep epoll output/build/libmicrohttpd-0.9.31/README
--disable-epoll: no support for epoll, even on Linux

So I've instead committed a patch adding that configure option for
avr32.

-- 
Bye, Peter Korsgaard
