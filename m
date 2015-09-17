From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 17 Sep 2015 19:42:10 +0200
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting
 SSP under uclibc-ng
In-Reply-To: <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
References: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
 <20150917191421.53dd3542@free-electrons.com>
 <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
Message-ID: <20150917174210.GH8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Brendan Heading wrote,

> Aside from that .. GCC actually already has a block which checks
> UCLIBC_HAS_SSP. The problem is that it reaches it only if the glibc
> version check returns that the version is 2.3 or lower. The fix might
> simply be to reorder the check.
> 
> I'm curious why GCC have done this rather than doing a check for the
> __stack_chk symbols. Would be interested in hearing from Alexey and
> Waldemar.

I vote for the GCC patch, if there is already a __UCLIBC_HAS_SSP__
check.

best regards
 Waldemar
