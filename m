From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 25 Jun 2019 10:31:13 +0530
Subject: [Buildroot] [PATCH 08/19] autobuild-run: move toolchains_csv
 from kwargs to Builder class
In-Reply-To: <dc6b2bcd-5353-51d5-e027-d6c7ae76174b@mind.be>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-8-itsatharva@gmail.com>
 <dc6b2bcd-5353-51d5-e027-d6c7ae76174b@mind.be>
Message-ID: <CABM+sgpa27E=+=CYey6DWoQNGwo7N9LueahAri7mAusxNgs44A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 25, 2019 at 3:07 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On 21/06/2019 10:47, Atharva Lele wrote:
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> > ---
> >  scripts/autobuild-run | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > -        toolchains_csv = kwargs['toolchains_csv']
> > +        toolchains_csv = self.toolchains_csv
>
>  Creating a local variable here is not very useful anymore. Better use
> self.toolchains_csv everywhere below.
>
>  That can be done in the same patch.
>
>  Either way:
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> In other words: you can respin with self.toolchains_csv everywhere, or Thomas
> can apply without it. Either way is fine.
>
>  Regards,
>  Arnout

I tried replacing toolchains_csv with self.toolchains_csv everywhere.
However it presented a weird issue where after the first build was
over, it would not be able to find toolchains_csv. It would then go
into instance-0/buildroot/instance-0/buildroot.. and so on for every
time it was unable to find toolchains_csv. I'll try it later again
today and contact on IRC if i come across the same error.

Regards,
Atharva Lele
