From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Mar 2017 00:19:18 +0200
Subject: [Buildroot] [PATCH 15/21] freeswitch: use SPDX short identifier
 for license strings
In-Reply-To: <1490881430-10434-16-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-16-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <859ce539-de85-64e6-6b04-d1e3ffb04d29@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 15:43, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

 Quick comment on this one...

 First of all, I think it's a very good idea to have first the fully automatic
patches, and then do remaining fixups like this one.

 However, I think there is still a lot more to be fixed up. There are also
plenty of places where we refer to (L)GPLv[23] in e.g. comments. So instead of
this patch, I would add a series of patches that uses the same (or maybe
slightly more generic) sed expressions but now doesn't limit to _LICENSE or to
.mk files. I did a quick check, there are about 25 instances of GPLv left, but
you need to filter out patches and _LICENSE_FILES, so perhaps an automatic sed
expression is going to be difficult.

 Anyway, my message is: those 25 remaining instances should be replaced as well.

 Regards,
 Arnout

> ---
>  package/freeswitch/freeswitch.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index 32439b8..0ce67f0 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -8,11 +8,11 @@ FREESWITCH_VERSION = 1.6.15
>  FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
>  FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
>  FREESWITCH_LICENSE = MPL-1.1, \
> -	GPLv3+ with font exception (fonts), \
> +	GPL-3.0+ with font exception (fonts), \
>  	Apache-2.0 (apr, apr-util), \
> -	LGPLv2+ (sofia-sip), \
> -	LGPLv2.1, GPLv2 (spandsp), \
> -	BSD-3c (libsrtp), \
> +	LGPL-2.0+ (sofia-sip), \
> +	LGPL-2.1, GPL-2.0 (spandsp), \
> +	BSD-3-Clause (libsrtp), \
>  	tiff license
>  
>  FREESWITCH_LICENSE_FILES = \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
