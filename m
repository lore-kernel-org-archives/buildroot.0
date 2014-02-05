From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Feb 2014 12:54:08 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <CAAXf6LVM939GcFkXA6UkifUEs9H6sQnKgDqW8uBHQD3_JK0-OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Feb 4, 2014 at 3:12 PM, J?r?my Rosen <jeremy.rosen@openwide.fr> wrote:
> When it is set, BR2_DEFCONFIG is saved like any config variable.
> However, at this point it is a completely expanded, absolute path
> It is not a good idea to save absolute paths in defconfig files
> moreover it makes little sense to save the defconfig location
> within the defconfig

The entire BR2_DEFCONFIG mechanism has never done what I expected.
What I want is that 'make savedefconfig' (or a similar command) saves
the configuration back to where it originated from. BR2_DEFCONFIG does
more or less that, but only if you set the configuration initially
with 'make defconfig BR2_DEFCONFIG=...' instead of the normal 'make
xxxx_defconfig'. Isn't this possible to achieve?

Best regards,
Thomas
