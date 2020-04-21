From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 17:07:00 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/selinux-python: fix dependency
In-Reply-To: <20200421145315.3562089-1-fontaine.fabrice@gmail.com>
References: <20200421145315.3562089-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421170700.2252d0d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 16:53:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 791292c48d5165515ca08f35d8cbc1ef78d3ed95 forgot to add
> !BR2_PACKAGE_PYTHON dependency, without it the following error will be
> raised if the user selects BR2_PACKAGE_PYTHON and python-selinux:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON3
>   Depends on [n]: !BR2_PACKAGE_PYTHON [=y] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_SELINUX_PYTHON [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]

Aah, yes. Indeed. Now it makes complete sense. And thank you for fixing
this, I indeed completely overlooked that when changing the "select
BR2_PACKAGE_PYTHON3".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
