From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 May 2019 00:00:35 +0200
Subject: [Buildroot] [PATCH V2 8/9] support/config.sub: Add C-SKY support
In-Reply-To: <20190527223022.1d1aaa5a@windsurf> (Thomas Petazzoni's message of
 "Mon, 27 May 2019 22:30:22 +0200")
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-8-git-send-email-guoren@kernel.org>
 <20190527223022.1d1aaa5a@windsurf>
Message-ID: <87muj77e2k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Guo,
 > On Wed,  8 May 2019 16:58:34 +0800
 > guoren at kernel.org wrote:

 >> From: Guo Ren <ren_guo@c-sky.com>
 >> 
 >> Enable gnuconfig for C-SKY Architecutre compiling.
 >> 
 >> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
 >> ---
 >> support/gnuconfig/config.sub | 2 ++
 >> 1 file changed, 2 insertions(+)

 > I've slightly improved the commit message, and applied to master. I've
 > applied to master and not to next, because this commit is really
 > important: without it, none of the autotools based packages can build
 > on C-SKY (which is not yet tested in the autobuilders).

I agree that this minimal change is probably the most sensible thing to
do for master, but for next it IMHO makes more sense to update our
config.sub / config.guess copies, as upstream has gained csky support
since:

commit 63b4ce2e8c28aee6a32133e400436e4ca885215a
Author: Mao Han <han_mao@c-sky.com>
Date:   Mon Apr 16 14:46:36 2018 +1000

           * config.sub (csky, csky-*): Recognise.
           * testsuite/config-sub.data: Add a test case.

   Signed-off-by: Ben Elliston <bje@gnu.org>

-- 
Bye, Peter Korsgaard
