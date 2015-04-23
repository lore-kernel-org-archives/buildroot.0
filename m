From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Apr 2015 00:27:44 +0200
Subject: [Buildroot] [PATCH 12/30] package/matchbox: get rid of
 intermediate non-package matchbox
In-Reply-To: <3a0d878f5062e3e57decc9a2ed348a2dcef8d0b2.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <3a0d878f5062e3e57decc9a2ed348a2dcef8d0b2.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <553971E0.10102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Currently, the matchbox entry in the menu is a non-package entry, that
> forcibly selects the matchbox-wm package, which is the real matchbox WM.
> 
> So, get rid of the current matchbox option, rename the exisiting
> matchbox-wm to simply matchbox, so we have a real package from the
> onset.
> 
> Since we're reusing the previous option for the WM package, there is no
> need for a entry in the legacy menu.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
[snip]
> +# After we called a package infra, w ecan include more files
                                       ^^

 This comment becomes redundant after the move.

 Regards,
 Arnout

>  include $(sort $(wildcard package/matchbox/*/*.mk))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
