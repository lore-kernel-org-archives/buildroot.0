From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:18:47 +0200
Subject: [Buildroot] [PATCH 3/4] Makefile: help: add package-specific
 targets
In-Reply-To: <1426967388-559-4-git-send-email-arnout@mind.be>
References: <1426967388-559-1-git-send-email-arnout@mind.be>
 <1426967388-559-4-git-send-email-arnout@mind.be>
Message-ID: <20150404151847.58201f4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat, 21 Mar 2015 20:49:47 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +	@echo
> +	@echo 'Package-specific:'
> +	@echo '  <pkg>                  - Build and install <pkg> and all its dependencies'
> +	@echo '  <pkg>-source           - Only download the source files for <pkg>'
> +	@echo '  <pkg>-extract          - Extract <pkg> sources'
> +	@echo '  <pkg>-patch            - Apply patches to <pkg>'
> +	@echo '  <pkg>-depends          - Build <pkg>'\''s dependencies'
> +	@echo '  <pkg>-configure        - Build <pkg> up to the configure step'
> +	@echo '  <pkg>-build            - Build <pkg> up to the build step'
> +	@echo '  <pkg>-graph-depends    - Display <pkg>'\''s dependencies'
> +	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'

Why <pkg>-graph-depends two times? I've kept only the second occurrence.

> +	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
> +	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
> +	@echo '  <pkg>-rebuild          - Restart the build from the build step'

Do you think it would make sense to add <pkg>-reinstall here?

Applied with the <pkg>-graph-depends thing fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
