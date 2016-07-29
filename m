From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jul 2016 09:32:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
 <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
Message-ID: <20160729093218.36d66c86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 15:04:18 -0700, Khem Raj wrote:

> >> -HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
> >> +HOST_CPPFLAGS  = -isystem $(HOST_DIR)/usr/include  
> 
> This is quite intrusive change. avoid -isystems since it interferes with the
> default include ordering of gcc and will cause compile failure since it wont
> be able to find headers in some cases. So many packages will fail to build.
> especially gcc-6.x will hit hard

Can you give some more details? Did you look at the original commit log
for this change? It pointed out some real problems when using -I, which
in theory should be resolved by using -isystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
