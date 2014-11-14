From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Fri, 14 Nov 2014 14:34:57 +0100
Subject: [Buildroot] [PATCH 05/10] start-stop-daemon: new package
In-Reply-To: <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CABbD_XDZaMY5-zvMrc25PuwWQZKwfyft+7CjQrhp5cCUj7xjOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+START_STOP_DAEMON_CONF_OPTS = --disable-dselect
> --disable-update-alternatives \
> +       --exec-prefix=/
>

I would also add --disable-install-info, to prevent building
utils/dpkg-install-info - this will still build 7 unwanted binaries.
Maybe add a small patch to configure to force "make" to skip dpkg-deb,
dpkg-split and src directories?

+START_STOP_DAEMON_LICENSE = GPLv2+
> +START_STOP_DAEMON_LICENSE_FILES = debian/copyright


That is not entirely true. utils/start-stop-daemon.c clearly states that it
is public domain. I guess dpkg is GPLv2+, but we are not packaging dpkg
here. What is Buildroot's policy in this case?

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141114/21496be0/attachment.html>
