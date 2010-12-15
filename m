From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Dec 2010 22:38:34 +0100
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
 toolchain profiles and download
In-Reply-To: <201012150614.44014.vapier@gentoo.org>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<201012141548.38928.vapier@gentoo.org>
	<20101215113152.2cf64845@surf>
	<201012150614.44014.vapier@gentoo.org>
Message-ID: <20101215223834.1623496a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Dec 2010 06:14:43 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> it seems the profiles thing only supports downloading toolchain
> binaries ?  in the Blackfin setup, the toolchain is usually installed
> via the host package manager (we offer rpms/debs/etc...), so that
> still wouldnt work for us ... -mike

Below a very experimental/hackish way of integrating the Blackfin
toolchain into the existing logic. I've tested, I can successfully
build Busybox in both FLAT mode and FDPIC mode, with Buildroot that
downloads/installs the toolchain automatically.

The patch is not meant for inclusion yet, there are things I don't like
in it. It's just to show how I think it could work.

Thomas
