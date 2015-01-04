From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jan 2015 15:21:05 +0100
Subject: [Buildroot] [PATCH v2] erlang: selectively enable libatomic_ops
In-Reply-To: <1419295981-30100-1-git-send-email-fhunleth@troodon-software.com>
References: <1419295981-30100-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150104142105.GA4137@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2014-12-22 19:53 -0500, Frank Hunleth spake thusly:
> Erlang can use either the system libatomic_ops or its own version.
> However, if using the system version, it must find implementations for
> AO_compare_and_swap() and other calls.  Since these are not available on
> ARM versions before armv6+, selectively enable the use of the system
> libatomic_ops.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/eba/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/
>   http://autobuild.buildroot.net/results/c74/c743cfca629fb332bbb1327cf4ea360f0a4e4bfe/
>   http://autobuild.buildroot.net/results/095/095348d4d309c2a408a3b297b4325348ed1dd7e8/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

I've sent an alternate solution to this libatomic_ops issue:
    http://patchwork.ozlabs.org/patch/425174/

This is much simpler, Buildroot-wise, as it essentially patches erlang,
so that it properly use libatomic_ops.

This is the result of a past discussion with Thomas P. on IRC, where he
pointed me to a patch we have against libunwind, that does require CAS
too, and for which we add `#define AO_REQUIRE_CAS', as instructed in the
libatomic_ops documentation.

Could you please test that new patch and report on it, please?

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
