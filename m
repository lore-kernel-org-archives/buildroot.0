From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 00:32:15 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <CAAXf6LWzouV+VGEHJric3M3yt5zGmtg=iVmsUeKN5yk4JDE1Vw@mail.gmail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <5209C5D1.7040904@mind.be>
 <CAAXf6LWkHdg1XB77GPjVFY6k97E95AxG7ZHK3cmr6dGEM=xAfg@mail.gmail.com>
 <52124585.1050303@mind.be>
 <CAAXf6LWzouV+VGEHJric3M3yt5zGmtg=iVmsUeKN5yk4JDE1Vw@mail.gmail.com>
Message-ID: <5213EE6F.7040006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/08/13 20:49, Thomas De Schampheleire wrote:
[snip]
>  >> However, while testing again, I noticed an annoyance: if the build
>  >> process stops prematurely, for example because the build fails or the
>  >> user interrupts it, the last tab title remains. I would much prefer
>  >> that we can cleanly restore this no matter how buildroot/make stops.
>  >
>  >
>  >  Won't that be the case regardless of whether the build fails or succeeds?
>
> Currently it is indeed, but that could easily be fixed by adding an extra
> such print at the end.

  A print of what? An empty string? Then your window won't have a title 
anymore... There is no way to save the previous window title, so I really 
think that if PS1 doesn't set the window title, then buildroot shouldn't 
either.

  Regards,
  Arnout


>
>  >
>  >  I think this patch is only really suitable for people who have
> something similar in their PS1. Otherwise it will just mess up your
> window title.
>  >
>  >  Also, it should only be done if $TERM == xterm, otherwise you get
> annoying stuff when running buildroot from a text console. And in fact,
> the same is true of the colouring itself, so we don't get these annoying
> escape characters in log files and continuous integration web interfaces.
>
> Agreed.
>
> Best regards,
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
