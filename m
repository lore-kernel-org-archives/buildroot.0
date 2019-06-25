From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 25 Jun 2019 10:23:25 +0530
Subject: [Buildroot] [PATCH 03/19] autobuild-run: move njobs from kwargs
 to Builder class
In-Reply-To: <d3f17922-a1be-05c6-ff8d-72f5a632049d@mind.be>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-3-itsatharva@gmail.com>
 <d3f17922-a1be-05c6-ff8d-72f5a632049d@mind.be>
Message-ID: <CABM+sgq=XSjLJXXUJY_W7MzBJMrb8zDEycLQeiWqxUPifZV6UA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 25, 2019 at 3:04 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On 21/06/2019 10:47, Atharva Lele wrote:
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> >      for i in range(0, int(args['--ninstances'])):
> > -        builder = Builder(i)
> > +        builder = Builder(i, args['--njobs'])
>
>  Since there will be a lot of arguments in the end, it would be better to make
> it more explicit, similar like it was in kwargs, i.e.
>
>      builder = Builder(i
>          njobs = args['--njobs'])
>
>  Still, not essential, so
>  Regards,
>  Arnout

It makes sense to have it more explicit. I'll have it in the v2.

Regards,
Atharva Lele
