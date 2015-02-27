From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Feb 2015 15:28:25 +0100
Subject: [Buildroot] [PATCH 5/7] freetype: host-freetype-patch requires
 host-automake
In-Reply-To: <1425028764-1146-6-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-6-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150227152825.00c67240@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 27 Feb 2015 10:19:22 +0100, Fabio Porcedda wrote:
> The "make host-freetype-patch" fails because using the autogen.sh script
> it doesn't found the autoconf tool, the problem was already fixed for
> "make freetype-patch" adding the "host-automake" as a prerequisite to
> freetype-patch, so fix it by adding "host-automake" as a prerequisite to
> "host-freetype-patch" too.
> 
> Fix build failure:
> running `autoconf --force'
> ./autogen.sh: line 15: autoconf: command not found
> error while running `autoconf --force'
> package/pkg-generic.mk:146: recipe for target 'buildroot/output/build/host-freetype-2.5.5/.stamp_patched' failed
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Maybe this has been discussed before, but why are we doing the autogen
in a post patch hook rather than in a pre-configure hook ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
