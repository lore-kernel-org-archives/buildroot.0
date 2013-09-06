From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Sep 2013 16:34:07 +0200
Subject: [Buildroot] [RFC] Unification of package comments on wchar,
 largefile, c++ support, thread, ... support
In-Reply-To: <20130906142807.44427db7@skate>
References: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
 <CAAHaz6E16CcRV1gpvFA3KvPfvf78JjqywVJFZxCgs5YOCAeF2g@mail.gmail.com>
 <CAAXf6LWyOHWDxPHkwga4mCy3UaCu93XEvAaXBpRz86wrQyPfnw@mail.gmail.com>
 <20130906142807.44427db7@skate>
Message-ID: <CAAXf6LU0aHEC3KH_5ZUN+ffXGAiDanfX+Qj2RZG5bruzPjtJkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 6, 2013 at 2:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 6 Sep 2013 12:37:05 +0200, Thomas De Schampheleire wrote:
>
>> My question to the community: do we agree on the wording above (foo
>> needs a toolchain w/ XXX, YYY)?
>> If yes, then I will proceed to making the changes.
>
> Do we really want to use all uppercase, even for things like thread
> support?
>
> We have the choice between:
>
>  (1) All lower-case
>
>  comment "directfb needs a toolchain w/ ipv6, rpc, thread, wchar"
>
>  (2) Lower-case, except when it doesn't make sense (acronyms)
>
>  comment "directfb needs a toolchain w/ IPv6, RPC, thread, wchar"
>
>  (3) All upper-case
>
>  comment "directfb needs a toolchain w/ IPv6, RPC, THREAD, WCHAR"

All options are fine for me. I think the most important thing is that
the user can map the comment onto the necessary configuration options
in the toolchain menu.
The second one is most balanced, I'm slightly leaning towards that.

>
> Also, the other question is which features do we mention. IPv6, RPC,
> largefile, wchar, C++ and thread have always been there. However, the
> need for dynamic library hasn't been always but in the comments, but
> you were suggesting to include it. Also, what about MMU dependency ?

I'm not suggesting we should. I saw at least one package that did
mention dynamic library support (sshfs), so I think we should line up:
either mention it when needed (!PREFER_STATIC_LIB) or not mention it
anywhere (and thus change sshfs).
For MMU the same: I'm open for either one, as long as we have a clear
strategy and follow that for all packages.

If you ask my opinion, I would also mention the need for dynamic
library and MMU, but it's not a strong opinion.

Best regards,
Thomas
