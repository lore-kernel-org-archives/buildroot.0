From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 23:03:11 +0200
Subject: [Buildroot] [PATCH v3 2/3] go: new host package
In-Reply-To: <dd44a19e178d1ca3e7aef95cd3700ed82d5c3bb1.1459798147.git.geoff@infradead.org>
References: <cover.1459798147.git.geoff@infradead.org>
 <dd44a19e178d1ca3e7aef95cd3700ed82d5c3bb1.1459798147.git.geoff@infradead.org>
Message-ID: <20160420230311.3b4ada48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 04 Apr 2016 19:31:49 +0000, Geoff Levand wrote:
> Add a new package 'go' which builds the host cross compiler and libraries for the
> go programming language.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/Config.in.host    |  1 +
>  package/go/Config.in.host | 13 ++++++++
>  package/go/go.hash        |  2 ++
>  package/go/go.mk          | 75 +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 91 insertions(+)
>  create mode 100644 package/go/Config.in.host
>  create mode 100644 package/go/go.hash
>  create mode 100644 package/go/go.mk

Applied to master after doing the following changes:

    [Thomas:
     - Put the computation of GO_GOARM inside the ifeq ($(BR2_arm),y)
       condition rather than duplicating this condition.
     - Remove the GO_GOARCH=unknown case, since there is no way to fall in
       this case as only supported architectures can use host-go.
     - Remove the GO_GOARM=unknown case, since we are sure that only
       ARMv5/6/7 will use host-go.
     - Rename HOST_GO_FINAL to HOST_GO_ROOT, since it's really the "root"
       of the Go installation.
     - Remove visible Config.in.host option.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
