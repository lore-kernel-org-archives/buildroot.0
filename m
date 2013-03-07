From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 14:08:18 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - emacs
In-Reply-To: <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
Message-ID: <20130307140818.0d48c197@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spielmann Werner,

On Thu, 7 Mar 2013 13:47:39 +0100, Spielmann Werner wrote:
> Hello Thomas,
> 
> Many thanks for your explanation. You are right, emacs was not really
> installed. There were only Links:
> 
>   /usr/bin/emacs -> /etc/alternatives/emacs
>   /etc/alternatives/emacs -> /usr/bin/jove
> 
> => strange!

Why strange? Jove pretends to be an emacs clone, so Debian/Ubuntu
installs it as an Emacs alternative. See
http://wiki.debian.org/DebianAlternatives.

> The Patch didn't work at the first attempt, as far as I can see the
> line numbers of autoconf.mk do not match (I have installed the
> buildroot-2013.02 from the download directory - perhaps do you use
> newer versions from the repository?). So I installed emacs - seemed
> to be the fastest solution!  ;-)

I don't think autoconf.mk has changed since 2013.02, so I don't
understand why the patch doesn't apply for you, especially since it's a
one-liner.

Anyway, I'm pretty sure EMACS="no" fixes your problem, even if you keep
Jove installed instead of Emacs. I tested it here, and the
host-autoconf build process no longer tries to compile the .el files
into .elc files using Emacs.

I've submitted the patch for inclusion into Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
