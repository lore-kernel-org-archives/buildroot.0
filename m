From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 31 Jan 2016 23:30:25 +0100
Subject: [Buildroot] [PATCH 02/16 v3] toolchain/external: add hashes for
 actual sources
In-Reply-To: <1aaa41e84c4084331e638ac19c10017d6ad30268.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <1aaa41e84c4084331e638ac19c10017d6ad30268.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <56AE8B01.1080205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-01-16 19:15, Yann E. MORIN wrote:
> As we currently download the actual sources as part of saving the
> legal-info, we do not check the hashes of those downloads.
> 
> That's because, during legal-info, there is not package involved, and
> thus there's no path to an actual .hash file.
> 
> However, this precludes legal-info from working in off-line mode. A
> subsequent patch will make it possible to do so, and actual sources will
> be downloaded as another classical package download.
> 
> This will have two consequences:
> 
>   - first, we will be able to add hashes for actual sources, so we can
>     ensure their integrity,
> 
>   - second, and as a direct consequence of the above, when a .hash file
>     is present, it would have to list all the hashes for that package,
>     or that would be treated as an error.
> 
> Currently, the only package that falls in this case is the external-
> toolchain, for which we have means to retrieve the sources for some of
> the toolchains.
> 
> So we just add hashes for those actual external-toolchain sources we may
> have to download.
> 
> Those hashes are not used for now, but they'll come into play a few
> patches down.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  toolchain/toolchain-external/toolchain-external.hash | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index dd7073f..22bbe51 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -12,6 +12,7 @@ sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfi
>  # Mentor's Sourcery CodeBench Lite toolchains
>  # ARM
>  sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> +sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2

 Why only this one, and not the six other Sourcery toolchains?

 Regards,
 Arnout

>  # NiosII
>  sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  # PowerPC
> @@ -29,13 +30,17 @@ sha256 8ea78c5988b2bb507534f1ad46aa46659f66b39d55f2fc40e163a90b4195e70f  aarch64
>  # ARM toolchains from Texas Instrument's Arago project
>  sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
>  sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
> +sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
>  
>  # ARM and Aarch64 toolchains from Linaro
>  sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
> +sha256 eafeb3a5247e9ce31aa35d812e296fba5d5f1443e106d9bef9e38d3ee3ade006  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
>  sha256 34812c5d0556db86259ac6eb3f8bcf4ce8eca3fa8d7180875958492a42e9853f  gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf.tar.xz
>  sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
> +sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
>  sha256 24b86799a6c64380c740bf31a700b46e854fc0a821da2341e9868f0196c864de  gcc-linaro-5.1-2015.08-x86_64_armeb-linux-gnueabihf.tar.xz
>  sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
> +sha256 a7b8f842fdc9d9be22ca4e0c999429780fc6f16ea798b032421b5ec0cfa53b3e  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
>  sha256 b9137008744d9009877f662dbac7481d673cdcb1798e727e325a37c98a0f63da  gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu.tar.xz
>  
>  # Codescape toolchains from Imagination Technologies
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
