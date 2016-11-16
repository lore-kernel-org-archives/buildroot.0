From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 13:12:31 +0100
Subject: [Buildroot] [PATCH] package/e2fsprogs: backport build fix for
 rhel5 due to missing magic
In-Reply-To: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
References: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161116131231.20069c38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 23:39:02 -0800, Max Filippov wrote:
> RHEL 5.x does have magic.h, but it does not define all expected symbols. In
> particular, the NO_CHECK symbols were only added in file 4.20 and RHEL 5.x
> is using 4.17.
> 
> Add substitute defines to allow continued usage of magic but without the
> requested exclude checks.
> 
> Backported from: b003b2e6f9e54e7b2bde15828b97f5dc285b915e
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Can you try:

E2FSPROGS_CONF_ENV += \
	ac_cv_header_magic_h=no \
  	ac_cv_lib_magic_magic_file=no

instead of this patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
