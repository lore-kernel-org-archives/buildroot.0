From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:25:20 +0200
Subject: [Buildroot] [PATCH 1/2] ltrace: remove bogus comment in
 Config.in file
In-Reply-To: <20180519205502.23746-1-thomas.petazzoni@bootlin.com>
References: <20180519205502.23746-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180520192520.15cf72bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 May 2018 22:55:01 +0200, Thomas Petazzoni wrote:
> In commit dfaa18af00dfcff71a0159adaafb0880e58fa6a1 ("ltrace: disable
> on mips/mipsel"), ltrace was disabled on mips/mipsel due to build
> issues, and a comment was added in the Config.in file to explain that
> even though ltrace has mips/mipsel support, it isn't enabled because
> it doesn't build.
> 
> Then, in commit d23cce19c299e3010ba2dca84ab4ad35eff3cdbb ("ltrace:
> enable for mips/mipsel"), the build of ltrace on mips/mipsel was
> re-enabled, because it has been fixed upstream.
> 
> However, the comment in the Config.in comment was not removed in this
> commit. Due to this, we have a comment that says "we don't allow
> enabling ltrace on mips/mipsel" and the line right below precisely
> allows to enable ltrace on mips/mipsel.
> 
> Fix this inconsistency by removing the no longer valid comment.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/ltrace/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

I've applied those two patches to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
