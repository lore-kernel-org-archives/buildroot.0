From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 30 Nov 2019 22:57:47 +0200
Subject: [Buildroot] Compiling Python packages with C extensions with
 per-package directories
In-Reply-To: <20191130210725.180ee73a@windsurf>
References: <CALFsTFVv0esYx0XKRLpRidTSu9sV1AmxT0n-A_GTNGEEuHWTxQ@mail.gmail.com>
 <20191130210725.180ee73a@windsurf>
Message-ID: <CALFsTFVNJi=CjuySUhgntAYjUvGpLUO78XoRH+bUtOH_1vw9=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Nov 30, 2019 at 10:07 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Asaf,
>
> On Sat, 30 Nov 2019 21:20:05 +0200
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > As now some work on per-package directories has been merged for the
> > next release, I tried to play with it a little and encountered the
> > following problem:
> > When compiling a Python package with C sources, the compilation fails.
>
> I have this patch:
>
>   https://github.com/tpetazzoni/buildroot/commit/f2a92b1321bd0d63e5fad81b0cfc9ace910d17a0
>
> which I believe should fix the problems you mention. My patch series
> for per-package was just the core support. I have a number of
> additional patches at
> https://github.com/tpetazzoni/buildroot/commits/ppsh-v8-work that fix
> some issues with per-package directories (but not all, of course).

Yeah, it looks like some of your additional patches will solve those issues.

Just out of curiosity, do we have any roadmap for merging those patches or any
"known issues" regarding this feature that have to be resolved?

>
>
> > I don't think we want to tweak the _sysconfigdata file for every
> > python package (although it would lead to a more "correct" situation,
> > in which every sysroot contains _sysconfidata with proper paths).
> > In addition, I wonder why do we need to copy all the toolchain-related
> > files for every single package? (Maybe a symlink can help?)
>
> We don't copy things for every single package, we do hard links. All
> the per-package logic is based on making copy using hard links, so it
> is very cheap.
>
> My patch at
> https://github.com/tpetazzoni/buildroot/commit/f2a92b1321bd0d63e5fad81b0cfc9ace910d17a0
> indeed consists in tweaking the sysconfigdata on a per package basis.
> Do not hesitate to let me know if you see any other solution. Ideally,
> all the paths in sysconfigdata should be defined relatively to the
> location of the sysconfidata file itself. I think I tried to do that
> back then, but didn't succeed.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks,
Asaf.
