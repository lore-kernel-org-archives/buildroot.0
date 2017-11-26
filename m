From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Nov 2017 14:41:18 +0100
Subject: [Buildroot] [PATCH 1/1] support/download: svn non-interactive
 in BR2_SVN
In-Reply-To: <1510944634-3374-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1510944634-3374-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171126144118.4f43d8c3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Nov 2017 12:50:34 -0600, Sam Voss wrote:
> Instead of overriding the _svn command and injecting --non-interactive,
> change the default value of BR2_SVN to include this flag so the end user
> can choose not to use the flag.
> 
> This change helps users behind corporate system rules which may not
> allow them to locally cache credentials and require interactive mode.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> 
> [Originally implemented by]
> CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Config.in            | 2 +-
>  support/download/svn | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I hesitated a bit between master and next to apply this patch. But
since this is basically fixing/adjusting a change that is in master, I
opted for merging that in master so that we don't change two times the
behavior in two consecutive releases.

So: applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
