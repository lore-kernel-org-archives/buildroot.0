From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 22:37:10 +0100
Subject: [Buildroot] [git commit] pthread-stubs: rename to
	xlib_libpthread-stubs
In-Reply-To: <20130105124707.668AD9A64B@busybox.osuosl.org>
References: <20130105124707.668AD9A64B@busybox.osuosl.org>
Message-ID: <50EC9186.7050802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Peter, Thomas,

On 01/05/13 13:26, Peter Korsgaard wrote:
[snip]
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 7ddc6ea..4770c94 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -70,4 +70,12 @@ config BR2_PACKAGE_INPUT_TOOLS_EVTEST
>   	help
>   	  The evtest program from input-tools is now a separate package.
>
> +config BR2_PACKAGE_PTHREAD_STUBS
> +	bool "pthread-stubs option has been renamed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
> +	help
> +	  For consistency reason, the pthread-stubs package has been
> +	  renamed to xlib_libpthread-stubs.
> +
>   endif

  The intention was that:

- There would be a comment that this is a legacy option from 2011.11;

- The BR2_LEGACY_CHECK_2012_11 is updated to BR2_LEGACY_CHECK_2013_02 so 
that it is re-enabled (but this can be done just prior to the release, of 
course).

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
