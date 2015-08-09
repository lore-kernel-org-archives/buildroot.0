From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:19:24 +0200
Subject: [Buildroot] [PATCH] haveged: for sparc we need generic
 clockgettime
In-Reply-To: <20150809084740.GA19849@waldemar-brodkorb.de>
References: <20150809084740.GA19849@waldemar-brodkorb.de>
Message-ID: <20150809111924.2f1314e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 9 Aug 2015 10:47:40 +0200, Waldemar Brodkorb wrote:
> This fixes autobuilder error:
> http://autobuild.buildroot.net/results/5b8bbc30f347140309ab2f81e1fe50f517356a3e/
> 
> As sparcv9 assembly is used, we need to enable generic clock_gettime
> for sparcv8 systems.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/haveged/haveged.mk |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index c68f766..489564a 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -9,6 +9,10 @@ HAVEGED_SITE = http://www.issihosts.com/haveged
>  HAVEGED_LICENSE = GPLv3+
>  HAVEGED_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_sparc),y)

So this should be:

ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)

Right? We indeed don't support any SPARCv9 at the moment, but it's
probably better to be more specific. What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
