From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 12:14:53 +0200
Subject: [Buildroot] [PATCH 2/4] manual: provide make targets to build
	the documentation
In-Reply-To: <4c4e92ec3e04435af43b079aeaea1dcf2181d58e.1318236261.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 10 Oct 2011 10:46:40 +0200")
References: <cover.1318236261.git.thomas.petazzoni@free-electrons.com>
 <cover.1318236261.git.thomas.petazzoni@free-electrons.com>
 <4c4e92ec3e04435af43b079aeaea1dcf2181d58e.1318236261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87lis9wf6q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Special thanks for Yann E. Morin for giving input and suggestions to
 Thomas> implement this.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Thomas> ---
 Thomas>  Makefile |   45 ++++++++++++++++++++++++++++++++++++++++++++-
 Thomas>  1 files changed, 44 insertions(+), 1 deletions(-)

 Thomas> diff --git a/Makefile b/Makefile
 Thomas> index 8525b7d..d0f947d 100644
 Thomas> --- a/Makefile
 Thomas> +++ b/Makefile
 Thomas> @@ -672,10 +672,19 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
 Thomas>  	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
 Thomas>  endif
 Thomas>  	@echo
 Thomas> +	@echo 'Documentation:'
 Thomas> +	@echo '  manual                 - build manual in HTML, split HTML, PDF and txt'
 Thomas> +	@echo '  manual-html            - build manual in HTML'
 Thomas> +	@echo '  manual-split-html      - build manual in split HTML'
 Thomas> +	@echo '  manual-pdf             - build manual in PDF'
 Thomas> +	@echo '  manual-txt             - build manual in txt'
 Thomas> +	@echo '  manual-epub            - build manual in ePub'
 Thomas> +	@echo
 Thomas>  	@echo 'Miscellaneous:'
 Thomas>  	@echo '  source                 - download all sources needed for offline-build'
 Thomas>  	@echo '  source-check           - check all packages for valid download URLs'
 Thomas>  	@echo '  external-deps          - list external packages used'
 Thomas> +	@echo '  manual	                - build the Buildroot manual'

I don't see the point of this 2nd manual line very close to the others,
so I removed it. Other than that (and Arnout's comments) it looks good,
committed - Thanks.

-- 
Bye, Peter Korsgaard
