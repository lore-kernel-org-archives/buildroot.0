From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Thu, 28 Nov 2019 16:15:22 +0100
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <20191128092757.19886364@windsurf>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <20191127214614.33d87ae0@windsurf>
 <CAFvCimXHMv94tg4S-U5QLu4k26HZAtZXsVR3jjK2C4s+XOuX2g@mail.gmail.com>
 <20191128092757.19886364@windsurf>
Message-ID: <CAFvCimUcf=j+dza+CZbDwFnW3T_DNEk6uFt8njYT7dZYUT0nXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeu. 28 nov. 2019 ? 09:28, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Thu, 28 Nov 2019 09:08:19 +0100
> J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:
>
> > Ok, as usuall some background knowledge
> >
> > systemd provides three binaries to deal with sending journal data over
> the
> > network
> >
> > * systemd-journald-gateway : a tiny HTTP server that provides the logs
> > * systemd-journald-upload : a process to run periodically to push the
> logs
> > to a remote HTTP server
> > * systemd-journald-remote : aprocess to run on the remorse computer (not
> on
> > the target) to receive data and/or to fetch data from the target
> >
> > All three options are selected together with -Dremote=true (which is the
> > default). It would be nice to be able to select them individually, but
> > upstream does not provide that option.
> >
> > gatewayd is a bit more tricky because it will detect if libmicrohttpd is
> > available and only builds if it is.
> >
> > So, as a fix I would make BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY depend
> > on BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
> > Also, fix default values to match previous behaviour
>
> But if all of gateway, upload and remote are always built together when
> -Dremote=true, what is the point of having fine-grained options for
> each of gateway, upload and remote ? Just to install/enable (or not)
> the correspond service file ?
>
> The usual "smaller for the embedded space" argument...
I kinda agree that having it optional is a bit overkill (except maybe for
gateway, because it pulls in libhttpd)

It's a choice we have to make.


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191128/ae7f3f43/attachment.html>
