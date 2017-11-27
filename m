From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 27 Nov 2017 15:01:29 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <20171126152140.0fd3902b@windsurf.home>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
Message-ID: <CAJtjsKZjOxXO=Gu475a+6gP9TR4RrEptaS1MfuHYpdzjbF5Aig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sun, Nov 26, 2017 at 3:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/407af9800313d4540643d7625e85acc0c2366892 |
>>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/2aca54ad48ecfd72242d97499e21a46c1b384b10 |
>
> It fails to build on powerpc64le host machines. Johan, could you have a
> look into this? Looking at the build failure, it looks like the Erlang
> build system is forcing some powerpc64 big-endian flags, while we're
> building on powerpc64 little-endian.
>
> Johan: you can request an access to a power64le machine using
> https://cfarm.tetaneutral.net/users/new/. Say you're working on the
> Buildroot project when creating your account. Once your account is
> created, you can log it to gcc112.fsffrance.org, and do a build that
> includes Erlang. Something as simple as:
>
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ERLANG=y
>
> reproduces the problem.
>
> Also, perhaps this is something our PowerPC64 friends from IBM could
> help fixing? Sam? Joel?

I've asked for an account.
In the meantime, looking for Erlang users on powerpc64le (I barely use
it myself and have no such architecture at my disposal), it looks like
this was fixed in OTP 20:
https://bugs.erlang.org/browse/ERL-369

From Erlang website, it looks like OTP 20 and OTP 20.1 have been
released. May Erlang maintainer's (Will Newton) bump the version?

-- 
Johan
