From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 25 Aug 2018 14:24:37 +0300
Subject: [Buildroot] [PATCH 1/1] git: Fix libintl linking if there is no
 full gettext support
In-Reply-To: <20180824230917.20aaff8e@windsurf>
References: <20180824132049.20330-1-vadim4j@gmail.com>
 <20180824230917.20aaff8e@windsurf>
Message-ID: <CAMw6YJKnyLbSO7FMf5ws5_vnEKS8TkZY1u_598YddvOm79J4GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Aug 25, 2018 at 12:09 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Vadim,
>
> On Fri, 24 Aug 2018 16:20:49 +0300, Vadim Kochan wrote:
> > From: Vadim Kochan <vadim.kochan@petcube.com>
> >
> > Git could not resolve libntl_xxx symbols if toolchain does no provide
> > full gettext support but the gettext package is selected.
> >
> > In case of ulibc/musl toolchain there is no full getttext support, but
> > they still provides libintl stub which makes git think there is full
> > gettext support hence -lintl is not passed to the linker.
> >
> > Added workaround which checks if toolchain provides full gettext
> > support, if no then -lintl will be added to EXTLIBS variable generated
> > within config.mak file.
> >
> > Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>
>
> Could you give some minimal Buildroot configuration that exhibits the
> issue ?

So I just did:
1) make menuconfig
2) Toolchain -> WCHAR
3) System -> NLS
4) Target packages -> Development -> git

I attached also config file w/o '#' and empty lines.

P.S.
Not sure if the fix is good, will try to cook v2 ...

Regards,
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 8859 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180825/be8b1632/attachment.obj>
