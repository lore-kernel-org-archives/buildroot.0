From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 13:41:55 +0100
Subject: [Buildroot] [PATCH] packages: add tzdata
In-Reply-To: <20130104120759.GA10338@mail.sceen.net>
References: <1357300124-7011-1-git-send-email-rbraun@sceen.net>
 <20130104125447.04031e67@skate>
 <20130104120759.GA10338@mail.sceen.net>
Message-ID: <20130104134155.4ff8f301@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Fri, 4 Jan 2013 13:07:59 +0100, Richard Braun wrote:

> > depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
> 
> This would prevent other applications with support for the format from
> using it (in other words, although I'm not aware of other such
> applications, glibc might not be the only user). The time zone database
> itself has no real dependency. Do you still think I should add these,
> and change them when needed only ?

Hum, good question. Maybe you can keep it as you proposed, but increase
the help text about uClibc, explaining that this is generally mostly
useful with glibc, but kept available for uClibc in case a specific
application makes use of tzdata.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
