From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 21:32:56 +0100
Subject: [Buildroot] [NEXT 03/26] cpe-info: id prefix/suffix
In-Reply-To: <1519697441-54194-4-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <d902e6ef-6549-9beb-c854-0a2e2fb338ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-02-18 03:10, Matt Weber wrote:
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 8622787..8b80de7 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -550,6 +550,10 @@ ifndef $(2)_LICENSE_FILES
>   endif
>  endif
>  
> +CPE_PREFIX_OS = cpe:2.3:o
> +CPE_PREFIX_APP = cpe:2.3:a
> +CPE_SUFFIX = *:*:*:*:*:*:*

 Since this is inside inner-generic-package, you are re-defining these variables
for every package. That's not what you want to do :-)

 All (or most) of the common variables are currently defined in
package/Makefile.in. For specific infras they are defined in that specific infra
file, but not so for the generic infra. So I guess these should also be defined
in package/Makefile.in.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
