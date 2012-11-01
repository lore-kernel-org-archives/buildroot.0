From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 1 Nov 2012 09:22:28 +0000
Subject: [Buildroot] [PATCH buildroot] fs/common: Create initial console
	device
In-Reply-To: <5091AA49.6070300@mind.be>
References: <1351677232-14959-1-git-send-email-markos.chandras@gmail.com>
 <5091AA49.6070300@mind.be>
Message-ID: <CAG2jQ8jVWWesP4TNnPRca-U9e4AfjCPDkNM8S27vnjCen+GQnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 31, 2012 at 10:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 10/31/12 10:53, Markos Chandras wrote:
>>
>> From: Markos Chandras<markos.chandras@imgtec.com>
>>
>> A /dev/console node must be present in rootfs when the Linux kernel
>> boots otherwise the kernel will print the following warning:
>> "Warning: unable to open an initial console"
>>
>> This is because when we use an initramfs along with devtmpfs, the /dev
>> directory is not populated at this point. This can cause problems when a
>> program (e.g ldso with early debugging enabled) opens a standard file
>> descriptor for read/write before these descriptors are actually created by
>> the init process later on.
>>
>> Signed-off-by: Markos Chandras<markos.chandras@imgtec.com>
>
>
>  Good point.  However:
>
> - this is also true for mdev/udev;
> - it is only relevant in a cpio/initramfs rootfs;
> - it's cleaner to use the device table.
>
> So I'd add a device table line to PACKAGES_PERMISSIONS_TABLE in
> fs/cpio/cpio.mk, where the init script is also installed.
>
>  Regards,
>  Arnout
>
>

Hi Arnout,

Hmm I didn't know that the same problem exists in udev/mdev
configurations. I will prepare a new patch
like you suggested.

-- 
Regards,
Markos
