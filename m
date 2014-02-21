From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Feb 2014 23:17:53 +0100
Subject: [Buildroot] [PATCH 2/3] manual: switch BR2_EXTERNAL examples to use
	absolute paths
In-Reply-To: <cover.1393020340.git.yann.morin.1998@free.fr>
References: <cover.1393020340.git.yann.morin.1998@free.fr>
Message-ID: <c885b064a16923e79d388249bd4ea7161a4bac22.1393020340.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Although it is possible to use relative paths, there are a few pitfalls
whith doing so.

To avoid confusion for a (newcoming) user, use absolute paths in the
manual (as is done in examples for $(O)), since it is guaranteed to be
working without corner cases.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Note: we only change our examples in the manual; using relative paths is
still possible. There is no additional blurb in the manual that would
favour using relative or absolute paths.
---
 docs/manual/customize-outside-br.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 585eedf..134ed64 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -30,18 +30,18 @@ there is no need to pass +BR2_EXTERNAL+ at every +make+ invocation. It
 can however be changed at any time by passing a new value, and can be
 removed by passing an empty value.
 
-The +BR2_EXTERNAL+ path can be either an absolute or a relative path,
+*Note:* the +BR2_EXTERNAL+ path can be either an absolute or a relative path,
 but if it's passed as a relative path, it is important to note that it
-is interpreted relatively to the main Buildroot source directory, not
+is interpreted relatively to the main Buildroot source directory, *not*
 the Buildroot output directory.
 
 Some examples:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=../foobar menuconfig
+ buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
 -----
 
-Starting from now on, external definitions from the +../foobar+
+Starting from now on, external definitions from the +/path/to/foobar+
 directory will be used:
 
 -----
@@ -52,7 +52,7 @@ directory will be used:
 We can switch to another external definitions directory at any time:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=../barfoo xconfig
+ buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
 -----
 
 Or disable the usage of external definitions:
-- 
1.8.1.2
