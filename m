From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 14:42:36 +0200
Subject: [Buildroot] [PATCH] faad2: security bump to version 2.8.1
In-Reply-To: <108fe39722b22a67f7737d6e174dc8483c784b95.1502254922.git.baruch@tkos.co.il>
References: <108fe39722b22a67f7737d6e174dc8483c784b95.1502254922.git.baruch@tkos.co.il>
Message-ID: <a11dd81d-70f5-47d8-d612-65e188498de5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Baruch,

On 09-08-17 07:02, Baruch Siach wrote:
> Fixes: CVE-2017-9218, CVE-2017-9219, CVE-2017-9220, CVE-2017-9221,
> CVE-2017-9222, CVE-2017-9223, CVE-2017-9253, CVE-2017-9254,
> CVE-2017-9255, CVE-2017-9256, CVE-2017-9257
> 
> http://seclists.org/fulldisclosure/2017/Jun/32
[snip]
> -FAAD2_VERSION = 2.7
> -FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION)
> +FAAD2_VERSION_MAJOR = 2.8
> +FAAD2_VERSION = $(FAAD2_VERSION_MAJOR).1

 Hm, "security bumps" are typically only affecting the minor version number,
this smells like a major bump... Or does faad have a slightly unconventional
version numbering scheme?

> +FAAD2_SITE = http://downloads.sourceforge.net/project/faac/faad2-src/faad2-$(FAAD2_VERSION_MAJOR).0
> +FAAD2_SOURCE = faad2-$(FAAD2_VERSION).tar.bz2

 Gah, what kind of stupid download URL is that :-)

 Regards,
 Arnout

>  FAAD2_LICENSE = GPL-2.0
>  FAAD2_LICENSE_FILES = COPYING
> +# No configure script in upstream tarball
> +FAAD2_AUTORECONF = YES
>  # frontend/faad calls frexp()
>  FAAD2_CONF_ENV = LIBS=-lm
>  FAAD2_INSTALL_STAGING = YES
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
