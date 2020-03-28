From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 14:59:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: fix CVE-2020-9274
In-Reply-To: <20200328090042.950156-1-fontaine.fabrice@gmail.com>
References: <20200328090042.950156-1-fontaine.fabrice@gmail.com>
Message-ID: <20200328145905.1dddc44c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 10:00:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> An issue was discovered in Pure-FTPd 1.0.49. An uninitialized pointer
> vulnerability has been detected in the diraliases linked list. When the
> *lookup_alias(const char alias) or print_aliases(void) function is
> called, they fail to correctly detect the end of the linked list and try
> to access a non-existent list member. This is related to init_aliases in
> diraliases.c.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ays-set-the-tail-of-the-list-to-NULL.patch | 35 +++++++++++++++++++
>  package/pure-ftpd/pure-ftpd.mk                |  3 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
