From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Jan 2013 18:38:07 +0100
Subject: [Buildroot] [git commit] polkit: new package
In-Reply-To: <20130120221146.94C249A440@busybox.osuosl.org>
References: <20130120221146.94C249A440@busybox.osuosl.org>
Message-ID: <51001FFF.3080400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/13 23:07, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=ff3c47ee04daa6f97e9911659fdea0636d65327f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> [Peter: Config.in comment tweak]
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Signed-off-by: Marek Belisko<marek.belisko@open-nandra.com>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
[snip]
> diff --git a/package/polkit/Config.in b/package/polkit/Config.in
> new file mode 100644
> index 0000000..da5f985
> --- /dev/null
> +++ b/package/polkit/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_POLKIT
> +	bool "polkit"
> +	depends on BR2_USE_WCHAR # libglib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_EXPAT
> +	help
> +	  PolicyKit is a toolkit for defining and handling
> +	  authorizations.  It is used for allowing unprivileged
> +	  processes to speak to privileged processes.
> +
> +	  http://www.freedesktop.org/wiki/Software/polkit

  The comment when !BR2_USE_WCHAR is missing, no?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
