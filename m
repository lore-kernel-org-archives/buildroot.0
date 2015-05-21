From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 09:51:43 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: add host/target Linux version
	check
References: <1418249519-15794-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1418249519-15794-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <XnsA4A16452115E4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in
news:1418249519-15794-3-git-send-email-thomas.petazzoni at free-electrons.com:

> +ifneq
> ($(HOST_QEMU_COMPARE_VERSION_MAJOR)$(HOST_QEMU_COMPARE_VERSION_MINOR),OKO
> K) +$(error "Refusing to build qemu-user: target Linux version newer
> than host's.") +endif

Hi,

while testing an allyesconfig with "make source-check" this error was
raised. I had to comment this line in order to run the source-check. Is it
possible to run this check only during a build phase? 

Regards, Bernd
