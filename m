From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 27 May 2015 22:32:19 -0500
Subject: [Buildroot] [PATCH v4 2015.08 3/4] Makefile: implement a
 size-stats target
In-Reply-To: <1432591007-27689-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CALq67GDhQbvZba3SBfuL5FXxnOkpoLm4CMpai=0dPnJax=Jzzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 25, 2015 at 4:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit implements a size-stats target that calls the script of
> the same name to generate the graph and CSV files related to package
> and file sizes.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>

> ---
>  Makefile | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index cf244d7..c9b1e72 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -666,6 +666,14 @@ graph-depends: graph-depends-requirements
>         |tee $(GRAPHS_DIR)/$(@).dot \
>         |dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
>
> +size-stats:
> +       $(Q)mkdir -p $(GRAPHS_DIR)
> +       $(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
> +               --graph $(BASE_DIR)/graphs/graph-size.$(BR_GRAPH_OUT) \
> +               --file-size-csv $(BASE_DIR)/build/file-size-stats.csv \
> +               --package-size-csv $(BASE_DIR)/build/package-size-stats.csv \
> +               --skeleton-path $(TARGET_SKELETON)
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>
>  all: menuconfig
> @@ -883,6 +891,7 @@ endif
>         @echo '  manual-epub            - build manual in ePub'
>         @echo '  graph-build            - generate graphs of the build times'
>         @echo '  graph-depends          - generate graph of the dependency tree'
> +       @echo '  size-stats             - generate stats of the filesystem size'
>         @echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
>         @echo
>         @echo 'Miscellaneous:'
> --
> 2.1.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
