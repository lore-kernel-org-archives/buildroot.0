From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Mar 2012 23:44:44 +0100
Subject: [Buildroot] [PATCH 2/2] openssl: switch to the ocf-linux package
In-Reply-To: <1332249830-25248-3-git-send-email-gustavo@zacarias.com.ar>
References: <1332249830-25248-1-git-send-email-gustavo@zacarias.com.ar>
 <1332249830-25248-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201203202344.45078.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 20 March 2012 14:23:50 Gustavo Zacarias wrote:
> Remove builtin OCF support from the openssl package into a new package.
> Even though ocf support is just a header file we'd rather have it in a
> separate package because of unrelated version bumps and to fetch it from
> source.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One small detail below.

> ---
>  package/openssl/Config.in                |    9 +-
>  package/openssl/ocf-cryptodev-20101223.h |  480 ------------------------------
>  package/openssl/openssl.mk               |   10 +-
>  3 files changed, 9 insertions(+), 490 deletions(-)
>  delete mode 100644 package/openssl/ocf-cryptodev-20101223.h
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index 3e09d88..6ba644a 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -25,9 +25,14 @@ config BR2_PACKAGE_OPENSSL_ENGINES
>  config BR2_PACKAGE_OPENSSL_OCF
>         bool "openssl ocf support"
>         depends on BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_OCF_LINUX
>         help
>           Enable openssl cryptodev (OCF) hardware acceleration support.
> -         This requires kernel patches from the ocf-linux project otherwise
> -         you'll just have a bigger openssl library that works as usual.
> +         This requires the ocf linux kernel extension or you to provide a
> +         pre-patched kernel that includes it.

 Better call it "Open Cryptographic Framework (OCF) kernel extension" so
it's consistent with the BR2_LINUX_KERNEL_EXT_OCF_LINUX prompt.  Perhaps
even refer to that config option so people can search for it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
