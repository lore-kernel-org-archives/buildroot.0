From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 2 Jun 2020 23:30:54 +0200
Subject: [Buildroot] [PATCH] configs/rock64_defconfig: remove defconfig
In-Reply-To: <20200602231457.50033f15@windsurf.home>
References: <20200531143452.575717-1-romain.naour@gmail.com>
 <05f4af44-8cf5-989e-df94-df39b6d6bd8e@gmail.com>
 <20200602231457.50033f15@windsurf.home>
Message-ID: <b3f125f4-a529-5cb7-35d6-c2080ec27cbb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/06/2020 ? 23:14, Thomas Petazzoni a ?crit?:
> On Mon, 1 Jun 2020 15:55:42 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Actually this issue is not related to the uboot fork but the official 2017.09
>> (and maybe previous releases)
> 
> So it feels like the solution is not really to remove that defconfig,
> correct? Because any other defconfig using 2017.09 and libpyfdt (and
> possibly some other nearby U-Boot versions) would also be affected,
> correct ?

Indeed, every defconfig using uboot 2017.09 with TPL support enabled will fail
to build due to this issue.

I spent some time to take a look at the issue but I don't have a solution.
It seems we really need commit c0e032e0090d6541549b19cc47e06ccd1f302893 to build
correctly.

Best regards,
Romain

> 
> Thomas
> 
