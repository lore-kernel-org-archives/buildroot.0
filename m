From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:59:00 +0100
Subject: [Buildroot] [git commit] docs/manual: document new behaviour of
 'make printvars'
Message-ID: <20190312205609.24C4C8E220@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71d0cddeacc1c626780c9e47345a322b39eaf0c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a 'VARS=...' setting to the example. To make it clear that several
variables can be specified, use two variables in the first example.
Only 2 variables are printed, so the ... is removed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/make-tips.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index ea1d825bef..869b6807dd 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -80,18 +80,18 @@ to xref:ccache[].
 
 .Dumping the internal make variables:
 
-One can dump all the variables known to make, along with their values:
+One can dump the variables known to make, along with their values:
 
 ----
- $ make -s printvars
- VARIABLE=value_of_variable
- ...
+ $ make -s printvars VARS='VARIABLE1 VARIABLE2'
+ VARIABLE1=value_of_variable
+ VARIABLE2=value_of_variable
 ----
 
 It is possible to tweak the output using some variables:
 
 - +VARS+ will limit the listing to variables which names match the
-  specified make-pattern
+  specified make-patterns - this must be set else nothing is printed
 - +QUOTED_VARS+, if set to +YES+, will single-quote the value
 - +RAW_VARS+, if set to +YES+, will print the unexpanded value
 
