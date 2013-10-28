From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Oct 2013 06:17:08 +0100
Subject: [Buildroot] [PATCH 1/4] post-{build,
 images} hooks: export BUILD_DIR too
In-Reply-To: <a4300dc9-2aa9-4d40-9b79-26ec5b317c52@email.android.com>
References: <cover.1382894622.git.yann.morin.1998@free.fr>
 <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
 <a4300dc9-2aa9-4d40-9b79-26ec5b317c52@email.android.com>
Message-ID: <20131028061708.5e69ab8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 27 Oct 2013 22:12:34 +0100, Thomas De Schampheleire wrote:

> >+# This extra environment we can not export ourselves, so we have
> >+# to expicitly pass it to user-supplied external hooks (eg.
> >+# post-build, post-images)
> >+USER_HOOKS_EXTRA_ENV=\
> >+	BUILD_DIR=$(BUILD_DIR)
> 
> I'd add a bit more info here: we cannot export BUILD_DIR globally  because some packages, like uboot, also use this same variable for another purpose.

(Unfortunately, we've asked you to not wrapped patches you reply to,
but now, it has the consequence that you no longer wrap what you write.
Well, I guess with K9 it's hard to get both).

Regarding BUILD_DIR and other variables being exported, is it really
safe to export other variables with a relatively generic name such as
TARGET_DIR, BASE_DIR, HOST_DIR, BINARIES_DIR, etc. ? Should we instead
expose them to post-build/post-image scripts as BR2_<something> ? But
well, of course, it means breaking the existing API, which isn't nice.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
