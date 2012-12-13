From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Dec 2012 00:02:50 +0100
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <20121213220434.GA819@mail.sceen.net>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk> <50CA4A8F.1050002@mind.be>
 <20121213220434.GA819@mail.sceen.net>
Message-ID: <50CA5E9A.1090505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/12 23:04, Richard Braun wrote:
> On Thu, Dec 13, 2012 at 10:37:19PM +0100, Arnout Vandecappelle wrote:
>> - if you use anything else than static device management, the devtmps
>> will not be mounted automatically by the kernel; the cpio filesystem
>> adds a /init script that mounts it for you.
>
> The kernel has provided the ability to automatically mount devtmpfs for
> quite some time now. He just needs to make sure the option is selected
> in the kernel configuration.

  But it doesn't automount devtmpfs when the initramfs is mounted. That's
why fs/cpio/init exists.

  (Come to think of it, it is possible that an ext2 initrd is not 
considered the same as an initramfs and the kernel _will_ mount devtmpfs 
- I'm not sure).


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
