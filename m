From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 13:48:06 +0200
Subject: [Buildroot] [PATCH] python-ranger: new package
In-Reply-To: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
References: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
Message-ID: <20151021134806.4c7a27ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Oct 2015 21:01:39 +0200, Thijs Vermeir wrote:
> ranger is a console file manager with VI key bindings. It provides a
> minimalistic and nice curses interface with a view on the directory hierarchy.
> It ships with "rifle", a file launcher that is good at automatically finding
> out which program to use for what file type.
> 
> http://ranger.nongnu.org

Thanks for your contribution! Others have already reviewed your patch
in details, but I have one question (not really for you, but mainly for
the other core Buildroot developers).


> diff --git a/package/Config.in b/package/Config.in
> index 7392363..578ba1b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -659,6 +659,7 @@ menu "External python modules"
>  	source "package/python-pyxml/Config.in"
>  	source "package/python-pyyaml/Config.in"
>  	source "package/python-pyzmq/Config.in"
> +	source "package/python-ranger/Config.in"
>  	source "package/python-requests/Config.in"
>  	source "package/python-rtslib-fb/Config.in"
>  	source "package/python-serial/Config.in"

This menu is normally for "External python modules" (as its prompt
says). However here, python-ranger is not really a python module, it's
a regular application that ends up being implemented in Python (but
it's kind of an implementation detail).

So I would rather see it visible in "System tools" or "Shell and
utilities", and named just 'ranger' (which is the upstream name for the
project.

Peter ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
