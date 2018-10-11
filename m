From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 11 Oct 2018 10:31:06 -0400
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <CA+-urNQGnEyUXdWEtz-Sx2QRSUULsqahN5MYQK-_ZaKRmvT2jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2018 at 11:48 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> >       x86_64 |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/fc633f80c7c36a90e641487f5a888fbb767c2a54 |
>
> In file included from zlib/adler32.c:11:0:
> zlib/zutil.h:172:39: error: "_LFS64_LARGEFILE" is not defined [-Werror=undef]
>      (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
>
> Seems like a musl/erlang issue. Johan, Frank, could you have a look ?
>

I sent the following patch for this upstream:

https://github.com/erlang/otp/pull/1981

I'll send a patch here next chance that I get.

-Frank
