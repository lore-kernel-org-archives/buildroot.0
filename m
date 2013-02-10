From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 10 Feb 2013 16:28:07 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: update to fix
 no-longer applying patch
In-Reply-To: <CAHXCMML7-7p5+iTCAn_9OPZfYp141re-Hx21JLCizNzsdER1dg@mail.gmail.com>
References: <1360497506-31282-1-git-send-email-yann.morin.1998@free.fr>
 <51179F8D.6050800@je-eigen-domein.nl>
 <CAGduivzJBf_OzuFce2Ym_yFpSx9RWLzOXvhLRPjfXrQU8NgZmQ@mail.gmail.com>
 <5117B3FB.1010401@je-eigen-domein.nl>
 <CAHXCMML7-7p5+iTCAn_9OPZfYp141re-Hx21JLCizNzsdER1dg@mail.gmail.com>
Message-ID: <5117BC87.5060804@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/2013 04:10 PM, Samuel Martin wrote:
> Documentation is incorrect/outdated.
>
> Github only looks at the folder name, ignores the filename, and will
> redirect you to
> https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/master
>
> [...]
>> With
>> "RPI_USERLAND_SITE=http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)"
>> it does work:
> [...]
>
> Fair enough.
> Care to fix/update the doc?
>
> Also, rpi-userland is not the only package fetched from github...
> So patches for all other potentially broken packages will be welcome as well.

Problem is that if they were to change their tarball URLs in the future, 
it would break all github packages again.
Wonder if it wouldn't be a better long term solution to have some kind 
of abstraction for github (and perhaps sourceforge) packages.

E.g. specify "FOO_SITE=github://foopackage" in the package's makefile, 
and add a special DOWNLOAD_GITHUB helper routine in pkg-download.mk
So we would only need to update pkg-download.mk if it were to change again.


Yours sincerely,

Floris Bos
