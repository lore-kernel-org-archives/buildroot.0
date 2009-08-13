From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 13 Aug 2009 11:05:57 -0300
Subject: [Buildroot] Explicit dependencies on uclibc in makefiles
In-Reply-To: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
References: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
Message-ID: <d6cda7730908130705s11275a7cu78d2dbca3ee15041@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

   The dependencies in Makefiles are what make uses to figure out the
build order. All but the most trivial programs will require the libc,
thus the uclibc dependency.
   In your packages, you could just depend on the libraries you
require, as those will likely depend on uclibc.

   Without the proper dependencies, the build order in one case or
another could be switched and when your package is compiled, the
dependencies are not yet available.

Kind Regards,
    Thiago A. Correa


On Tue, Aug 11, 2009 at 12:55 PM, Will Newton<will.newton@gmail.com> wrote:
> Hi all,
>
> A number of packages in buildroot express explicit dependencies on
> uclibc in their makefiles, e.g.:
>
> ?MYPACKAGE_DEPENDENCIES = uclibc
>
> Is this really necessary?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
