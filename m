From: Stefan Becker <chemobejk@gmail.com>
Date: Mon, 26 Mar 2018 15:08:29 +0300
Subject: [Buildroot] [PATCH 1/1] Makefile: fix build break in sdk target
In-Reply-To: <CAOJ2eMcc6TuND32UFt_TLQA1atMNGNrPshqjREWgo4VO71iapg@mail.gmail.com>
References: <20180326072332.30808-1-chemobejk@gmail.com>
 <20180326111613.002ee281@windsurf>
 <CAOJ2eMcc6TuND32UFt_TLQA1atMNGNrPshqjREWgo4VO71iapg@mail.gmail.com>
Message-ID: <CAOJ2eMfVN6rr7qNkBr1-FkX2tHu+hAsGnQtOEybr2NZz+OYZTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Mar 26, 2018 at 12:21 PM, Stefan Becker <chemobejk@gmail.com> wrote:

> On Mon, Mar 26, 2018 at 12:16 PM, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
>
>> Hello,
>>
>> While this is OK, I am still not sure to understand why you are seeing
>> this problem. My commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad moved
>> the creation of the $(HOST_DIR)/share/buildroot folder from a
>> dependency of the toolchain package, to a post-install staging hook of
>> the toolchain package.
>>
>
> The top-level buildroot build steps executed are (a) "xyz_deconfig" and
> (b) "all sdk".
>
> Could be that you do not see the problem if you execute "all" and then
> "sdk". But then it would mean that some dependency is missing on the "sdk"
> target, which I agree would be worse.
>

I guess the real problem with commit
6729050f3a49dba42d2d881d31dbefd6b82b8dad is that it adds a script to
toolchain install staging hooks, but does not set TOOLCHAIN_INSTALL_STAGING
to YES. Thus after that change the script is no longer executed during the
build.

I've submitted another patch to fix the root cause.

Regards, Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180326/13d47d64/attachment.html>
