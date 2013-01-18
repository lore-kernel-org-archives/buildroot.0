From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 18 Jan 2013 12:30:28 +0100
Subject: [Buildroot] designing a firmware update mechanism
In-Reply-To: <1358460573.32266.63.camel@genx>
References: <1358460573.32266.63.camel@genx>
Message-ID: <1366890.AleMb1sNgO@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 January 2013 14:09:33 John Stile wrote:
[...]
> So far I am trying to split NAND in redundant halves (each with a copy
> of uboot + uboot-env + kernel + roofs), and modify at91bootstrap to
> choose which uboot to load, based on something inside the uboot-env
> areas.
> 
> Will I need to compile 2 versions of uboot, differing only in where to
> look for the uboot-env, or is there another way?  
Two different version of firmware does not looks a good idea. at91bootstrap 
knows which copy of uboot is started/I suggest to find a way to pass this 
information to uboot. With this information, uboot know which uboot-env to 
use.

[...]

-- 
J?r?me Pouiller
