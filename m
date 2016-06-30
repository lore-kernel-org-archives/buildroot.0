From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jun 2016 10:12:27 +0200
Subject: [Buildroot] [PATCH 05/24] erlang-goldrush: drop unused host
 variant
In-Reply-To: <1467207991-4905-6-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <1467207991-4905-6-git-send-email-julien.floret@6wind.com>
Message-ID: <20160630101227.593f5752@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 15:46:12 +0200, Julien Floret wrote:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

This one is a good example of what I said yesterday. You have the
following dependency chain:

 ejabberd -> host-erlang-lager -> host-erlang-goldrush

The host-erlang-lager -> host-erlang-goldrush dependency is not visible
by grepping for host-erlang-goldrush because the erlang-lager package
only does:

ERLANG_LAGER_VERSION = 2.2.0
ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
ERLANG_LAGER_LICENSE = Apache-2.0
ERLANG_LAGER_LICENSE_FILES = LICENSE
ERLANG_LAGER_DEPENDENCIES = erlang-goldrush

$(eval $(rebar-package))
$(eval $(host-rebar-package))

And the line:

ERLANG_LAGER_DEPENDENCIES = erlang-goldrush

implies:

HOST_ERLANG_LAGER_DEPENDENCIES = host-erlang-goldrush

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
