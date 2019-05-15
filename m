From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2019 21:53:34 +0200
Subject: [Buildroot] [PATCH 4/5] package/wpewebkit: bump to version
 2.24.1
In-Reply-To: <20190515211139.GB26229@momiji>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-5-aperez@igalia.com>
 <CAB0FRstZPttVSDYzYGih2nfdTdZ7UKuipDGPKWSaBJf6h_LVSw@mail.gmail.com>
 <20190515145239.GB9191@momiji> <20190515160530.234d9212@windsurf>
 <20190515211139.GB26229@momiji>
Message-ID: <20190515195334.GA2441@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, Thomas, All,

On 2019-05-15 21:11 +0300, Adrian Perez de Castro spake thusly:
> On Wed, 15 May 2019 16:05:30 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> > Adding Peter in Cc. I know he'll like it :-)
> > Adding Yann in Cc. I know he won't like it :-)

I see the wink, but still, meh... ;-)

> Personally, I like the suggestion, but I will wait for feedback on this
> before sending v2 of the patch set.

Well, as you said previously, what good is a browser without support for
one of the most prominent image format on the web?

If you were arguing for BMP or TGA, we'd use a conditional dependency.

But please note that openjpeg is a JPEG 2000 codec, not a JPEG one.
JPEG 2000 is much less used on the web:

    https://en.wikipedia.org/wiki/Comparison_of_web_browsers#Image_format_support

Only Konqueror, Midori, Omniweb, and Safari are said to support it.

Also, Thomas, please note that NetSurf does not support it eitther. ;-]

So, in this case, I would argue for a conditional dependency, as Adrian
initially suggested below:

> > On Wed, 15 May 2019 14:52:39 +0300
> > Adrian Perez de Castro <aperez@igalia.com> wrote:
> > > > openjpeg is an optional dependency
> > > > ifeq ($(BR2_PACKAGE_OPENJPEG),y)
> > > > WPEWEBKIT_CONF_OPTS += -DUSE_OPENJPEG=ON
> > > > WPEWEBKIT_DEPENDENCIES += openjpeg
> > > > else
> > > > WPEWEBKIT_CONF_OPTS += -DUSE_OPENJPEG=OFF
> > > > endif  

... here ^^^.

Sorry, but I still dislike "imply". :-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
