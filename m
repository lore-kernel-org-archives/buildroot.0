From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:15:45 +0200
Subject: [Buildroot] [PATCH 1/7] libidn2: new package
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520161545.7ca05e2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 22:40:32 +0200, Fabrice Fontaine wrote:
> Libidn2 is an implementation of the IDNA2008 + TR46
> specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
> TR 46).
> 
> http://www.gnu.org/software/libidn/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/libidn2/Config.in    | 17 +++++++++++++++++
>  package/libidn2/libidn2.hash |  8 ++++++++
>  package/libidn2/libidn2.mk   | 29 +++++++++++++++++++++++++++++
>  5 files changed, 56 insertions(+)
>  create mode 100644 package/libidn2/Config.in
>  create mode 100644 package/libidn2/libidn2.hash
>  create mode 100644 package/libidn2/libidn2.mk

I've applied the entire series to next. I've made a few changes, so
I'll comment on the two patches on which I did changes.

On this patch, here are the changes I made:

    [Thomas:
     - Use positive logic to test the BR2_PACKAGE_LIBIDN2_BINARY
       condition.
     - Put the definition of LIBIDN2_REMOVE_BINARY inside the
       BR2_PACKAGE_LIBIDN2_BINARY condition, as suggested by Arnout.
     - Adjust license details: library is under GPL-2.0+ or LGPL-3.0+,
       while the command line tool is under GPL-3.0+.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
