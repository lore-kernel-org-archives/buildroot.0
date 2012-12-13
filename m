From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 11:30:45 +0100
Subject: [Buildroot] [PATCH] perl: refactor configure step,
In-Reply-To: <1354865887-6720-1-git-send-email-francois.perrad@gadz.org>
References: <1354865887-6720-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <50C9AE55.2020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/12 08:38, Francois Perrad wrote:
> after discussion with Perl-Cross's author (Alex Suykov)

  This splitting of the commit message looks funny in the oneline log...

>
> Note: Using -A with variables that aren't option lists makes little sense.

  Then I misunderstood the meaning of -A: I thought it was meant to override
whatever has been autodetected, while -D can still be overridden by the
autodetection. But the documentation isn't particularly clear about this.
And I guess Alex Suykov should know :-)

>
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (build-test on a minimal internal toolchain)


  Regards,
  Arnout

> ---
>   package/perl/perl.mk |   12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index a86ee2a..da54ef1 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -57,12 +57,12 @@ PERL_CONF_OPT = \
>   	-Dld="$(TARGET_CC_NOCCACHE)" \
>   	-Dccflags="$(TARGET_CFLAGS)" \
>   	-Dldflags="$(TARGET_LDFLAGS) -lm" \
> -	-A define:mydomain="" \
> -	-A define:myhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
> -	-A define:myuname="Buildroot $(BR2_VERSION_FULL)" \
> -	-A define:osname=linux \
> -	-A define:osvers=$(LINUX_VERSION) \
> -	-A define:perladmin=root
> +	-Dmydomain="" \
> +	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
> +	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
> +	-Dosname=linux \
> +	-Dosvers=$(LINUX_VERSION) \
> +	-Dperladmin=root
>
>   ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>       PERL_CONF_OPT += -Dusedevel

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
