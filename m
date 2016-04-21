From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Apr 2016 00:13:24 +0200
Subject: [Buildroot] [PATCH v2 2/2] binutils: remove support for version
 2.23
In-Reply-To: <1461186614-2391-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1461186614-2391-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1461186614-2391-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <57195084.7040504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/20/16 23:10, Thomas Petazzoni wrote:
> Now that we have added support for the lastest binutils version 2.26,
> it is time to remove the oldest version we currently support, 2.23, in
> order to keep only 3 versions: 2.24, 2.25 and 2.26.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>    - Remove hash from the hash file, as noticed by Romain Naour.
>    - Add Config.in.legacy entry, as noticed by Romain Naour.
> ---
[snip]
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ba3d94c..f52d5f8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,13 @@ endif
>   ###############################################################################
>   comment "Legacy options removed in 2016.05"
>
> +config BR2_BINUTILS_VERSION_2_23_X
> +	bool "binutils 2.23 removed"
> +	select BR2_LEGACY
> +	help
> +	  Binutils 2.23 has been removed, using a newer version is
> +	  recommended.

  I don't know if it very important, but it's a bit weird that another legacy 
option (BR2_BINUTILS_VERSION_2_23_1) still selects this one. So ideally that 
select should be removed, and its help text updated to be the same as this one.


  Regards,
  Arnout

> +
>   config BR2_x86_i386
>   	bool "x86 i386 support removed"
>   	help

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
