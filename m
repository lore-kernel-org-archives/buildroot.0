From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 24 Apr 2020 15:11:08 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200424114813.GH5035@scaer>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
 <20200424090710.GA5035@scaer>
 <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
 <20200424113226.mhi7l3r46wluyu7v@einstein.dilieto.eu>
 <20200424114813.GH5035@scaer>
Message-ID: <20200424131108.ntkqvq7dlwgbsx6k@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 24, 2020 at 01:48:13PM +0200, Yann E. MORIN wrote:
>Until then, my opinion is that we should just stop building uacme with
>embedtls.

Please do not confuse the main binary uacme (which is perfecty OK and 
*does not* require the new TLS extension) with ualpn, a separate and 
optional binary recently added to the uacme distribution to answer 
tls-alpn-01 challenges (which requires the new TLS extension).

Building ualpn should actually be disabled by default in buildroot 
(check BR2_PACKAGE_UACME_UALPN in package/uacme/Config.in)

I propose making BR2_PACKAGE_UACME_UALPN depend on !BR2_PACKAGE_MBEDTLS.  
Would that be acceptable?
