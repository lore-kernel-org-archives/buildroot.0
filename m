From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Nov 2019 09:27:57 +0100
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <CAFvCimXHMv94tg4S-U5QLu4k26HZAtZXsVR3jjK2C4s+XOuX2g@mail.gmail.com>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <20191127214614.33d87ae0@windsurf>
 <CAFvCimXHMv94tg4S-U5QLu4k26HZAtZXsVR3jjK2C4s+XOuX2g@mail.gmail.com>
Message-ID: <20191128092757.19886364@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Nov 2019 09:08:19 +0100
J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:

> Ok, as usuall some background knowledge
> 
> systemd provides three binaries to deal with sending journal data over the
> network
> 
> * systemd-journald-gateway : a tiny HTTP server that provides the logs
> * systemd-journald-upload : a process to run periodically to push the logs
> to a remote HTTP server
> * systemd-journald-remote : aprocess to run on the remorse computer (not on
> the target) to receive data and/or to fetch data from the target
> 
> All three options are selected together with -Dremote=true (which is the
> default). It would be nice to be able to select them individually, but
> upstream does not provide that option.
> 
> gatewayd is a bit more tricky because it will detect if libmicrohttpd is
> available and only builds if it is.
> 
> So, as a fix I would make BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY depend
> on BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
> Also, fix default values to match previous behaviour

But if all of gateway, upload and remote are always built together when
-Dremote=true, what is the point of having fine-grained options for
each of gateway, upload and remote ? Just to install/enable (or not)
the correspond service file ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
