From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 17:00:53 +0200
Subject: [Buildroot] [PATCH 3/3] package/strace: enable demangling of
 C++ symbol names in stack trace
In-Reply-To: <20180225183415.8362-3-romain.naour@gmail.com>
References: <20180225183415.8362-1-romain.naour@gmail.com>
 <20180225183415.8362-3-romain.naour@gmail.com>
Message-ID: <20180520170053.36c5759d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Feb 2018 19:34:15 +0100, Romain Naour wrote:

>  ...1-configure-allow-autoreconf-from-tarball.patch | 36 ++++++++++++++++++++++
>  ...0002-configure-fix-libiberty-header-check.patch | 33 ++++++++++++++++++++

In fact those patches are not necessary if you pass
--with-libiberty=check. In this case, it doesn't fail at the first
demangle.h check, and moves on to the next header file location.

So I've fixed that up, dropped the patches and AUTORECONF = YES, and
applied to next. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
