From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 4 Jul 2021 18:27:28 +0300
Subject: [Buildroot] [PATCH 4/4] stm32mp157c_dk2: fix U-Boot corruption
 on the first boot
In-Reply-To: <20210703233130.57f276a7@windsurf>
References: <20210701210006.1171347-1-geomatsi@gmail.com>
 <20210701210006.1171347-5-geomatsi@gmail.com>
 <20210703233130.57f276a7@windsurf>
Message-ID: <YOHTYLvkhpjBDreo@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> > Both trusted and basic images successfully boot only once. Subsequent
> > boot attempts fail to reach U-Boot. The root cause turns out to be in
> > U-Boot corruption during the first boot. The stm32mp1 U-Boot stores its
> > environment at the end of GPT partition named 'ssbl' since v2020.10-rc2.
> > However Buildroot genimage template for stm32mp157 boards creates 'ssbl'
> > partition w/o extra space for U-Boot primary and redundant environments.
> > Add post-build script that appends placeholder for environment to U-Boot
> > image.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> What about making the ssbl partition larger in the genimage
> configuration file ?

Appending env placeholders looked a bit more ergonomic and future proof
to me. But just making 'ssbl' larger also works fine. 

Regards,
Sergey
