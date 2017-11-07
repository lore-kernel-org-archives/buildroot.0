From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 18:26:20 +0100
Subject: [Buildroot] [V2 1/1] ntp: security bump to verserion 4.2.8p9
In-Reply-To: <20170206141225.2311-1-aduskett@codeblue.com>
References: <20170206141225.2311-1-aduskett@codeblue.com>
Message-ID: <20171107182620.3c8df7ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 09:12:25 -0500, Adam Duskett wrote:
> This version of ntp fixes several vulnerabilities.
> 
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

This patch raised a comment on Github:
https://github.com/buildroot/buildroot/commit/ebf6f64b76059e31a85f982cb04f80ad5982dac3#commitcomment-25458671.
Apparently, building without OpenSSL is still possible (perhaps has
been fixed in 4.2.8p10 ?), and some users would like ntp without
OpenSSL support.

Adam, could you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
