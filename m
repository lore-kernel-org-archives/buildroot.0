From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 24 Jul 2019 10:03:24 +0300
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: add option to enable
 NLS support
In-Reply-To: <20190724001359.0a290cf1@windsurf>
References: <20190723172336.24010-1-vadim4j@gmail.com>
 <20190724001359.0a290cf1@windsurf>
Message-ID: <CAMw6YJKnpyUs_24FqopnwJQke-G=D_LNUwcsCvpDUJH5c5qFvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 24, 2019 at 1:14 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Vadim,
>
> On Tue, 23 Jul 2019 20:23:36 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
>
> > Sometimes the package or specific configuration should be build with and
> > without NLS support which requires additionally append NLS related
> > config options or to have separate config file or use additional shell
> > script.
> >
> > So add helper command line option which appends config file with NLS
> > options to the final config file which is now always stored in temporary
> > file before merge it with the default configuration (even only -c was
> > specified).
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
>
> Thanks for the patch. It seems like a good idea to test NLS-enabled
> configurations in test-pkg indeed. However, I'm not sure it's a good
> idea to make it conditional/optional. The idea of test-pkg is that
> people run test-pkg, and it tells them if their new package seems to be
> OK or not. Most people will not know which knobs/options to pass to
> test-pkg to test all possible situations.
>
> So I think we should instead ensure that test-pkg by default tests the
> different combinations that we think are useful to test.
>

OK, I see, I can only say that usually I use test-pkg for version
bumping or checking
the package compilation issue reported in 'Buildroot results' mailing
if it pass, for *.mk changing and of course
for the new packages. So I was thinking that others also use it in
such way, and my
assumption was that --with-nls option would be useful :)

Thanks,
Vadim Kochan
