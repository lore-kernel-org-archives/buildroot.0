From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 26 May 2014 10:13:40 +0200
Subject: [Buildroot] [WIP PATCH 0/5] Static linking fixes
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LUuv3vuX-wh1oYBuCfcUFvq356KPxCw61pqtOp10ESubg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, May 26, 2014 at 12:12 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> As discussed on the mailing list here is my current patchset to get
> static linking fixed.
> This is a WIP (Work In Progress) patchset, that being said i consider
> patches 1 and 3 pretty safe and ready for the tree.
> Patch 2 and 4 are medium confidence level, how things should be IMHO.
> Patch 5 is also how things should be however it's not extensively tested.
>
> Gustavo Zacarias (5):
>   uclibc: don't install tools to staging when static
>   gcc-final: disable shared build for static
>   libiconv: disable preloadable for static builds
>   package infra: revert 0a4bd19f
>   package infra: add -static to C/CXXFLAGS
>
>  package/Makefile.in                |  4 +++-
>  package/gcc/gcc-final/gcc-final.mk | 21 +++++++++++++++++++--
>  package/libiconv/libiconv.mk       |  8 ++++++++
>  package/uclibc/uclibc.mk           |  4 ++--
>  4 files changed, 32 insertions(+), 5 deletions(-)

Your patches do not yet go as far as touching the
BR2_PREFER_STATIC_LIB variable. We have talked about this in the past
but as far as I know there is no-one that has actually wrote patches
for it.
See also http://www.elinux.org/Buildroot:DeveloperDaysFOSDEM2014#BR2_PREFER_STATIC_LIB_refactoring

It would be awesome if this refactoring could be taken up by someone
in the 2014.08 cycle, but I don't know if anyone has time for this...

Best regards,
Thomas
