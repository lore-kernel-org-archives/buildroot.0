From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 20 Jul 2011 11:38:08 +0200
Subject: [Buildroot] [PATCH 11/12] Add support for local packages
 through 'file://' pseudo-protocol
In-Reply-To: <c596c1abebee351179d9d58734ce0c46a774b5f0.1311141088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <c596c1abebee351179d9d58734ce0c46a774b5f0.1311141088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWJnmYjFa8NkzBmO6=03ayOasffKkRkBd6imdB8QVfPxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 20, 2011 at 7:52 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: David Wagner <david.wagner@free-electrons.com>
>
> This can be used this way :
>
> <pkg>_VERSION = 42
> <pkg>_SITE = file:///some/local/directory
> <pkg>_SOURCE = mypkg-$(<pkg>_VERSION).tar.bz2
>
> Can be useful to integrate a home-made project or for testing purposes.
> The default command to retrieve files is 'cp' but 'rsync' could also be used.
> Through sshfs, it should also be possible to get non-public remote files on a
> ssh server.
>
> [ Thomas Petazzoni: use $(PKG)_SITE and $(PKG)_SOURCE variables
> ?instead of $(1) and $(2) ]

If you add support for file:// in BR2_PRIMARY_SITE (see my other
patches), then you do need $(1) here instead of $(PKG)_SITE.

Thomas
