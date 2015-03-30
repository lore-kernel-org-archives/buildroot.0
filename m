From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 30 Mar 2015 15:37:48 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <20150330134929.09fc5de7@free-electrons.com>
References: <5515E2AC.3010100@armadeus.com>
 <20150329144607.0e60928f@free-electrons.com>
 <55184DA0.1050901@armadeus.com> <20150329224013.0d330434@free-electrons.com>
 <CAGm1_ktFjO8KyQTOTDnKo1bLbhjwBpyw7Li=T6sLAf=Vab71=w@mail.gmail.com>
 <20150330134929.09fc5de7@free-electrons.com>
Message-ID: <CAGm1_kv-5-ikeo+KLzPNHR2rEGm5zFO6PLJP0EiHdagfs+GDjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 30, 2015 at 1:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Mon, 30 Mar 2015 13:05:09 +0200, Yegor Yefremov wrote:
>
>> Can confirm, that I'm having the same issue with my German openSUSE
>> 12.1 machine. Exporting LANGUAGE=en_US helped. haven't tried LC_ALL
>> yet. Python 2.7.9.
>
> Ok.
>
>> The whole stuff got screwed only lately. I've been using python-dpkt,
>> that requires PYTHON_ZLIB for ages and had no problems on this
>> machine.
>
> Seems weird. Do we have an idea what broke things ? Can you try 2015.02,
> 2014.11 and see if the issue also happens (or not) ?

Hm. Strange. 2014.11 seem to have the same issue. Can it be the change
from Python 2.7.8 to 2.7.9?

# cat /etc/os-release
NAME=Buildroot
VERSION=2014.11
ID=buildroot
VERSION_ID=2014.11
PRETTY_NAME="Buildroot 2014.11"

I'm also working with en englich Xubuntu VM. I can imagine, that I
haven't made updates/cleaning on my suse machine. Most upstream work
was made with Xubuntu.

>> I think this bug (https://bugs.busybox.net/show_bug.cgi?id=7971) is
>> also locale related.
>
> Ok.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
