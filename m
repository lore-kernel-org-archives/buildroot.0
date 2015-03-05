From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Thu, 05 Mar 2015 18:55:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for RIoTboard
In-Reply-To: <20150305160528.1591f186@free-electrons.com>
References: <1425565907-26222-1-git-send-email-picmaster@mail.bg>	<20150305153739.6ae1bbf0@free-electrons.com>	<54F86F27.7070806@mail.bg>
 <20150305160528.1591f186@free-electrons.com>
Message-ID: <54F88A75.4090807@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 03/05/2015 05:05 PM, Thomas Petazzoni wrote:
> Dear Nikolay Dimitrov,
>
> On Thu, 05 Mar 2015 16:58:47 +0200, Nikolay Dimitrov wrote:
>
>> Not really. Now as you're asking, I found that I'm doing this by habit
>> (probably inherited by some weird ARM board boot-requirements in the
>> past).
>
> Yes, some boards/bootloader configuration have the limitation that the
> first partition must be a FAT partition. In this case, it definitely
> makes sense to have two partitions, since a Linux root filesystem can
> hardly be stored in a FAT filesystem.
>
>> Would you prefer me to re-send the patch with instructions only for
>> single partition layout?
>
> Well, in the situation of this board, where the bootloader is stored
> raw and is capable of reading an ext2 filesystem, yes I believe a
> single partition makes more sense.
>
> You can ask Buildroot to install the uImage and DTB to /boot in the
> root filesystem. However, for the extlinux.config file, you'll have to
> add a post-build script to do this.

Thanks for your comments. I think this is better than my initial
proposal. Patch is on the way.

Regards,
Nikolay
