From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 24 Aug 2017 12:50:20 -0500
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
In-Reply-To: <20170824193354.782bae38@windsurf>
References: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
 <20170824193354.782bae38@windsurf>
Message-ID: <CANQCQpY+iyQ5XtTA5tCh9V9awNa4fhGzJ+bmBdY1YWODuxjppQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bin,

On Thu, Aug 24, 2017 at 12:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> I'm adding in Cc Matt Weber, who has added the simicsfs package. Matt,
> if you can have a look at Bin's e-mail and my reply, and give some
> feedback, it would be useful. Thanks!
>
> On Thu, 24 Aug 2017 20:47:39 +0800, Bin Meng wrote:
>
>> I am using buildroot 2017.08-rc3 to build a rootfs for minnowboard
>> max. What I did is:
>>
>> $ make minnowboard_max_defconfig
>> $ make menuconfig
>>
>> Select "Target packages" -> "File system and flash utilities" -> simicsfs
>>
>> $ make
>>
>> The error message is:
>>
>> buildroot/output/build/simicsfs-1.18/./hostfs_file.c:67:43: error:
>> ?struct file? has no member named ?f_dentry?; did you mean ?f_owner??
>>   DPRINT1("hostfs: hostfs_read %ld\n", file->f_dentry->d_inode->i_ino);
>>
>> buildroot/output/build/simicsfs-1.18/./hostfs_file.c:151:2: error:
>> unknown field ?aio_read? specified in initializer
>>   .aio_read = hostfs_aio_read,
>>
>> buildroot/output/build/simicsfs-1.18/./hostfs_file.c:152:2: error:
>> unknown field ?aio_write? specified in initializer
>>   .aio_write = hostfs_aio_write,
>>
>> buildroot/output/build/simicsfs-1.18/./hostfs_inode.c:174:10: error:
>> implicit declaration of function ?inode_change_ok?
>> [-Werror=implicit-function-declaration]
>>   error = inode_change_ok(inode, iattr);
>>
>> buildroot/output/build/simicsfs-1.18/./hostfs_inode.c:248:25: error:
>> ?PAGE_CACHE_SHIFT? undeclared (first use in this function)
>>   pgoff_t index = pos >> PAGE_CACHE_SHIFT;
>>
>> <snip>
>>
>> Although the README in the simicsfs 1.18 package says: Linux kernel
>> 2.6.12 and later only. I believe this package does not build for
>> latest kernel like v4.12.2.
>
> This is not really Buildroot's fault: simicsfs-1.18 is simply not
> compatible with Linux 4.12.
>
> Unfortunately, simicsfs is no longer available at
> http://download.simics.net/pub/simicsfs-1.18.tar.gz, where Buildroot
> currently downloads it. The build only succeeds because we have a
> backup of this tarball at http://sources.buildroot.net.
>

The project I originally did the 1.18 integration on completed ~2yrs
back and my access to WindRiver Simics material is now gone.  It's too
bad they didn't keep this driver public, however you may check with
your WindRiver Simics contacts to see if they just moved the site and
you could propose an update to this Buildroot package fixing support.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
