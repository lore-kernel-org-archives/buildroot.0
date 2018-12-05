From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  5 Dec 2018 17:06:18 +0100
Subject: [Buildroot] [PATCH 3/3] docs/manual: Document
 ERLANG_FOOBAR_KEEP_DEPENDENCIES in rebar infra
In-Reply-To: <20181205160618.6884-1-johan.oudinet@gmail.com>
References: <20181205160618.6884-1-johan.oudinet@gmail.com>
Message-ID: <20181205160618.6884-3-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 docs/manual/adding-packages-rebar.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
index be9ede0113..d78b3171d8 100644
--- a/docs/manual/adding-packages-rebar.txt
+++ b/docs/manual/adding-packages-rebar.txt
@@ -86,6 +86,12 @@ If the package bundles a _rebar_ utility, but can use the generic
 * +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
   variables to pass to the _rebar_ utility.
 
+* +ERLANG_FOOBAR_KEEP_DEPENDENCIES+, to keep the dependencies
+  described in the rebar.config file. Valid values are +YES+ or +NO+
+  (the default). Unless this variable is set to +YES+, the _rebar_
+  infrastructure removes such dependencies in a post-patch hook to
+  ensure rebar does not download nor compile them.
+
 With the rebar infrastructure, all the steps required to build
 and install the packages are already defined, and they generally work
 well for most rebar-based packages. However, when required, it is
-- 
2.17.1
