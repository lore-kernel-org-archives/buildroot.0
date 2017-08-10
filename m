From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 22:06:55 +0200
Subject: [Buildroot] ci20_defconfig fails because of missing TLS support
Message-ID: <d32e5a1d-aa99-f189-bdfc-5d10b10c1eda@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Vicente, Waldemar,

 Since some time (probably since some uClibc bump), the ci20_defconfig has been
failing with an error I don't really understand [1]:

> /usr/bin/make -j3 -C /builds/buildroot.org/buildroot/output/build/uclibc-1.0.25 ARCH="mips" CROSS_COMPILE="/builds/buildroot.org/buildroot/output/host/bin/mipsel-buildroot-linux-uclibc-" UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc"
> make[1]: Entering directory '/builds/buildroot.org/buildroot/output/build/uclibc-1.0.25'
> mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> mipsel-buildroot-linux-uclibc-gcc.br_real: warning: '-mfused-madd' is deprecated; use '-ffp-contract=' instead
> ####
> #### Your compiler does not support TLS and you are trying to build uClibc-ng
> #### with NPTL support. Upgrade your binutils and gcc to versions which
> #### support TLS for your architecture. Do not contact uClibc-ng maintainers
> #### about this problem.
> ####
> #### Exiting...
> ####
> Rules.mak:689: recipe for target 'gcc_tls_test_fail' failed
> make[1]: *** [gcc_tls_test_fail] Error 1
> make[1]: Leaving directory '/builds/buildroot.org/buildroot/output/build/uclibc-1.0.25'


 Could you guys have a look, so we can hopefully get a fix in 2017.08?

 Regards,
 Arnout


[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/27873603


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
