From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 16:52:28 +0200
Subject: [Buildroot] [PATCH] package/libbytesize: remove pcre2 runtime
 dependency
In-Reply-To: <749f0f6adb5df95c1d0b0b7ad101caae@agner.ch>
References: <226176cabe249af62546689fbb39de8a7010c329.1616681740.git.stefan@agner.ch>
 <8735wjl3d5.fsf@tarshish>
 <c1c09133e8e3d70f0458fd0da622062f@agner.ch>
 <20210325163942.7d8ecb69@windsurf.home>
 <749f0f6adb5df95c1d0b0b7ad101caae@agner.ch>
Message-ID: <20210328145228.GP24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2021-03-25 17:41 +0100, Stefan Agner spake thusly:
> On 2021-03-25 16:39, Thomas Petazzoni wrote:
> > On Thu, 25 Mar 2021 15:40:36 +0100
> > Stefan Agner <stefan@agner.ch> wrote:
> >> Is there a way to have something as compile time dependency but not a
> >> runtime dependency?
> > No, because it is fairly uncommon to have something that is a compile
> > time dependency but not necessary at runtime. Do you have specific
> > examples in mind ?

Well, technically there are two cases:

  - dependencies on a host package
  - dependencies on a header-only package

However, even in the later case, the package that provides those headers
still needs to be enabled in the configuration and must also be built
and installed (actually, only installed as it is headers-only) before
the package that depends on it gets built.

I've marked the patch as rejected in Patchwork now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
