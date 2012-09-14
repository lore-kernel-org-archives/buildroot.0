From: Romain Izard <romain.izard.pro@gmail.com>
Date: Fri, 14 Sep 2012 08:50:29 +0000 (UTC)
Subject: [Buildroot] build an "autotooled" that is out of tree
References: <50524954.2070101@free.fr>
Message-ID: <k2ur4l$djn$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-09-13, David Bonnin <dboml@free.fr> wrote:
> Hello,
>
> We have a projet that out of the buildroot tree.
> This projet is build with autotools.
>
> When we run .configure script of our projet, we need to set a lot of env 
> variable and pas os it to ./configure.
>
Put the buildroot compiler path (<buildroot path>/output/host/usr/bin/) 
in your PATH, and launch ./configure --host=<compiler prefix>. The compiler
there is a wrapper to the real compiler, with additional default settings.

This should take care of most problems.

-- 
Romain Izard
