From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 13 Aug 2012 18:12:07 +0800
Subject: [Buildroot] [PATCH 2/5] linux: support unpacked kernel source
	tree
In-Reply-To: <20120811200654.35b80b74@skate>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-2-git-send-email-sonic.adi@gmail.com>
 <20120811200654.35b80b74@skate>
Message-ID: <CAJxxZ0NUYRsv3qsNY_pPPPSKsxHEt7-zQ2RkCUnwn+pmYu25Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2012 at 2:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Tue, 7 Aug 2012 17:09:34 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Point the kernel build system to the unpacked source tree.
>> Allow the building folder differ from the source folder.
>>
>> LINUX_DIR still refers to the building folder, while LINUX_SOURCE_DIR
>> refers to the customer specified source folder.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> I know Mike implemented this a while ago, but we don't want this in
> Buildroot. The reason is that we don't want a per-package specific
> mechanism to handle such a thing, but rather something at the package
> infrastructure level.
>
> At the moment, what we have to offer is the local.mk mechanism: you can
> create a local.mk in which you write:
>

Should I put this local.mk into buildroot/linux/ ?

> LINUX_OVERRIDE_SRCDIR = /path/to/linux/sources
>
> and then Buildroot will use the sources of Linux from this directory
> instead of doing the normal download/extract/patch strategy.
>

The kernel configuration options in linux/Config.in don't allow me to
choose a local source. What should I do after seting local.mk up?

Thanks

Sonic
