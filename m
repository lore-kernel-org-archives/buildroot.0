From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 7 Jul 2013 22:09:55 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <20130707213825.170ad4fb@skate>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <20130707213825.170ad4fb@skate>
Message-ID: <CAHXCMMLKuwLFzDKdGKzJtKTkVPZHBx5OND2cHHH0u2QcEnYcAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/7/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Sun,  7 Jul 2013 20:42:19 +0200, Samuel Martin wrote:
>> MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
>> To avoid this, unset the MAKEFLAGS environment variable.
>
> Does unsetting MAKEFLAGS really allows to prevent top-level parallel
> build on Buildroot?
It does, but as Peter points out, this also disables some other
options we don't want to see disabled.
So, forget about this patch.

> Or does it only prevents MAKEFLAGS from leaking to
> the sub-make calls that we do to build packages?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



-- 
Samuel
