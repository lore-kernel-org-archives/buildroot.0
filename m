From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Mon, 23 Nov 2015 08:00:32 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1] autofs: new package
In-Reply-To: <20151123054101.GH2177@tarshish>
References: <1448200100-29006-1-git-send-email-yba@tkos.co.il>
 <20151123054101.GH2177@tarshish>
Message-ID: <alpine.DEB.2.11.1511230758100.26339@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Nov 2015, Baruch Siach wrote:

> Date: Mon, 23 Nov 2015 07:41:01 +0200
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] autofs: new package
> 
> Hi Yonatan,
>
> On Sun, Nov 22, 2015 at 03:48:20PM +0200, Jonathan Ben-Avraham wrote:
>> +config BR2_PACKAGE_AUTOFS
>> +	bool "autofs"
>> +	select BR2_PACKAGE_NFS_UTILS # runtime
>> +	select BR2_PACKAGE_RPCBIND # runtime
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # rpcbind
>> +	depends on BR2_USE_MMU # nfs-utils, rpcbind
>> +	help
>> +	  Based on the Debian autofs package description:
>> +	  Autofs controls the operation of the automount daemons. The automount
>> +	  daemons automatically mount filesystems when they are used and unmount
>> +	  them after a period of inactivity based on a set of pre-configured
>> +	  maps defined by default in /etc/auto.master. The kernel automounter
>> +	  implements SunOS style automounter under Linux and requires a kernel
>> +	  version of at least 2.6.17 and the autofs4 kernel module.
>> +
>> +	  git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git
>
> The browser friendly link
> https://git.kernel.org/cgit/linux/storage/autofs/autofs.git/ would be better
> here, I believe.

Why? I always struggle to convert back from the browser URLs to plain git 
URL's so that I can see the sources in vi on my machine and index them. 
Why would anyone want to use an HTML browser to do this? Doesn't make 
sense.

  - yba


> baruch
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
