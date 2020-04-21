From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 16:35:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/selinux: fix circular dependency
In-Reply-To: <20200421094849.2476332-1-fontaine.fabrice@gmail.com>
References: <20200421094849.2476332-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421163546.321335bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 21 Apr 2020 11:48:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix circular dependency added by commit
> 791292c48d5165515ca08f35d8cbc1ef78d3ed95

Could you give more details about the circular dependency? How is
changing a "select" by a "depends on" going to fix it? Especially since
the select was in fact already there, just conditional on
!BR2_PACKAGE_PYTHON.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
