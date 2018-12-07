From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Dec 2018 20:31:05 +0100
Subject: [Buildroot] [PATCH 1/1] core/sdk: don't mangle symlinks with
 '.' or '..' at start
In-Reply-To: <CA+1k=2aNtT59ZjhP_ZiUM6xC52xVCpB=rRWLf02L_LuFB=SRNQ@mail.gmail.com>
References: <20181207035052.316-1-JoelsonCarl@gmail.com>
 <20181207113055.GG2561@scaer>
 <CA+1k=2aNtT59ZjhP_ZiUM6xC52xVCpB=rRWLf02L_LuFB=SRNQ@mail.gmail.com>
Message-ID: <20181207193105.GI2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joel, All,

On 2018-12-07 11:08 -0700, Joel Carlson spake thusly:
> On Fri, Dec 7, 2018 at 4:31 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> >     $(patsubst /%,%,$(HOST_DIR))
> I didn't read the documentation on patsubst close enough and didn't
> realize you could make it replace only the first occurrence.  That
> suggestion works and I'll use it.
> 
> > Now, this fixup is not enough, in fact, because thisleaves symlinks to
> > absolute paths borked, e.g.:
[--SNIP--]
> Symlinks with an absolute path is not a case I had considered.
> I will work this further and submit a v2 patch.  Thanks!

Note that I al ready sent a v2 with your patch ammended, and the
absolute symlinks handled:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=80485

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
