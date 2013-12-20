From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Dec 2013 16:48:24 +0100
Subject: [Buildroot] [PATCH v10 8/8] Makefile: update comment about
 top-level parallel Makefile
In-Reply-To: <CAHkwnC8fQE+XVB_1EixH2ZXX=bxO=+DZ68yH4e6oLTm1NTedEA@mail.gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-9-git-send-email-fabio.porcedda@gmail.com>
 <52B32EBD.3000202@mind.be>
 <CAHkwnC8fQE+XVB_1EixH2ZXX=bxO=+DZ68yH4e6oLTm1NTedEA@mail.gmail.com>
Message-ID: <52B466C8.2000200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/13 14:56, Fabio Porcedda wrote:
> On Thu, Dec 19, 2013 at 6:37 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>> >On 18/12/13 11:36, Fabio Porcedda wrote:
>>> >>
>>> >>After the latest patches top-level parallel Makefile is working but
>>> >>there is still an issue when a package has an unspecified optional
>>> >>dependency so change the comment to explain that.
>>> >>
>>> >>Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>
>>> >>---
>>> >>   Makefile | 15 ++++++++++++++-
>>> >>   1 file changed, 14 insertions(+), 1 deletion(-)
>>> >>
>>> >>diff --git a/Makefile b/Makefile
>>> >>index ef2582e..27a6a65 100644
>>> >>--- a/Makefile
>>> >>+++ b/Makefile
>>> >>@@ -42,7 +42,20 @@ export HOSTARCH := $(shell uname -m | \
>>> >>             -e s/macppc/powerpc/\
>>> >>             -e s/sh.*/sh/)
>>> >>
>>> >>-# This top-level Makefile can*not*  be executed in parallel
>>> >>+# Parallel execution of this Makefile is disabled because it could
>>> >>+# change the build result if a package has an unspecified optional
>>> >>+# dependency.
>> >
>> >
>> >  ... or if two packages manipulate the same file in the target directory.
> Ok, added.
>
>> >
>>> >>+# Parallel execution changes the packages building order, that can be
>>> >>+# a problem when a package has an unspecified optional dependency,
>>> >>+# because if that dependency is present when the package is built, it
>>> >>+# is used, otherwise it isn't (but compilation happily proceeds). This
>> >
>> >
>> >  This is a repeat of the first sentence.
> So i just remove it?
>

  Probably better to remove the first sentence, the second one is more 
descriptive.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
