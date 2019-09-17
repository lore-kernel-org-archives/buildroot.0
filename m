From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 17 Sep 2019 17:32:03 -0300
Subject: [Buildroot] [PATCH 2/2] package/libglib2: Do not depend on
 util-linux
In-Reply-To: <20190917220216.3f719f37@windsurf>
References: <20190916191605.86764-1-aduskett@gmail.com>
 <20190916191605.86764-2-aduskett@gmail.com>
 <20190917220216.3f719f37@windsurf>
Message-ID: <CAJ4jsacyTaruLbozB0_uyRTKpw3Fd5N=H7Jyj0TJ8pRP9xpdFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 17, 2019 at 5:02 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 16 Sep 2019 12:16:05 -0700
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > libglib2 needs util-linux only for libmount, which is a configuration option.
> > Instead, check if util-linux-libmount is selected, and if so, set the option
> > to true.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> >  package/libglib2/Config.in   |  2 --
> >  package/libglib2/libglib2.mk | 10 +++++++++-
> >  2 files changed, 9 insertions(+), 3 deletions(-)
>
> Applied to master, thanks. This may cause problems for people who
> currently needed libmount, but do not have anything else in their
> configuration that selects util-linux libmount option. Their next
> Buildroot build will silently no longer have libmount support.
>
> However, we don't really have a good way to handle such dependencies
> that used to be mandatory and become optional, so there's not much we
> can do about it.
>
> We might however see a few build issues from reverse dependencies of
> libglib2 that do need libmount. Such reverse dependencies will have to
> select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT by themselves.

Yet another candidate to depend on the impending util-linux-libs.

-- 
Carlos Santos <unixmania@gmail.com>
