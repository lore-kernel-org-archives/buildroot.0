From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 00:05:32 +0200
Subject: [Buildroot] [PATCH] cppcms: fix build with ICU enabled,
 but CPPCMS_ICU disabled
In-Reply-To: <20170725184122.13076-1-thomas.petazzoni@free-electrons.com>
References: <20170725184122.13076-1-thomas.petazzoni@free-electrons.com>
Message-ID: <81de064c-2d9b-542a-995b-a617d1bef944@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-17 20:41, Thomas Petazzoni wrote:
> When the ICU package is enabled (BR2_PACKAGE_ICU=y) but ICU support in
> cppcms is disabled (BR2_PACKAGE_CPPCMS_ICU is disabled), cppcms still
> detects ICU, but it fails to build since we don't get the proper ICU
> CXXFLAGS.
> 
> In addition, this is not the intended behavior: when
> BR2_PACKAGE_CPPCMS_ICU is disabled, we except cppcms to be built
                                         ^^^^^^expect

> without ICU support.
> 
> To achieve this, we pass -DDISABLE_ICU_LOCALE=ON when
> BR2_PACKAGE_CPPCMS_ICU is disabled (yes DISABLE_ICU_LOCALE means the
> logic is inverted).
> 
> While at it, we pass DISABLE_ICU_LOCALE=OFF when ICU support is
> enabled, and not DISABLE_ICONV=ON. The latter has been passed in this
> condition since the cppcms package was introduced in Buildroot, but it
> doesn't seem to make sense.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b6a8c7000c5742efc9d8e13507dab86e36b62840/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Applied to master with that fixed, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
