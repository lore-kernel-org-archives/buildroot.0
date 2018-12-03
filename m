From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  3 Dec 2018 12:19:47 +0100
Subject: [Buildroot] [PATCH] docs/manual: Document
 ERLANG_FOOBAR_KEEP_DEPENDENCIES in rebar infra
In-Reply-To: <20181126110807.31431-2-johan.oudinet@gmail.com>
References: <20181126110807.31431-2-johan.oudinet@gmail.com>
Message-ID: <20181203111947.32627-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 docs/manual/adding-packages-rebar.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
index be9ede0113..b2028b1c5b 100644
--- a/docs/manual/adding-packages-rebar.txt
+++ b/docs/manual/adding-packages-rebar.txt
@@ -86,6 +86,13 @@ If the package bundles a _rebar_ utility, but can use the generic
 * +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
   variables to pass to the _rebar_ utility.
 
+* +ERLANG_FOOBAR_KEEP_DEPENDENCIES+, to keep the dependencies
+  described in the rebar.config file. By default, the _rebar_
+  infrastructure removes such dependencies as a post-patch hook to
+  ensure rebar does not download or compile them. Only set this
+  variable to a non-empty value if the _rebar_ infrastructure must not
+  modify the rebar.config file included in the package.
+
 With the rebar infrastructure, all the steps required to build
 and install the packages are already defined, and they generally work
 well for most rebar-based packages. However, when required, it is
-- 
2.17.1
