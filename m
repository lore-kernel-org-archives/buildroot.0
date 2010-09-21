From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 21 Sep 2010 09:02:35 +0200
Subject: [Buildroot] /etc/ld.so.conf and /etc/ld.so.conf.d in buildroot
 target skeleton
In-Reply-To: <20100921075118.5a58154a@surf>
References: <AANLkTimEShvTw0M4Yt4dGE3BbxbX4q4RQ5tfbc-BJ7rb@mail.gmail.com>
	<AANLkTi=LRi8OJTNY-3_q0_c=qcO4yv-sQoaJr=w=F=sf@mail.gmail.com>
	<AANLkTim=o6+2+jBXk0NAOv7md5TkK_V1tW9bcmsWfBER@mail.gmail.com>
	<1284659221.12897.414.camel@coalu.atr>
	<AANLkTi=0_3BUjZ-gww3Kz99Y1dfvBcoNebrWX_fwE+u2@mail.gmail.com>
	<1284895170.12897.546.camel@coalu.atr>
	<AANLkTi=V6mNKXRM=c5KJHugtVyqai3At-sp5fQ8mFiTu@mail.gmail.com>
	<20100921075118.5a58154a@surf>
Message-ID: <AANLkTimRUNm4R88TJ7sSbxmqakrQVwBRUgfKoy9M+9Yb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Sep 21, 2010 at 8:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 19 Sep 2010 16:39:24 +0200
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
>
>> That looks like a good solution.
>> In case of uClibc though, the parsing of ld.so.conf is a configurable
>> option (LDSO_CACHE_SUPPORT), so before generating an ld.so.conf we
>> should check whether that option is set.
>
> We don't really support any other uClibc configuration than the one we
> ship in toolchain/uClibc/uClibc-x.y.z.config. If an user changes the
> configuration we provide, (s)he has to be ready for some build
> breakage, because we are testing the build of all packages only with
> this specific uClibc configuration. I don't think we can sanely enter
> the game that would consist in handling all possible uClibc
> configurations to know which packages need what.

Ok, I can understand that.

>
> Concerning LDSO cache, the LDSO_CACHE_SUPPORT is disabled in our
> default configuration.

But then I don't understand why there is an /etc/ld.so.conf.d
directory in the default skeleton, while glibc is not part of the
default.
In my opinion then, this empty directory should be removed (leaving
the creating of the ld.so.conf* files to developers with a custom
configuration).

Best regards,
Thomas
