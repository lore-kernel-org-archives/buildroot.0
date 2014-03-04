From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 04 Mar 2014 09:07:35 +0800
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <53151AFC.3010402@zacarias.com.ar>
References: <1389862338.918265.958087681541.2.gpush@pablo>
 <53151AFC.3010402@zacarias.com.ar>
Message-ID: <53152757.2020707@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

> Normally we don't make initscript installation an option

I think dropbear is a bit exceptional here, as both server and client
are in the one package.

> and since the
> dropbear package options are essentially a no-op what's the point?

There are some scenarios where there's no point starting a SSH server
(in my case, it's because there's no persistent storage, so no
persistent host keys). However, I'd still like a ssh/scp client to be
available.

> (if you don't want sshd to startup on boot you can use a post build
> script to just remove the initscript from the target, that's the
> recommended way).

But isn't something that will go upstream and be available in a
defconfig, right?

Regards,


Jeremy
