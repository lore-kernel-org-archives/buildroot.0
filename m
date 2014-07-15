From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 15 Jul 2014 10:49:13 -0400
Subject: [Buildroot] [PATCH 1/1] Add a filesystem option so a device can
 be booted over NFS.
In-Reply-To: <CANxTyt6fmkYhRkES85MXWGEPwFc99r_Dioup8_Wds9hbh+WJNQ@mail.gmail.com>
References: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
 <CANxTyt6fmkYhRkES85MXWGEPwFc99r_Dioup8_Wds9hbh+WJNQ@mail.gmail.com>
Message-ID: <CANxTyt5qfPk8eTEoAV2LXsveM5QDQPZGxm-zhZMAfSez0y6Xkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 15, 2014 at 10:45 AM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> Instead, consider simply making a post-build script that does the
> un-tar for you. Maybe something like this:
>
>     #!/bin/sh
>
>     NFSROOT=${NFS_SHARE:-/srv/my_nfsroot}
>
>     mkdir -p $NFS_SHARE
>     sudo tar -xavf ${BASE_DIR}/images.rootfs.tar -C $NFSROOT

Apologies - those two "NFS_SHARE" should have been "NFSROOT" - last
minute name change ...
Danomi -
