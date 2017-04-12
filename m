From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 11:46:32 +0200
Subject: [Buildroot] [PATCH 01/53] pkg-rebar: remove redundant / in
 front of $($(PKG)_ERLANG_LIBDIR)
In-Reply-To: <20170412093928.1006-2-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
 <20170412093928.1006-2-arnout@mind.be>
Message-ID: <20170412114632.3ea39fdb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 11:38:35 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

>  define install-erlang-directories
> -	$(INSTALL) -d $(1)/$($(PKG)_ERLANG_LIBDIR)
> +	$(INSTALL) -d $(1)$($(PKG)_ERLANG_LIBDIR)

This looks a bit weird to me. Wouldn't it make more sense to have
ERLANG_LIBDIR not start with a / ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
