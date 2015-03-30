From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 30 Mar 2015 13:05:09 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <20150329224013.0d330434@free-electrons.com>
References: <5515E2AC.3010100@armadeus.com>
 <20150329144607.0e60928f@free-electrons.com>
 <55184DA0.1050901@armadeus.com> <20150329224013.0d330434@free-electrons.com>
Message-ID: <CAGm1_ktFjO8KyQTOTDnKo1bLbhjwBpyw7Li=T6sLAf=Vab71=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 29, 2015 at 10:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear S?bastien Royen,
>
> On Sun, 29 Mar 2015 21:08:16 +0200, S?bastien Royen wrote:
>
>> I should not submit patch of patch too late in the evening.
>> I hope the version below is better.
>
> Yes and no. It's better because it's a Buildroot patch, but it's still
> not good since it's not a Git formatted patch.
>
>> Not tested with python3, and not sure toolchain output language shouln't
>> be fix in another way to avoid same problem on other packages.
>
> Maybe we should export LC_ALL globally, or something like that.

Can confirm, that I'm having the same issue with my German openSUSE
12.1 machine. Exporting LANGUAGE=en_US helped. haven't tried LC_ALL
yet. Python 2.7.9.

The whole stuff got screwed only lately. I've been using python-dpkt,
that requires PYTHON_ZLIB for ages and had no problems on this
machine.

I think this bug (https://bugs.busybox.net/show_bug.cgi?id=7971) is
also locale related.

Yegor
