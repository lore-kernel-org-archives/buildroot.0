From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 08:33:55 +0100
Subject: [Buildroot] [PATCH] toolchain-external: make extraction
 idempotent
In-Reply-To: <1446592175-8003-1-git-send-email-arnout@mind.be>
References: <1446592175-8003-1-git-send-email-arnout@mind.be>
Message-ID: <20151104083355.4b69aedb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Wed, 4 Nov 2015 00:09:35 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Commit 23ffa7ec first extracts to the toolchain-external build
> directory and then moves everything to $(HOST_DIR)/opt/ext-toolchain.
> However, this is not idempotent, because moving directories over
> existing ones doesn't always work, particularly if the target is on
> another device.
> 
> Simply remove the destination contents before moving.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
