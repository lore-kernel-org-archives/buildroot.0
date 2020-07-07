From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 22:26:44 +0200
Subject: [Buildroot] [PATCH] package/swig: enable support for Node.js >=
 12.x
In-Reply-To: <20200707051023.19992-1-yegorslists@googlemail.com>
References: <20200707051023.19992-1-yegorslists@googlemail.com>
Message-ID: <20200707202644.GU2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2020-07-07 07:10 +0200, yegorslists at googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Recent Node.js versions have removed some depreciated API calls,
> that swig still relies on. Patches taken from this PR [1] fix
> this issue.
> 
> [1] https://github.com/swig/swig/pull/1746
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...-to-support-both-Handle-and-Local-ty.patch |  53 ++
>  ...ith-Local-depending-on-Node.js-versi.patch | 649 ++++++++++++++++++
>  .../0003-Add-support-for-Node.js-v12.patch    | 207 ++++++
>  3 files changed, 909 insertions(+)
>  create mode 100644 package/swig/0001-Introduce-macros-to-support-both-Handle-and-Local-ty.patch
>  create mode 100644 package/swig/0002-Replace-Handle-with-Local-depending-on-Node.js-versi.patch
>  create mode 100644 package/swig/0003-Add-support-for-Node.js-v12.patch

So, few things:

 1. I don't see how swig can use or detect nodejs, as you are not adding
    a build dependency to host-nodejs;

 2. this is a feature patch IMHO, and upstream has not even applied it
    yet;

 3. swig is a host-only package; why would we want it to have proper
    nodejs support in Buildroot?

As such, this is a not for me so far. If upstream were to apply it, we
may consider a backport, as long as there is a use-case for it.

Consequently, I haven't even looked at that spacing problem you
noticed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
