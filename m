From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 14:46:33 +0100
Subject: [Buildroot] [PATCH] libvips: requires C++ support
In-Reply-To: <1423143748-63093-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423143748-63093-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150205144633.06790e8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 5 Feb 2015 13:42:28 +0000, Vicente Olivert Riera wrote:
> libvips requires C++ support, otherwise it will fail with an error
> message like this one:
> 
> error: ../libvips/.libs/libvips.so: No such file or directory
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/cdc7cf5d3501f80c74b70aa09f93b2ad4e2f8602/
>   http://autobuild.buildroot.net/results/39173dbcbbd0a243900ea583cec024b51f8b803a/
>   http://autobuild.buildroot.net/results/6794705195bcdb636a8e6582ef5a1e153d4d66b3/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

This doesn't make sense with the contents of libvips.mk:

ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
LIBVIPS_CONF_OPTS += --enable-cxx
else
LIBVIPS_CONF_OPTS += --disable-cxx
endif

So either we can disable C++, and your patch is not correct. Or
disabling C++ doesn't work, and your patch should be amended to remove
the BR2_INSTALL_LIBSTDCPP condition.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
