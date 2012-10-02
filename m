From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 2 Oct 2012 16:01:28 +0200
Subject: [Buildroot] buildroot-2012.08: Error when selecting crosstool-ng
In-Reply-To: <CABRndgz+297jXwaBiThqrhztj-0uUajQu7OY=nRoz7DLxLid8Q@mail.gmail.com>
References: <CABRndgy4WMyjqrod4L_N89VRbVD_jKDYpThAMfwNqhdySNrFZQ@mail.gmail.com>
 <20121002000951.GA4689@tarshish>
 <CABRndgz+297jXwaBiThqrhztj-0uUajQu7OY=nRoz7DLxLid8Q@mail.gmail.com>
Message-ID: <20121002140127.GA10486@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zvi,

(Adding back the list to Cc)

On Tue, Oct 02, 2012 at 06:44:06AM +0200, Zvi Vered wrote:
> You are right. Attached the right config.

But still, you have in your .config:

BR2_TOOLCHAIN_CTNG_CONFIG="toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc"

which means that you are going to end up with a uClibc based toolchain. You 
need to put crosstool-ng.config-glibc or crosstool-ng.config-eglibc in there 
for a glibc/eglibc toolchain.

And what about the pre-built, eglibc based, Sourcery CodeBench toolchain?

baruch

> Before using buildroot I used crosstool-ng only (downloaded directly
> from crosstool-ng) and had the same problem.
> 
> For some reason nobody in crosstool-ng is answering (2 days)
> 
> On 10/2/12, Baruch Siach <baruch@tkos.co.il> wrote:
> > Hi Zvi,
> >
> > On Tue, Oct 02, 2012 at 01:25:11AM +0200, Zvi Vered wrote:
> >> I'm using buildroot-2012.08 to create toolchain + file system for an x86
> >> target.
> >>
> >> When I set toolchain to: buildroot, the build was OK.
> >>
> >> Then I changed to: crosstool-ng and got the following error:
> >
> > Questions related to crosstool-ng should go to the crossgcc mailing list.
> > See
> > under "Contacts" at http://crosstool-ng.org/.
> >
> > [snip]
> >
> >> The reason I changed to crosstool-ng is  that I want to use glibc and not
> >>
> >> ulibc.
> >>
> >> Attached the .config I'm using.
> >
> > You say you want glibc toolchain, but your .config indicates otherwise:
> >
> > BR2_TOOLCHAIN_CTNG_uClibc=y
> > # BR2_TOOLCHAIN_CTNG_eglibc is not set
> > # BR2_TOOLCHAIN_CTNG_glibc is not set
> >
> >> Can you help ?
> >
> > An alternative to building a toolchain from scratch is to use a pre-built
> > toolchain as external toolchain. Buildroot can even download and install the
> >
> > Sourcery CodeBench toolchain for you. Just select "External toolchain" in
> > Toolchain -> Toolchain type, and then select from the options in the
> > "Toolchain" choice menu.
> >
> > baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
