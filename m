From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:46:11 +0100
Subject: [Buildroot] [PATCH] openswan: disable for static builds
In-Reply-To: <1425490133-51779-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425490133-51779-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150304224611.5f765059@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 4 Mar 2015 17:28:53 +0000, Vicente Olivert Riera wrote:
> openswan is built with -fPIE which produces shared objects, and shared
> objects need "/lib/ld.so" which won't be present on a statically built
> target. So, building openswan with -static -fPIE is invalid and will
> fail with an error like this one:

Did you see that -fPIE is in fact explicitly passed by Buildroot in
openswan.mk ? So most likely, all what you need to do is to make sure
to pass -fPIE only if BR2_STATIC_LIBS is disabled.

I'll mark this patch as Changes Requested in patchwork. Please submit a
new version that doesn't pass -fPIE when not needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
