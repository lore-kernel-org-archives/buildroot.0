From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:02:45 +0200
Subject: [Buildroot] [PATCH v3 1/3] go-bootstrap: new host package
In-Reply-To: <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
 <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
Message-ID: <20160420230245.2e5629d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 04 Apr 2016 19:31:49 +0000, Geoff Levand wrote:
> Add a new package go-bootstrap which builds a bootstrap compiler for the
> go programming language.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/go-bootstrap/go-bootstrap.hash |  2 ++
>  package/go-bootstrap/go-bootstrap.mk   | 38 ++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/go-bootstrap/go-bootstrap.hash
>  create mode 100644 package/go-bootstrap/go-bootstrap.mk

I've applied to master after doing the following changes:

    [Thomas:
     - Rename GO_BOOTSTRAP_FINAL to HOST_GO_BOOTSTRAP_ROOT. Use the HOST_
       prefix because this variable is specific to the host variant. And
       it's not "final" at all, but rather the "root" of the Go Bootstrap
       installation.
     - Rename GO_BOOTSTRAP_MAKE_ENV to HOST_GO_BOOTSTRAP_MAKE_ENV, also to
       have the HOST_ prefix because it's a host package.]

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
