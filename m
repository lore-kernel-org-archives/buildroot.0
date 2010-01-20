From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 20 Jan 2010 01:35:55 +0100
Subject: [Buildroot] [PATCH] Fix autotools instalation with symbols
In-Reply-To: <20100119193235.2681.75712.stgit@localhost.localdomain>
References: <20100119193235.2681.75712.stgit@localhost.localdomain>
Message-ID: <1263947755.5454.52.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 19 janvier 2010 ? 21:32 +0200, Paulius Zaleckas a ?crit :
> When installing without symbols install-strip is used,
> with symbols - install-exec.
> Since install-exec installs only executables, we should use
> simple install, to install other needed files also
> (like files in /usr/shared) as install-strip does.

Fully agree !

As well libraries' plugins aren't installed with install-exec (directfb
gfxdrivers for examples). So we really need install-strip or install
instead of install-exec.

Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>
