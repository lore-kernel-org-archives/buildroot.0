From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 09:57:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: add libidn2 support
In-Reply-To: <20190620162324.20019-1-fontaine.fabrice@gmail.com>
References: <20190620162324.20019-1-fontaine.fabrice@gmail.com>
Message-ID: <20190622095727.05ea91a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 18:23:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libidn2 is preferred over libidn, see src/util.c:
>  #if defined(HAVE_LIBIDN2)
>  #include <idn2.h>
>  #elif defined(HAVE_IDN)
>  #include <idna.h>
>  #endif
> 
> So select libidn2 if libidn is not enabled
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dnsmasq/Config.in  | 2 +-
>  package/dnsmasq/dnsmasq.mk | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
