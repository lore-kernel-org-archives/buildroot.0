From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Feb 2017 09:31:41 +0100
Subject: [Buildroot] [PATCH] package/libplatform: rename to new upstream
 name
In-Reply-To: <20170210232758.151eef5f@free-electrons.com>
References: <1486749451-14259-1-git-send-email-yann.morin.1998@free.fr>
 <20170210232758.151eef5f@free-electrons.com>
Message-ID: <20170211083141.GA3988@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-10 23:27 +0100, Thomas Petazzoni spake thusly:
> On Fri, 10 Feb 2017 18:57:31 +0100, Yann E. MORIN wrote:
> > libplatform now goes by the nickname libp8platform.
> 
> Where do you see this? The github project is still named just
> "platform", it's the version that is named p8-platform-<something>.
> 
> Am I missing something?

Maybe the upstream repository is still named just 'platform' (and not
'libplatform', btw), but upstream renamed the project:

    https://github.com/Pulse-Eight/platform/commit/31d4993b11c82b4b52589ae7cc2800f859ddf01e

The commit log is very terse:  rename to p8-platform

But the very first hunk is explicit:

    CMakeLists.txt:
    -project(platform)
    +project(p8-platform)

Also, the whole /namespace/ has changed to p8: the .pc file, the cmake
config file, the library name...

So, OK, I missed the dash in the rename...

> What does p8platform means?

p8 stands for Pulse-Eight, the company behind libcec and libp8platform.

> Is it really better than libplatform? Is
> this rename really worth the effort?

Oh, such an effort to rename a few files and fix a few dependencies,
and add a legacy entry, indeed... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
