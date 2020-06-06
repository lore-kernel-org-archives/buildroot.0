From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:31:37 +0200
Subject: [Buildroot] [PATCH 2/4] package/openssh: improve integration
 for systemd
In-Reply-To: <20200605225905.14082-2-nolange79@gmail.com>
References: <20200605225905.14082-1-nolange79@gmail.com>
 <20200605225905.14082-2-nolange79@gmail.com>
Message-ID: <20200606223137.71ee0eca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 00:59:02 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> the openssh daemon is not suited for systemd's simple
> service type. dependend services should only start
> when sshd is ready to accept connections.
> 
> A patch is added from debian to allow openssh
> to communicate this state.
> 
> Restarts are prevented if the reason is a faulty
> config file (errocode 255).
> 
> The "user confinement directory" is changed to
> '/run/sshd' which is automatically managed by systemd.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/openssh/00-systemd-readiness.patch | 84 ++++++++++++++++++++++
>  package/openssh/openssh.mk                 | 14 +++-
>  package/openssh/sshd-sysusers.conf         |  2 +-
>  package/openssh/sshd.service               | 13 +++-
>  4 files changed, 109 insertions(+), 4 deletions(-)
>  create mode 100644 package/openssh/00-systemd-readiness.patch

On this patch, as well as patches 3/4 and 4/4 in this series, I would
really appreciate some review from people more knowledgeable than I am
in systemd.

Matt ? J?r?my ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
