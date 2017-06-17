From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 15:38:10 +0200
Subject: [Buildroot] [PATCH] dropwatch: bump to master and fix site
In-Reply-To: <1497684446-18637-1-git-send-email-post@lespocky.de>
References: <1497684446-18637-1-git-send-email-post@lespocky.de>
Message-ID: <20170617153810.06022ad8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Jun 2017 09:27:26 +0200, Alexander Dahl wrote:
> The tool was hosted at fedorahosted.org which was shut down in early
> 2017. According to a private conversation with the upstream maintainer,
> the new home for this tool is on infradead.org so far. So the SITE was
> adapted accordingly.
> 
> Additionally the version was bumped from 1.4 to current master. This
> allows to drop one build patch. The other patches were recreated with
> Git.
> 
> Cc: Neil Horman <nhorman@tuxdriver.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>

I've applied, after doing a few minor fixes (see below). Also, do you
think that Neil Horman would be willing to accept our two patches in
upstream dropwatch?

> +From c89cc908ba7f9f41aba4f61f58103d0fc64fa19f Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Fri, 16 Jun 2017 08:50:03 +0200
> +Subject: [PATCH 1/2] binutils 2.23.1

Patches inside packages should be generated with "git format-patch -N"
to avoid the 1/2, 2/2 numbering, which quickly becomes out of sync when
patches are added/removed. Also, I've improved the patch title, which
was not very informative.

I've also fixed the Config.in file, which contains the upstream URL of
the project. Indeed, the fedorahosted.org URL was no longer working.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
