From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Feb 2017 16:04:33 +0200
Subject: [Buildroot] [PATCH 5/5] ntp: bump to version 4.2.8p9
In-Reply-To: <20170206140012.1029-5-aduskett@codeblue.com>
References: <20170206140012.1029-1-aduskett@codeblue.com>
 <20170206140012.1029-5-aduskett@codeblue.com>
Message-ID: <20170206140433.uffglljnxtisy7le@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Mon, Feb 06, 2017 at 09:00:12AM -0500, Adam Duskett wrote:
> This version of ntp fixes several vulnerabilities.

Subject should mention that this is a security bump.

> CVE-2016-9311
> CVE-2016-9310
> CVE-2016-7427
> CVE-2016-7428
> CVE-2016-9312
> CVE-2016-7431
> CVE-2016-7434
> CVE-2016-7429
> CVE-2016-7426
> CVE-2016-7433
> 
> http://www.kb.cert.org/vuls/id/633847
> 
> In addition, libssl_compat.h is now included in many files, which
> references openssl/evp.h, openssl/dsa.h, and openssl/rsa.h.
> Even if a you pass --disable-ssl as a configuration option, these
> files are now required.
> 
> As such, I have also added openssl as a dependency, and it is now
> automatically selected when you select ntp.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

[snip]

> @@ -23,7 +23,6 @@ NTP_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)

BR2_PACKAGE_OPENSSL is now always enabled, so there is no need to check if 
it's enabled.

>  NTP_CONF_OPTS += --with-crypto
> -NTP_DEPENDENCIES += openssl
>  else
>  NTP_CONF_OPTS += --without-crypto --disable-openssl-random
>  endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
