From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 24 Aug 2015 16:14:55 -0400
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <20150818172723.GY2765@tarshish>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
 <20150818160332.GX2765@tarshish>
 <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
 <20150818172723.GY2765@tarshish>
Message-ID: <CALe+oY9=XXOFUFgfiuCRUHsLLqUKdwbLfnVzA2Nu=kz60VoRwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All;

On Tue, Aug 18, 2015 at 1:27 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>
> I wouldn't call rpm5 "latest". It has forked from rpm in 2008, and is
> developed independently. The current Buildroot version has not been updated
> since 2009, quite far from "latest". Switching to latest rpm 4.x could as well
> be considered a "bump".

After some playing around, I might be close to a patch that will
"bump" from rpm5 to rpm's latest 4.12.0.1 version. I'm hoping to do a
little bit more testing to cover a series of new configuration
options. I guess the first question is, will anyone not like a
transition from rpm5 to rpm?

That being said, the change does not help my situation of having a
target-complaint rpm build. I can't guarantee that my target rpm's
berkeleydb matches my host rpm's berkeleydb. If I attempt to prepare
the target system's rpm database with my host (stock Fedora), I will
get a "DB_VERSION_MISMATCH" error. This makes me believe, to support a
post-build generation of a target system's rpm database, host support
for rpm is required. With the change from rpm5 to rpm, the full list
of dependent packages I'll have to provide host-support are now as
follows: beecrypt, berkeleydb, libnss and neon. I can make another
attempt to push up host-support changes for these packages (along with
rpm) with corrections on issues Thomas has indicated; unless anyone
feels that this use case is too specific for Buildroot.

On a side note, a patch request made recently by universe II indicates
that some regex/pcre issues. If we do transition from rpm5 to rpm,
this shouldn't be an issue as rpm uses POSIX regex's by default (PCRE
regex's seem to be only supported with some manual Makefile changes).
