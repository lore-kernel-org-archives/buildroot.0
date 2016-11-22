From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 16:49:17 +0100
Subject: [Buildroot] auto-detecting toolchain metadata?
In-Reply-To: <ca906326-1a51-56db-7411-dcf5408c9255@mentor.com>
References: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
 <20161101184626.GB30593@free.fr>
 <6e24245a-9c73-ea34-e899-f19f16346d0e@mentor.com>
 <20161122092919.502273aa@free-electrons.com>
 <ca906326-1a51-56db-7411-dcf5408c9255@mentor.com>
Message-ID: <20161122164917.3ee6e506@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 07:44:57 -0800, Hollis Blanchard wrote:

> My defconfig contains this:
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> 
> There are no other toolchain-related options (prefixed with 
> BR2_TOOLCHAIN or otherwise). Can you elaborate on why I can't just 
> replace these?

Hum, right we're talking only about external toolchains, and only about
a defconfig. So indeed, all options should start with
BR2_TOOLCHAIN_EXTERNAL_.

Still, I find a tool that replaces/edits stuff in an existing defconfig
to be somewhat confusing. Something that generates a defconfig fragment
seems a lot clearer to understand for new users.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
