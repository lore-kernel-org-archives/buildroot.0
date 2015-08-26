From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 15:28:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] packages/linux-pam: disable when
 using musl
In-Reply-To: <1440109933-6123-1-git-send-email-brendanheading@gmail.com>
References: <1440109933-6123-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150826152842.1fb22ddd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Thu, 20 Aug 2015 23:32:13 +0100, Brendan Heading wrote:
> Fixes: http://autobuild.buildroot.net/results/e33/e337d69420ad00b2cc4017d639a31803926f2353/
> 
> linux-pam needs some surgery to build under musl, so for the time being
> disable it until the issues are solved. Also disables dependent package
> python-pam, and dependent suboptions under openvmtools, rsh-redone and
> util-linux.
> 
> ---
> v1 -> v2 - added missing comments to document that packages require
> non-musl (ie uclibc or (e)glibc) toolchains.
> ---
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

Your SoB line should be before the first "---" otherwise it gets
stripped by Git when applying.


> +	depends on !BR2_TOOLCHAIN_USES_MUSL	# linux-pam

We use a space before the comment, not a tab.

I've applied to master after fixing those minor nits.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
