From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:23:25 +0100
Subject: [Buildroot] [PATCH v7 1/1] libcpprestsdk: new package
In-Reply-To: <20171230231328.3299abdc@windsurf>
References: <20171230191655.32606-1-Adamduskett@outlook.com>
 <20171230231328.3299abdc@windsurf>
Message-ID: <20171231172325.6a0ef08f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 23:13:28 +0100, Thomas Petazzoni wrote:

> Interestingly, it is the same error I had when building opentracing-cpp
> with the same toolchain. Building with the Linaro ARM toolchain works
> fine however.
> 
> Could you test this package with ./utils/test-pkg before submitting the
> next version ?

Since Jan Heylen had the same problem on opentracing-cpp, he
investigated it. It turns out that you need to make your package
"depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735" to avoid a gcc bug.

Could you resubmit with this change ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
