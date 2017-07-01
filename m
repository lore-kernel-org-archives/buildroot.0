From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 18:06:29 +0200
Subject: [Buildroot] [RFC PATCH v5 05/11] core: we need host-patchelf as
 the very first package for RPATH sanitation
In-Reply-To: <1498811828-6893-6-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-6-git-send-email-wg@grandegger.com>
Message-ID: <f8d60e22-3c8f-2b3f-e84a-a77c68229687@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Subject line is a bit long, how about

core: add host-patchelf to DEPENDENCIES_HOST_PREREQ

(in general, the subject line says what is done, the rest of the commit message
explains why and sometimes how).

On 30-06-17 10:37, Wolfgang Grandegger wrote:
> For this purpose we set DEPENDENCIES_HOST_PREREQ to host-patchelf early
> in the Makefile.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 88d98e0..f5ea6a8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -483,6 +483,8 @@ include package/Makefile.in
>  # arch/arch.mk.* must be after package/Makefile.in because it may need to
>  # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
>  -include $(wildcard arch/arch.mk.*)
> +# We need patchelf early for RPATH sanitation

 It's sanitization, not sanitation.

 Regards,
 Arnout

> +DEPENDENCIES_HOST_PREREQ += host-patchelf
>  include support/dependencies/dependencies.mk
>  
>  include toolchain/*.mk
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
