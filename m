From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:58:20 +0200
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.10
In-Reply-To: <53D7EDCD.8040402@zacarias.com.ar>
References: <1406657724-21261-1-git-send-email-gustavo@zacarias.com.ar>
 <20140729202202.6ca3c3f3@free-electrons.com>
 <53D7EDCD.8040402@zacarias.com.ar>
Message-ID: <20140730235820.3f3275d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 29 Jul 2014 15:54:05 -0300, Gustavo Zacarias wrote:

> They've been merged to master which will be the 4.2 series, but not
> backported to the 4.1 series, except for...
> samba4-0001-build-don-t-execute-tests-summary.c.patch
> samba4-0002-Minor-typo-fix-in-source3-wscript.patch
> ...which were included in the 4.1.8 release because they were considered
> simple enough to do so.

Ok, thanks for the explanation. Great to see that many of these patches
have been merged upstream, and will be removed from Buildroot once 4.2
lands.

> >> +comment "Some samba4 CLI tools require the python package to keep .py files"
> >> +	depends on BR2_PACKAGE_SAMBA4 && BR2_PACKAGE_PYTHON_PYC_ONLY
> > 
> > That seems weird, could you elaborate a bit on that?
> 
> The python package purges all *.py files, even the ones it doesn't own,
> and samba4 installs only .py and .so files (for python-related
> functionality) hence having this problem - this also happens when
> building samba natively, it's not an artifact of cross-compilation.
> This mostly affects the advanced tools like pidl, samba_dnsupdate,
> samba_kcc, samba_spnupdate, samba_upgradedns and samba-tool which are
> useful for domain masters and simple provisioning/upgrades.
> For many scenarios this isn't an issue since they're mostly interactive
> tools, but it's worth mentioning i think.
> It might also be problematic for people relying on samba's python
> bindings for their own tools.

But those tools are installed in /usr/lib ? The target-finalize logic
to remove .py files only applies to /usr/lib, not to the entire root
filesystem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
