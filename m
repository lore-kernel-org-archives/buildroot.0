From: Christian Stewart <christian@paral.in>
Date: Fri, 27 May 2016 00:02:55 -0700
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: new package
In-Reply-To: <20160527072720.4f3f9b21@free-electrons.com>
References: <1464324777-5364-1-git-send-email-christian@paral.in>
 <1464324777-5364-3-git-send-email-christian@paral.in>
 <20160527072720.4f3f9b21@free-electrons.com>
Message-ID: <CA+h8R2pT_U2JUKbW-y+y5mHrCGM08=Qq7mA2SgU9Kpk-zTLJcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Thu, May 26, 2016 at 10:27 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>
> Needs your Signed-off-by here.
>

Okay, will add.

> +     depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>


> BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS dependency.
>

Not sure what you're saying here

Did you do a runtime test? Because this clearly cannot work: it means
> that on the target you will have a link like:
>
>         /usr/bin/docker-runc ->
> /home/christian/buildroot/output/target/usr/bin/runc
>
> which obviously will not work. You instead want:
>
>         ln -s runc $(TARGET_DIR)/usr/bin/docker-runc
>

I asked about this in another email, it makes sense that that wouldn't
work, I'll fix it for the next revision.

In terms of all the versioning stuff. I'll try using the _VERSION variables
for this. As the variable specifically references a GitCommit, I included
the commits as it wants. But it's probably not too bad of a compromise to
use the version ID as the commit hash.

For the host variable, a patch series recently applied changed what that
variable contained, and in particular, the changes to CGO caused the build
to completely fail unless I included the variables from there, so I now
include it and simply add a few things on top of it to build the full build
env for the package.

Will revise on all of the series and respin late tomorrow, in case anyone
else has suggestions :)

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160527/db44fd91/attachment.html>
