From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 00:07:29 +0200
Subject: [Buildroot] [PATCH 13/16] erlang-jiffy: New package
In-Reply-To: <20170530145211.15320-14-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-14-johan.oudinet@gmail.com>
Message-ID: <20170531000729.2059186b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 16:52:08 +0200, Johan Oudinet wrote:
> JSON NIFs for Erlang.
> https://github.com/davisp/jiffy
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/erlang-jiffy/Config.in         | 10 ++++++++++
>  package/erlang-jiffy/erlang-jiffy.hash |  2 ++
>  package/erlang-jiffy/erlang-jiffy.mk   | 12 ++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/erlang-jiffy/Config.in
>  create mode 100644 package/erlang-jiffy/erlang-jiffy.hash
>  create mode 100644 package/erlang-jiffy/erlang-jiffy.mk

Missing addition to the DEVELOPERS file. Please fix this in the 3
patches adding the 3 new packages.

> +ERLANG_JIFFY_VERSION = 0.14.8
> +ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
> +ERLANG_JIFFY_LICENSE = MIT

There are some parts under BSD-3c, and tests under yet another license.
This should be indicated here.

Also, most other erlang packages have INSTALL_STAGING = YES, but not
this one. Why?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
