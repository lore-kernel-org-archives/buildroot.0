From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 24 Apr 2020 01:27:58 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200423220905.06d9dc59@windsurf.home>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
Message-ID: <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 23, 2020 at 10:09:05PM +0200, Thomas Petazzoni wrote:
>
>What is this X509_UNSUPPORTED_CRITICAL_EXTENSION functionality that is
>so weird that it requires patching the mbedtls config.h file ? Why is
>uacme absolutely requiring this functionality that no other user of
>mbedtls requires ?
>

There is an explanation at
https://github.com/ndilieto/uacme/issues/23

Briefly, tls-alpn-01 validation requires (as per RFC8737 section 6.1) a 
new critical certificate extension. mbedTLS doesn't know about it and 
refuses to parse any certificate with such extension unless that build 
feature is enabled.
