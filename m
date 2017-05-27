From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 May 2017 10:49:22 +0200
Subject: [Buildroot] keepalived build failures
In-Reply-To: <CADvJCodt9mua7JUpJeMwLK6gvx--zn62553APPDJ2L9VTLiEBg@mail.gmail.com>
References: <CADvJCodt9mua7JUpJeMwLK6gvx--zn62553APPDJ2L9VTLiEBg@mail.gmail.com>
Message-ID: <20170527084922.GA3242@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ilias, All,

On 2017-05-27 10:43 +0300, Ilias Apalodimas spake thusly:
> Regarding these reports
> http://autobuild.buildroot.net/results/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5
> http://autobuild.buildroot.net/results/1adb710b915427f681eae37452a0942833ce533e
> http://autobuild.buildroot.net/results/70b31547e51ec7213372d2ef07bec34c5df77560
> 
> These are all using an external toolchain and linux-3.2 headers.
> Keepalived includes linux_ip_set.h when ipset package is enabled,
> which conflicts with linux xt_set.h header.
> 
> Yann Morin was kind enough to reproduce the build using linux-3.4
> headers and the compilation failure went away.
> 
> Shall i submit a patch that limits keepalived to linux-headers > 3.2
> when ipset is enabled?
> Is there a better solution?

I think we discussed that on IRC a few days ago, and I suggested that
you indeed send a patch making keepalived depends on headers >= 3.2:

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

And update the comment accordingly.

Regards,
Yann E. MORIN.

> 
> Regards
> Ilias
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
