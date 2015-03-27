From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 18:10:50 +0100
Subject: [Buildroot] [PATCH 1/1] mjpg-streamer: Fix build with ccache
 enabled.
In-Reply-To: <1427475036-10363-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1427475036-10363-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20150327181050.45256b69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Fri, 27 Mar 2015 17:50:36 +0100, Nicolas Cavallari wrote:
> Quote the TARGET_CC variable, otherwise, if ccache is enabled:
> 
> [...] make CC=$TARGET_CC [...]
> is expanded to e.g.
> [...] make CC=ccache gcc [...]
> 
> The build succeeds with "make[2]: Nothing to be done for '[...]gcc'".
> and the program is compiled at "make install" time, with the default
> host compiler, resulting in a binary that does not run on the target.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/mjpg-streamer/mjpg-streamer.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
