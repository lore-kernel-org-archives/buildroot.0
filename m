From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 16:58:29 +0100
Subject: [Buildroot] [git commit] erlang-rebar: fix license variables
Message-ID: <20160220160302.A2D1580E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=498055a8c2e66a8a36b6205555b1c7e806b4d31f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The erlang-rebar package uses ERLANG_ as the prefix for its license
variables, therefore overriding the license information from the
erlang package. This commit fixes this by using the appropriate
ERLANG_REBAR_ suffix.

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-rebar/erlang-rebar.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
index f29eb75..d2189e1 100644
--- a/package/erlang-rebar/erlang-rebar.mk
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -13,8 +13,8 @@ ERLANG_REBAR_SITE = $(call github,rebar,rebar,$(ERLANG_REBAR_VERSION))
 
 # Although the file LICENSE state Apache-2.0, a lot (if not all) the files
 # in src/ bear the MIT licence.
-ERLANG_LICENSE = Apache-2.0, MIT
-ERLANG_LICENSE_FILES = LICENSE
+ERLANG_REBAR_LICENSE = Apache-2.0, MIT
+ERLANG_REBAR_LICENSE_FILES = LICENSE
 
 # We do not have a target variant, so just define the dependencies,
 # configure and build commands for the host variant.
