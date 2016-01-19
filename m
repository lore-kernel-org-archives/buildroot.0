From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 00:02:09 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
 ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <569EBF6A.4080208@mind.be>
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 <87lh7l3asr.fsf@dell.be.48ers.dk>
 <CAAXf6LUqCv04ZkCH5fKwq2_0w9hBYFYXM_Bf5t1yawG1D8yeTQ@mail.gmail.com>
 <20160119182947.GB3360@free.fr> <878u3l2z9f.fsf@dell.be.48ers.dk>
 <CAAXf6LVSwy5ozhJ4cYrSDF5gXBNEkjEs9ej_L2TkLa5a4avV8g@mail.gmail.com>
 <569EBF6A.4080208@mind.be>
Message-ID: <20160119230209.GJ3360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On 2016-01-19 23:57 +0100, Arnout Vandecappelle spake thusly:
> On 19-01-16 20:40, Thomas De Schampheleire wrote:
> > 
> > On Jan 19, 2016 19:35, "Peter Korsgaard" <peter@korsgaard.com
> > <mailto:peter@korsgaard.com>> wrote:
> >>
> >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr
> > <mailto:yann.morin.1998@free.fr>> writes:
> >>
> >> Hi,
> >>
> >> >> I was not aware that glibc already depends on skeleton. Then indeed
> >>  >> ThomasP's reasoning is correct and the patch should be simplified. I
> >>  >> will investigate that further and resubmit.
> >>
> >>  > Skeleton is currently not a dependency of host-gcc-initial, so you'd
> >>  > have to make it so.
> >>
> >> Ahh yes, we only add it for target packages.
> > 
> > I did 'make clean toolchain' on x86-64 qemu defconfig but with glibc, and at the
> > end I noticed that skeleton was built and the symlinks were correctly created.
> > So which package had the skeleton dependency? (Don't have a buildroot near me ATM)
> 
>  glibc is a target package so depends on skeleton (see pkg-generic.mk, search
> for skeleton).

And even before glibc, linux-headers is a target package. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
