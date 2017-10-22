From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 11:59:01 +0200
Subject: [Buildroot] [PATCH 2/4] grub2: introduce BR2_TARGET_GRUB2_CFG
In-Reply-To: <20171022093842.21788-3-nunes.erico@gmail.com>
References: <20171022093842.21788-1-nunes.erico@gmail.com>
 <20171022093842.21788-3-nunes.erico@gmail.com>
Message-ID: <20171022115901.44ab9855@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 11:38:40 +0200, Erico Nunes wrote:
> This config can be used to provide a custom Grub 2 configuration file
> containing menu entries. Previously, this had to be always done by an
> external script which would overwrite the default file.
> This is backwards compatible for existing configs as the default value
> is the previously hardcoded value.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I think we had similar proposals in the past (but perhaps it was for
grub legacy, not grub2), and I believe our answer was that this config
file can be trivially replaced in a post-build hook or rootfs overlay,
because it is not used during the grub2 build process.

Hence a separate option is not really needed because you can already do
that easily with a post-build or a rootfs overlay.

So, I'm not saying no entirely, but I'm not sure there is really a huge
benefit in having a separate option for this.

Peter? Arnout?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
