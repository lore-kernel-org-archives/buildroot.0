From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Tue, 1 Sep 2020 00:14:30 +0800
Subject: [Buildroot] [PATCH] libcap: disable GOLANG
In-Reply-To: <873642deyy.fsf@dell.be.48ers.dk>
References: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com>
 <873642deyy.fsf@dell.be.48ers.dk>
Message-ID: <d1e0d62f-098d-4dbb-037a-8f827772dd1e@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is for the next branch.

Recently, the go infrastructure has changed, and libcap has been
upgraded to 2.42. libcap introduced golang in 2.28, see:

https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/Make.Rules?id=0615d996379dceedefcd65a114f93fefd81c208f

When you compile host-go and then compile host-libcap, GOLANG will be
automatically set to yes. Because libcap.mk lacks golang support,
compilation will fail.

 > > libcap is a pure C library before 2.27, it lacks some environment
 > > variables set in pkg-golang.mk.
 >
 > Can you be more specific? What exactly is this fixing? I don't see
 > any related autobuilder errors?
 >
 > http://autobuild.buildroot.net/?reason=libcap-2.27
 >
 > And I don't see any reference to GOLANG in libcap-2.27?
