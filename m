From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 6 Aug 2015 20:59:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/empty - fix build failure
In-Reply-To: <1438703581-25996-1-git-send-email-brendanheading@gmail.com>
References: <1438703581-25996-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150806185956.GK8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,
Brendan Heading wrote,

> Fixes http://autobuild.buildroot.net/results/e07/e07aec9a839e89b7452b13bf5445164530e27414/
> 
> "empty" fails to build if _POSIX_SEMAPHORES is not defined, which is the
> case on a toolchain with no threading support.

Threads are not required for SysV semaphores. I have sent a patch
fixing the build with a toolchain without threads, but I got no
response on that.

http://patchwork.ozlabs.org/patch/493343/

best regards
 Waldemar
