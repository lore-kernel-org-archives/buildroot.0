From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 11:01:26 +0200
Subject: [Buildroot] [PATCH] package/erlang: build host-erlang with
 support for openssl
In-Reply-To: <87a973zj6w.fsf@dell.be.48ers.dk>
References: <1408117755-24948-1-git-send-email-yann.morin.1998@free.fr>
 <87a973zj6w.fsf@dell.be.48ers.dk>
Message-ID: <20140817090126.GA5274@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-08-17 09:09 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Erlang uses openssl for all things crypto.
>  > Since there are host Erlang tools that use crypto (such as rebar), we
>  > need to build host-erlang with support for crypto, and thus it shall
>  > depends on openssl.
> 
>  > Suggested-by: Frank Hunleth <fhunleth@troodon-software.com>
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Frank Hunleth <fhunleth@troodon-software.com>
>  > Cc: Johan Oudinet <johan.oudinet@gmail.com>
> 
>  > ---
>  > Note: I am not sure whether this is the correct solution, to match the
>  > host SSL support to the target SSL support. I'll let the erlang experts
>  > enhance that patch if need be. ;-)

(Sorry, I should have removed this post-comit note in this v2)
 
> Sorry, I must have missed the discussion about this. What exactly does
> it fix?

Some Erlang packages (like ejabberd) use an Erlang script to do part of
the configure and build steps, thus we need a host Erlang.

This script may need to do some crypto stuff (e.g. to compute hashes,
or do https). In the Erlang world, all crypto stuff is implemented by
using oppenssl as the crypto backend.

So, we need a host Erlang with crypto support, and thus linked with
openssl.

> Do we need it for 2014.08?

Well, it can well wait for after the release, if you're not at ease with
it. Currently, we have no package that require Erlang, not even the host
Erlang.

However, since our host-erlang not being ssl-aware, it means no one is
really using it, and thus bumping should not cause a regressiopn for
anyone.

No one, but me, has complained so far. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
