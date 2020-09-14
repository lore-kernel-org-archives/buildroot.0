From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 14 Sep 2020 09:00:02 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <20200913152746.162379db@windsurf.home>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <20200913152746.162379db@windsurf.home>
Message-ID: <CAFvCimWYw2eyivRO717Bw83zdq7PfsSgWkSxta8nZE1eX5cvaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fine by me...
J?r?my

Le dim. 13 sept. 2020 ? 15:27, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> On Wed, 10 Jun 2020 00:41:15 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > Drop default dependencies, haveged needs nothing but
> > local sockets and /dev/random.
> >
> > The service file now mostly matches the upstream fedora file,
> > except alot of isolation options have been dropped.
> > The benefit for a completely controlled system is small,
> > and those option would pull in dependencies, delaying
> > entropy being filled up.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/haveged/haveged.service | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
>
> The consensus on this patch was not huge, but after reading the
> comments from the different parties, it seems like the opposition was
> not very strong. So I applied this patch to master. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200914/21ef653d/attachment.html>
