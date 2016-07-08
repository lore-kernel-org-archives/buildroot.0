From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 20:24:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/audit: Bump to version 2.6.4
In-Reply-To: <1467997286-20425-1-git-send-email-Aduskett@gmail.com>
References: <1467997286-20425-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160708202450.5b9409e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jul 2016 13:01:26 -0400, Adam Duskett wrote:
> Also removed 0002-Fix-usage-of-audit_status.feature_bitmap.patch as this was
> applied upstream.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks, I was about to send a similar patch.

> ---
>  ...-Fix-usage-of-audit_status.feature_bitmap.patch | 59 ----------------------

Don't you also need to remove patch 0001 ? I believe the EHWPOISON has
been fixed upstream (audit's maintainer has merged my patch).

> -AUDIT_VERSION = 2.6.3
> +AUDIT_VERSION = 2.6.4
>  AUDIT_SITE = http://people.redhat.com/sgrubb/audit
>  AUDIT_LICENSE = GPLv2
>  AUDIT_LICENSE_FILES = COPYING

Please also remove the AUTORECONF = YES line, which has become
unnecessary since we're no longer patching configure.ac/Makefile.am.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
