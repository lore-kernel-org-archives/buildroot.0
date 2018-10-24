From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 24 Oct 2018 11:34:08 -0400
Subject: [Buildroot] [PATCH] PostgreSQL: bump version to 11.0
In-Reply-To: <n424afxool.ln2@ID-313208.user.individual.net>
References: <20181023171555.18043-1-aduskett@gmail.com>
 <n424afxool.ln2@ID-313208.user.individual.net>
Message-ID: <CAFSsvmrWpqXHnzo-63j6D3jxCJVRuZgbzmMeX8hFiYqKtpL_Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hey Bernd;

Looking into it, I would put it there. If host-llvm is compiled,
Postgres will find that
and try to use it to compile the JIT, which can result in build failures.

So either 2 options:

1) Explicitly disable llvm using the flag --without-llvm
2) Fix llvm detection.

What do you think?

Adam
On Tue, Oct 23, 2018 at 1:26 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Am Tue, 23 Oct 2018 13:15:55 -0400 schrieb Adam Duskett:
>
> > Other changes:
> >  - Add --without-llvm to CONF_OPTS as PostgreSQL now comes with an
> >  optional
> >    JIT.
>
> Hi Adam,
>
> besides --without-llvm the bump was already committed:
>
> https://git.buildroot.net/buildroot/commit/?
> id=49b9ec7d1c87c63873806bbe8b494d3b1ca99fe1
>
> Is --without-llvm really necessary?
> I could not see any problems without this option.
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
