From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 18:17:15 +0200
Subject: [Buildroot] [PATCH] graph-build-time: support python3
In-Reply-To: <1403533417-21463-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1403533417-21463-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <53A8530B.6060601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 16:23, Vivien Didelot wrote:
> This patch is the result of 2to3.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (with Python 2.7.7 and Python 3.4.1)


 Regards,
 Arnout

> ---
>  support/scripts/graph-build-time | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
> index 8ef065f..524c30d 100755
> --- a/support/scripts/graph-build-time
> +++ b/support/scripts/graph-build-time
> @@ -80,16 +80,16 @@ class Package:
>              self.steps_start[step] = time
>          else:
>              self.steps_end[step] = time
> -        if self.steps_start.has_key(step) and self.steps_end.has_key(step):
> +        if step in self.steps_start and step in self.steps_end:
>              self.steps_duration[step] = self.steps_end[step] - self.steps_start[step]
>  
>      def get_duration(self, step=None):
>          if step is None:
>              duration = 0
> -            for step in self.steps_duration.keys():
> +            for step in list(self.steps_duration.keys()):
>                  duration += self.steps_duration[step]
>              return duration
> -        if self.steps_duration.has_key(step):
> +        if step in self.steps_duration:
>              return self.steps_duration[step]
>          return 0
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
