From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 16:59:15 +0200
Subject: [Buildroot] [PATCH] openssl: disable assembly for ARMv7M
In-Reply-To: <1466603248-29352-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 22 Jun 2016 10:47:28 -0300")
References: <1466603248-29352-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mvmdw9q4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It requires interwork and v7M is thumb-only. Fixes:
 > http://autobuild.buildroot.net/results/55d/55dc9d6826defd2c9048c2991019d4d573d34af4/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/openssl/openssl.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
 > index 2368aa9..b019785 100644
 > --- a/package/openssl/openssl.mk
 > +++ b/package/openssl/openssl.mk
 > @@ -34,7 +34,8 @@ OPENSSL_DEPENDENCIES += ocf-linux
 >  endif
 
 >  # Some architectures are optimized in OpenSSL
 > -ifeq ($(ARCH),arm)
 > +# Doesn't work for thumb-only (Cortex-M?)
 > +ifeq ($(ARCH)$(BR2_ARM_CPU_ARMV7M),arm)

We have BR2_ARM_CPU_HAS_ARM, so I changed it to use that and committed,
thanks.

-- 
Bye, Peter Korsgaard
