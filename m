From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Oct 2020 14:38:12 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/mtd: add host-acl dependency
 for host
In-Reply-To: <20201006153726.790986-1-antoine.tenart@bootlin.com>
References: <20201006153726.790986-1-antoine.tenart@bootlin.com>
Message-ID: <CANQCQpanWa0PNXr2M3ci_00wy7xCDjYLZjMjX7AsYCfc=dsXGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,

On Tue, Oct 6, 2020 at 10:39 AM Antoine Tenart
<antoine.tenart@bootlin.com> wrote:
>
> When compiling the host version of mtd, --with-jffs and --with-ubifs are
> always set, meaning --with-xattr is set by default. The xattr support
> only work if 'sys/acl.h' is available, otherwise the feature is silently
> dropped (a warning is shown during the configuration step).
>
> This patch adds a dependency on host-acl for host-mtd, so that the xattr
> feature is correctly supported. Logic to have xattr support is already
> there and working for the non-host flavour.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Good catch, I think we noticed this internally and never sent the patch.

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
