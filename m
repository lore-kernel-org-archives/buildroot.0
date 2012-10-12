From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Oct 2012 20:52:06 +0200
Subject: [Buildroot] post-buil script in chrooted
In-Reply-To: <CAAXf6LVCr25_i_6CMR6DYs-5z1+bVuNNYEF4DedEe3j-6=4hqg@mail.gmail.com>
References: <5077A820.7050202@free.fr> <20121012093032.7ef6b972@skate>
 <CAAXf6LVCr25_i_6CMR6DYs-5z1+bVuNNYEF4DedEe3j-6=4hqg@mail.gmail.com>
Message-ID: <507866D6.8020608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/12 10:41, Thomas De Schampheleire wrote:
> On Fri, Oct 12, 2012 at 9:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>  wrote:
>> >  Dear David Bonnin,
>> >
>> >  On Fri, 12 Oct 2012 07:18:24 +0200, David Bonnin wrote:
>> >
>>> >>  Few ask in finalise target:
>>> >>  1- to do root task, i can only use permission: target in each
>>> >>  packages..........
>> >
>> >  Not sure I understand this part.
>> >
>>> >>  CAN i use a "root script" in chrooted mode?
>>> >>  ROOTFS_POST_BUILD_SCRIPT is not executed chrooted in the target.
>> >
>> >  No because it doesn't make sense. Buildroot is used in many cases for
>> >  cross-compilation, so the development machine is x86 or x86_64 and the
>> >  target filesystem contain ARM, PowerPC or MIPS binaries. So chrooting
>> >  into it is not possible (unless we use Qemu or something like that, but
>> >  it's not the idea of Buildroot, we want to do cross-compilation).
> Maybe you can explain why you think chroot would be necessary. What
> are you trying to accomplish?
> If you need to add device nodes for example, there are other ways to
> do it without needing to be root.

  I think he means fakeroot, not chroot...

  I can think of some things for which you may want to execute a fakeroot
script:

- to set xattrs or acls (though I'm not sure if libfakeroot supports them);
- to run some other 'filesystem generation' program, e.g. rsync or nfsd
(we would create a new rootfs type for that, but Joe R. User may have a
hard time doing that).


  But most likely, what David needs is covered by BR2_ROOTFS_DEVICE_TABLE.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
