From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 17:29:08 -0300
Subject: [Buildroot] [PATCH 5/7 v4] download/git: ensure we checkout to
 a clean state
References: <a2163717a6bf4dde0c8f6c165be1d72f5c5a3831.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <5ae62b148a271_1bfd2afefea683f8994c0@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 28, 2018 at 04:34 PM, Yann E. MORIN wrote:

> Force the checkout to ignore and throw away any local changes. This
> allows recovering from a previous partial checkout (e.g. killed by
> the user, or by a CI job...)
> 
> git checkout -f has been supported since the inception of git, so we
> can use it without any second thought.
> 
> Also do a forced-forced clean, to really get rid of all untracked stuff.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with patches until this one applied: the checkout succeeds and the hash matches
 even if staged changes, not staged changes, untracked files or untracked
 directories containing another git repo are manually added to the cache, tested
 using git versions 1.7.1, 1.8.3, 2.11.0, 2.14.1.
 The only exception is that the hash mismatches when using git 1.7.1 with a
 package with submodules, but it always failed, even with previous versions of
 Buildroot, because ancient git versions do not create .git files for
 submodules, and use inplace .git directories instead. No one complained so far
 for this case, so we shouldn't try to fix this specific scenario that no one
 uses, IMO.]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
