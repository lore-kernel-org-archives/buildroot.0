From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 10:42:06 -0300
Subject: [Buildroot] [PATCH 05/10] start-stop-daemon: new package
In-Reply-To: <CABbD_XDZaMY5-zvMrc25PuwWQZKwfyft+7CjQrhp5cCUj7xjOA@mail.gmail.com>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>	<1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
 <CABbD_XDZaMY5-zvMrc25PuwWQZKwfyft+7CjQrhp5cCUj7xjOA@mail.gmail.com>
Message-ID: <546606AE.8010902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/2014 10:34 AM, K?roly Kasza wrote:

> Hello,
> 
>     +START_STOP_DAEMON_CONF_OPTS = --disable-dselect
>     --disable-update-alternatives \
>     +       --exec-prefix=/
> 
> 
> I would also add --disable-install-info, to prevent building
> utils/dpkg-install-info - this will still build 7 unwanted binaries.
> Maybe add a small patch to configure to force "make" to skip dpkg-deb,
> dpkg-split and src directories?

I can add that, yes.
I'm building inside lib/compat/ and utils/ later for the bare minimum,
which 7 binaries are you talking about?

>     +START_STOP_DAEMON_LICENSE = GPLv2+
>     +START_STOP_DAEMON_LICENSE_FILES = debian/copyright
> 
> 
> That is not entirely true. utils/start-stop-daemon.c clearly states that
> it is public domain. I guess dpkg is GPLv2+, but we are not packaging
> dpkg here. What is Buildroot's policy in this case?

True i'll adjust it.
Policy is cover all licenses for things that we are shipping, since it's
just start-stop-daemon, PD it is.
Thanks.
Regards.
