From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Nov 2015 23:07:10 +0100
Subject: [Buildroot] [PATCH 1/2 v2] core/pkg-generic: allow step hooks
 to fail a step
In-Reply-To: <074ea9eec180d35931daa3a130d21f47dec4e267.1446577223.git.yann.morin.1998@free.fr>
References: <cover.1446577223.git.yann.morin.1998@free.fr>
 <074ea9eec180d35931daa3a130d21f47dec4e267.1446577223.git.yann.morin.1998@free.fr>
Message-ID: <5639300E.9030307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-11-15 20:06, Yann E. MORIN wrote:
> Currently, we touch our stamp files before we call the step hooks.
> This means a step hook can not properly fail a step, since the stamp
> file exists even if the hook exits in error, thus a subsequent 'make'
> would not try to redo that step.
> 
> Fix that by calling the hooks before we touch the stamp files.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/pkg-generic.mk | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
