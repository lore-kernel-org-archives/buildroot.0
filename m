From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 16:14:34 +0200
Subject: [Buildroot] [PATCH/next] package/bootstrap: bump version to
 3.3.7
In-Reply-To: <20170521181024.27233-1-bernd.kuhls@t-online.de>
References: <20170521181024.27233-1-bernd.kuhls@t-online.de>
Message-ID: <20170522161434.4df9d628@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 20:10:24 +0200, Bernd Kuhls wrote:
> Changed _INSTALL_TARGET_CMDS to reflect updated internal zip structure:
> 
> $ unzip -l ../dl/bootstrap-3.3.1-dist.zip
> Archive:  ../dl/bootstrap-3.3.1-dist.zip
>   Length      Date    Time    Name
> ---------  ---------- -----   ----
>         0  2014-11-12 18:03   dist/
>         0  2014-11-12 18:03   dist/css/
> [...]
> 
> $ unzip -l ../dl/bootstrap-3.3.7-dist.zip
> Archive:  ../dl/bootstrap-3.3.7-dist.zip
>   Length      Date    Time    Name
> ---------  ---------- -----   ----
>         0  2016-07-25 15:53   bootstrap-3.3.7-dist/css/
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Changing INSTALL_TARGET_CMDS is not the right way of handling. Instead,
the EXTRACT_CMDS should be changed to drop the useless sub-directory,
i.e to mimic what tar --strip-components=1 does.

Could you fix this up?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
