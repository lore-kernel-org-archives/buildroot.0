From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sat, 7 Dec 2019 14:31:13 +0100
Subject: [Buildroot] [PATCH v2 9/9] package/wpa_supplicant: adapt for
 preset-all
In-Reply-To: <20191205130419.GJ2539@scaer>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-10-jeremy.rosen@smile.fr>
 <20191205130419.GJ2539@scaer>
Message-ID: <CAFvCimULLYTKgxwZe5c_TZuPb9i6x6UG=hnN=K=mnkxj32qqag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > ---
> >  package/wpa_supplicant/50-wpa_supplicant.preset | 4 ++++
> >  package/wpa_supplicant/wpa_supplicant.mk        | 2 ++
> >  2 files changed, 6 insertions(+)
> >  create mode 100644 package/wpa_supplicant/50-wpa_supplicant.preset
> >
> > diff --git a/package/wpa_supplicant/50-wpa_supplicant.preset
> b/package/wpa_supplicant/50-wpa_supplicant.preset
> > new file mode 100644
> > index 0000000000..9af8562c0e
> > --- /dev/null
> > +++ b/package/wpa_supplicant/50-wpa_supplicant.preset
> > @@ -0,0 +1,4 @@
> > +disable wpa_supplicant at .service
>
> In the commit log, you say "This change enables the service", but it
> looks like you are actually disabling it, no?
>
> My terminology is not completely clear, but I just checked and the patch
is correct

* I now enable (implicitely) the non-template services
* I explicitely disable the templated services

I will clarify the commit messages
(I am also trying to fix this in upstream systemd, but it's tricky to get
right)

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191207/bd80421f/attachment.html>
