From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:50:38 +0100
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
 timeconst.pl
In-Reply-To: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160207155038.7b3fcb0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Feb 2016 10:41:48 -0300, gustavo.zacarias at free-electrons.com
wrote:

> +# Older linux kernels use deprecated perl constructs in timeconst.pl
> +# that were removed for perl 5.22+ so it breaks on newer distributions
> +# Try a dry-run patch to see if this applies, if it does go ahead
> +define LINUX_TRY_PATCH_TIMECONST
> +	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional >/dev/null ; then \
> +		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional ; \
> +	fi
> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST

I really don't like this hack, but I am not sure to see a better
solution. So I'll leave a few days before applying to see if other
people chime in with other comments/suggestions, and if nobody
comments, I'll apply.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
