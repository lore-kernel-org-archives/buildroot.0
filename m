From: Frederik Peter Aalund <fpa@sbtaqua.com>
Date: Wed, 21 Sep 2016 08:44:23 +0000
Subject: [Buildroot] [PATCH 1/1] libfastjson: Was referencing
	non-existing files
In-Reply-To: <87y42m1vzq.fsf@dell.be.48ers.dk>
References: <1474018609-2610-1-git-send-email-fpa@sbtaqua.com>
 <20160916185559.23a41621@free-electrons.com>
 <CAA=pTTRC8oK_GkwHYca3+ky2nRvyvGKS=RyOK1qogYmYGjptPA@mail.gmail.com>
 <87y42m1vzq.fsf@dell.be.48ers.dk>
Message-ID: <CAA=pTTRQKB0S0uz7xqHwUz4pw5__+e5Ws-xV_OjnpFL+Gyfy5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

> <pkgname>-<version>.tar.gz is the default name of the tarball, so it
> sounds like you have a LIBFASTJSON_SOURCE = .. somewhere - Please double
> check.

That must have been the culprit. Even though I deleted the external
libfastjson.mk file,
the value of LIBFASTJSON_SOURCE must still have been cached somewhere. There
were no errors after i purged the entire buildroot folder. Thanks for
investigating.

> Nice, so you are using Buildroot on the sensors?

Yes, and I'm really liking it so far. `make legal-info` in particular is
very handy when aggregating programs in a distribution.

*Frederik Aalund*

Chief Information Officer, Co-owner

SBT Aqua
Copenhagen, Denmark
Mobile: +45 30340086
fpa at sbtaqua.com
sbtaqua.com

On Tue, 20 Sep 2016 at 16:33 Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Frederik" == Frederik Peter Aalund <fpa@sbtaqua.com> writes:
>
>  > Hi Thomas
>  > Thanks for reviewing! Strange that it builds without problems at your
> end.
>  > Here is what I see from the build log (without the patch):
>
>  > I see that your package URL:
>  > --2016-09-16 18:53:29--
>  >
> https://github.com/rsyslog/libfastjson/archive/v0.99.2/libfastjson-v0.99.2.tar.gz
>
>  > is different from mine:
>  >  --2016-09-20 15:22:21--
>  > https://github.com/rsyslog/libfastjson/archive/v0.99.2.tar.gz
>
>  > I don't know how that can be. At some point, I had an external package
> for
>  > libfastjson (before it was integrated into buildroot). However, I have
>  > deleted said external package and purged both buildroot/dl and
>  > buildroot/output/build.
>
> <pkgname>-<version>.tar.gz is the default name of the tarball, so it
> sounds like you have a LIBFASTJSON_SOURCE = .. somewhere - Please double
> check. Notice that buildroot automatically includes */*.mk, so it will
> get read even though you have dropped the Config.in file.
>
>  > *Frederik Aalund*
>  > Chief Information Officer, Co-owner
>
>  > SBT Aqua
>  > Copenhagen, Denmark
>  > Mobile: +45 30340086
>  > fpa at sbtaqua.com
>  > sbtaqua.com
>
> Nice, so you are using Buildroot on the sensors?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160921/206d2221/attachment.html>
