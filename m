From: Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com>
Date: Wed, 16 Sep 2020 07:56:46 +0000
Subject: [Buildroot] Adding BR2_PACKAGE_PYTHON3 make U-Boot build fail
In-Reply-To: <20200915154450.55b1c6d1@windsurf.hq.k.grp>
References: <d30bce23621c48874241cbd24e7c85a741067991.camel@brainlab.com>
 <20200915152720.355ef868@windsurf.hq.k.grp>
 <d767bea6910b5a518802f2b7bb99efe7349e20f0.camel@brainlab.com>
 <20200915154450.55b1c6d1@windsurf.hq.k.grp>
Message-ID: <0e656f84d103ddcf24516f1f2a4de02122af9c19.camel@brainlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I solved the problem for me with adding a patch that changes the
script's shebang to `python2`.

Thanks again!
Jonatan

On Tue, 2020-09-15 at 15:44 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Please keep the list in Cc. Thanks.
> 
> On Tue, 15 Sep 2020 13:42:43 +0000
> Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com> wrote:
> 
> > > When BR2_PACKAGE_PYTHON3=y, we create $(HOST_DIR)/bin/python as a
> > > symlink to $(HOST_DIR)/bin/python3. This means that any script
> > > that
> > > uses just "python" will be executed by the Python 3 interpreter
> > > built
> > > by Buildroot. So if you have a Python 2.x script in the U-Boot
> > > build,
> > > it won't work anymore.
> > > 
> > > While I can explain the situation, I don't immediately have a
> > > good/simple solution to suggest. We have recently introduced
> > > BR2_TARGET_UBOOT_NEEDS_PYTHON2 and
> > > BR2_TARGET_UBOOT_NEEDS_PYTHON3.
> > > Perhaps these should ensure that the U-Boot build takes place
> > > with
> > > the
> > > PATH that points to a folder where a "python" symlink is created,
> > > pointing to the correct Python interpreter ?
> > > 
> > > Thomas  
> > 
> > Thanks for the explanation. I get the issue with having
> > BR2_TARGET_UBOOT_NEEDS_PYTHON2=y set, unfortunately.
> 
> Yes, as I explained: "Perhaps these should ensure that the U-Boot
> build
> takes place with the PATH that points to a folder where a "python"
> symlink is created, pointing to the correct Python interpreter ?"
> 
> Which implies this is not done at the moment, and therefore indeed
> BR2_TARGET_UBOOT_NEEDS_PYTHON2=y will not solve your problem.
> 
> Thomas
