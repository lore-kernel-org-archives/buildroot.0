From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jun 2012 10:25:51 +0200
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <20120627000701.506f534e@skate>
References: <20120627000701.506f534e@skate>
Message-ID: <20120627102551.173d9347@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 27 Jun 2012 00:07:01 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> However, this status has changes since (e)glibc 2.14 (released in May
> 2011) and its subsequent version 2.15 (released in March 2012). The
> RPC support has been completely removed from (e)glibc, and the
> developers recommend to use the tirpc library instead. Apparently,
> tirpc offers additional benefits over the traditional RPC support that
> was part of (e)glibc, such as improved IPv6 support.
> 
> Since quite a while, Crosstool-NG allows to produce toolchains with
> (e)glibc 2.14/2.15, and since 2012.03, Sourcery CodeBench toolchains
> are also using (e)glibc 2.15. None of those toolchains have RPC
> support, but Buildroot for the moment assumes that they do since they
> are glibc-based.

Just to add a quick bit of information on this: glibc 2.16 should be
released early July, and they did some changes related to the RPC mess.
According to the glibc NEWS file, for version 2.16:

  73 * New configure option --enable-obsolete-rpc makes the deprecated RPC
  74   headers and functions available at compile time as they were before
  75   version 2.14.  This option will be removed at some time in the future
  76   after the TI-RPC library becomes fully sufficient for the needs of
  77   existing applications.

So it means that from now on, we will probably have some glibc
toolchains with RPC support included, and some other glibc toolchains
without RPC support included.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
