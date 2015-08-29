From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 14:49:34 +0200
Subject: [Buildroot] [PATCH/next 08/10] package/libopenh264: new package
In-Reply-To: <1439317015-8031-9-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-9-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829144934.27e138be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 11 Aug 2015 20:16:53 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                  |  1 +
>  package/libopenh264/Config.in      | 22 ++++++++++++++++++++
>  package/libopenh264/libopenh264.mk | 42 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
>  create mode 100644 package/libopenh264/Config.in
>  create mode 100644 package/libopenh264/libopenh264.mk

Applied to next, after doing a number of changes:

    [Thomas:
      - make the license info more specific: it's BSD-2c, not just BSD.
      - use a single conditional block to test the architecture, instead
        of multiple separate conditions.
      - add missing arm/armeb handling in the architecture condition.
      - make the host-nasm dependency only used on x86/x86-64, since it's
        not used for other architectures
      - group the ARCH= and ENABLE64BIT= make variable definitions in a
        LIBOPENH264_MAKE_OPTS variable, and use them at install time (in
        addition to build time) to avoid build issues.
      - wrap too long lines in the .mk file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
