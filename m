From: Christian Stewart <christian@paral.in>
Date: Tue, 7 Jun 2016 13:24:30 -0700
Subject: [Buildroot] [PATCH v6 2/3] docker-containerd: new package
In-Reply-To: <c77de68d3e294523a2079b68deffed57@WEBMAIL.arcx.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-3-git-send-email-christian@paral.in>
 <c77de68d3e294523a2079b68deffed57@WEBMAIL.arcx.com>
Message-ID: <CA+h8R2p6wRRWrxZRiiRhzoa9BsmAi3HpHskKBaUsnZfJPLyX4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jun 7, 2016 at 1:15 PM, Andrew Webster <Awebster@arcx.com> wrote:
>
> > +define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
> > +     ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
> > +     $(INSTALL) -D -m 0755 $(@D)/bin/containerd
> $(TARGET_DIR)/usr/bin/docker-containerd
> > +     $(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim
> $(TARGET_DIR)/usr/bin/containerd-shim
> > +endef
>
> Should this target be $(TARGET_DIR)/usr/bin/docker-containerd-shim instead?
>

Yes, and this is fixed for the next revision, see:

https://github.com/paralin/buildroot/commit/39ca2e6f7ce4e23c2a9ff0016ff3680299b4f91b

~ Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160607/6d5541c7/attachment.html>
