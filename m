From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 24 Apr 2020 13:32:26 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
 <20200424090710.GA5035@scaer>
 <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
Message-ID: <20200424113226.mhi7l3r46wluyu7v@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 24, 2020 at 01:26:39PM +0200, Nicola Di Lieto wrote:
>>
>>I think we should refuse to use mbedtls with uacme.
>
>I agree, at least until mbedTLS changes its approach.

Just to clarify. It's sufficient to disable building ualpn at configure 
stage with --without-ualpn. The main binary uacme is fine, even without 
unsupported critical extensions in mbedTLS.
