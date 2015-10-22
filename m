From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 22 Oct 2015 10:22:02 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <20151021232020.610e4735@free-electrons.com>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
 <20151021223958.5605a589@free-electrons.com> <5627FDD5.8060207@mind.be>
 <20151021232020.610e4735@free-electrons.com>
Message-ID: <CAAXf6LVLoU=sFyoEFhPyagqguVO0OV-dhFT5-JmMVPJGF4i9AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 21, 2015 at 11:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Arnout,
>
> On Wed, 21 Oct 2015 23:04:21 +0200, Arnout Vandecappelle wrote:
>
>>  I was thinking the same thing when I say the patch, but I don't care enough to
>> really comment on it. It's a bit similar to packages that depend on some host
>> preprocessing tool, like flex. But then of course we just have a dependency and
>> not a Config.in.host.
>
> To me, host packages that are a dependency of some other target
> packages have a real and strong reason to exist. The ones that don't
> should really fall into the "useful for debugging, flashing or
> preparing images" category IMO.
>
>>  OTOH, if we accept this, it kind of opens the doors to support almost
>> everything as a host package. But maybe there's nothing wrong with that either.
>
> Opening the door to almost everything as a host package is personally
> something that I'd like to avoid.

I don't think that we would open the door to 'almost every package' as
host package. For many packages, it makes no sense to have them as
host package in the context of buildroot, say audio/video,
profiling/benchmark, hardware handling, mail, miscellaneous,
networking apps, ...
In fact, I would argue that almost none of the packages we have in
Buildroot make sense as host packages, except those that we already
have, and a few limited categories of tools. In my opinion, one such
category could be config file handling, and host-jq fits into that
category. It's the type of thing one can reasonably need to put
together filestystem images for embedded devices, especially in
environments where many (variants of) devices are being developed.

/Thomas
