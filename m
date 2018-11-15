From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2018 17:59:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs wchar
In-Reply-To: <20181101223046.72222a3c@windsurf>
References: <20181023160931.16417-1-bernd.kuhls@t-online.de>
 <CAFSsvmqEdPu2V3j=d55j6cUVmNeC0MSjTmA5HM1R5HcWh1LzwA@mail.gmail.com>
 <643ca3d2-1825-4707-5fbb-0817229188f9@mind.be>
 <20181101223046.72222a3c@windsurf>
Message-ID: <20181115165903.GL10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-01 22:30 +0100, Thomas Petazzoni spake thusly:
> On Tue, 23 Oct 2018 19:04:26 +0100, Arnout Vandecappelle wrote:
> >  It is not strictly needed, but it is still useful to have it because:

I agree with Arnout here.

However, from a purely pragmatic point of view, I see that it is totally
useless in practice, so I would not mind we drop them.

And in retrospect, I think it *is* better that we do drop them. If the
top-level option loses that dependency, then it is 'easy' to detect it
has become mandatory for a sub-option, because the autobuilders will
fail.

However, if we repeat the dependency and the top-level option lses it
and we forget to remove it, we will never realise that the sub-option
shouldalso lose it.

> True. In this case:
> 
>  - Bernd did not propagate the dependency to p?p, qt and qt5base, which
>    all three are also directly selecting BR2_PACKAGE_POSTGRESQL
> 
>  - A number of places where BR2_PACKAGE_POSTGRESQL is selected do not
>    have the !BR2_STATIC_LIBS dependency.
> 
> I am really wondering what to do with those "useless" dependencies in
> general. On one hand, I agree with you that semantically, it is better
> to have them. On the other hand:
> 
>  - It's an additional maintenance burden.
> 
>  - It's never tested by the autobuilders, because such "useless"
>    dependencies are well, useless, because they are hidden by another
>    higher-level dependency. Because they are not tested, they are often
>    wrong and not maintained.
> 
> Due to this, whether we propagate them or not is completely random
> currently through the Buildroot tree, and I'm not sure it's a very nice
> situation.

I agree with you. Whatever we choose, we should do it consistently.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
