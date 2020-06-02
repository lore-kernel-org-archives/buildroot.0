From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:20:51 +0200
Subject: [Buildroot] [PATCH V5] package/c-periphery: bump version to
 2.2.1
In-Reply-To: <20200601074841.6325-1-offougajoris@gmail.com>
References: <20200601074841.6325-1-offougajoris@gmail.com>
Message-ID: <20200602232051.6cec350c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Jun 2020 09:48:40 +0200
Joris Offouga <offougajoris@gmail.com> wrote:

> Since commit "cmake: add cmake build support"
> (https://github.com/vsergeev/c-periphery/commit/952e1e906a5d65b78932128af24b7dbb8cce2e9dvsergeev/c-periphery at d0a973c),
> c-periphery implement cmake build, so use cmake-package instead of generic-package

You should have also explained that it now builds a shared library and
therefore INSTALL_TARGET = NO is no longer appropriate. I fixed that.

> +C_PERIPHERY_INSTALL_TARGET = YES

This raises a check-package warning, because this is the default value.
So I simply dropped this line when applying.

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
