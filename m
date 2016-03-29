From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 29 Mar 2016 10:39:13 +0200
Subject: [Buildroot] [PATCH 1/2] core/pkg-kconfig: add an option to use
	olddefconfig
In-Reply-To: <20160326185252.22cae0a0@free-electrons.com>
References: <1458901049-3693-1-git-send-email-romain.izard.pro@gmail.com>
 <20160326174203.GA3589@free.fr> <20160326185252.22cae0a0@free-electrons.com>
Message-ID: <CAGkQfmOo__dCfdJ0NdJYk=TF79oV9k2QEZ7TUTBGyhMufk6vdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-03-26 18:52 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 26 Mar 2016 18:42:03 +0100, Yann E. MORIN wrote:
>
>> In fact, we've already discussed this, and we concluded that we would
>> want an automatic behaviour.
>>
>> I.e. we try to use olddefconfig, and fallback to the yes-trick, like
>> so:
>>
>>     make olddefconfig || { yes "" |make oldconfig; }
>>
>> Care to adapt your patch and respin, please? Of course, your second
>> patch will no longer make sense after that.
>>
>> In the meantime, I marked your patches as "Changes Requested" in
>> patchwork.
>
> And here is the reason why we want this automatic behavior rather than
> the explicit FOO_KCONFIG_OLDDEFCONFIG variable that you proposed
> Romain: the Linux, Barebox and U-Boot packages, which are some of the
> main users of kconfig-package infrastructure, have user-configurable
> versions. Therefore, we don't know if the user will select a recent
> enough version of the kernel, Barebox or U-Boot with olddefconfig
> support.
>
> For this reason, we cannot state in the Barebox, Linux or U-Boot
> packages whether they support olddefconfig or not, as it depends on
> the version. By having an automatic handling, regardless of the
> package and its version, we will use olddefconfig if available, and
> fallback to the old method if not.

If we want to handle not only the existing case, but also the historic
cases, we have to use the 'oldnoconfig' target name, as the kernel
target was only available under this name between versions 2.6.36 and
3.6.  It is still supported, even if it is a misnomer.

I will update the patch to handle this.

Best regards,
-- 
Romain Izard
