From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:28:01 +0200
Subject: [Buildroot] [PATCH 09/34] reproducibility/libglib2: allow
 removing codegen
In-Reply-To: <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507152801.1eab6310@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Cc'ing Gustavo on this, since he has done quite a bit of libglib
packaging work.

On Sat, 30 Apr 2016 09:49:05 +0200, Gilles Chanteperdrix wrote:
> glib2 installs compiled python bytecode in /usr/share/glib-2.0/codegen,
> likely for the gdbus-codegen program.
> 
> This bytecode is not compiled with the buildroot host python, which
> causes a first source of non reproducibility, fix that by using
> buildroot host python.

Which has the annoying side effect of increasing even more the set of
mandatory dependencies to build libglib :-/

So I wonder if the dependency on host-python should be made conditional
on BR2_REPRODUCIBLE.

> But this is not sufficient, compiling the python bytecode with the
> same interpreter in different environments yields different binaries,
> so, since buildroot users are unlikely to need the qdbus-codegen
> program on target, add an option to remove it. The option is disabled
> by default.

Since then, Gustavo has already modified the libglib2 package to
remove the /usr/share/glib-2.0/codegen directory. However,
gdbus-codegen is not removed.

See commit 1f1f16e9e5367048faa1cf17237e0c0d422e98d6.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
