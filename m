From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 10 Oct 2018 09:14:35 +0200
Subject: [Buildroot] [PATCH v2] poco: disable fpenvironment for MIPS
 without FPU
In-Reply-To: <20181010091240.30e7e37f@windsurf>
References: <20181009132152.24383-1-yegorslists@googlemail.com>
 <51cdb909-89fd-6832-0988-f29ab95dbf74@mind.be>
 <20181010084502.04f1cf7e@windsurf>
 <CAGm1_kuA7Pp7gKP+1O_K0enyAf=OTFdcK-rhvTOrJYqiUMeWFQ@mail.gmail.com>
 <20181010091240.30e7e37f@windsurf>
Message-ID: <CAGm1_ks1S0VkEFOJEyXW+k1B3VMeWNTmQXJG4-K33UE2+dkVoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2018 at 9:12 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 10 Oct 2018 09:02:02 +0200, Yegor Yefremov wrote:
>
> > > Isn't the glibc bug that it allowed to use fpenv in situations where it
> > > shouldn't have allowed it ? If that's the case, perhaps the other
> > > libcs didn't had this bug, and fpenv really shouldn't be used with MIPS
> > > soft-float, regardless of the C library in use ?
> >
> > I've made a compile test with musl and it fails too. So I'll just
> > disable fpenv if BR2_MIPS_SOFT_FLOAT is selected. So ne need to
> > mention glibc.
> >
> > Strange, that it didn't show up in the build tests ...
>
> We don't test mips/musl in the autobuilders. However, we do test
> mips/uclibc, but maybe not in soft-float mode.

uclibc has special handling: both fpenv and wstring will be disabled.

Yegor
