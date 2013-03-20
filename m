From: Daniel Price <daniel.price@gmail.com>
Date: Wed, 20 Mar 2013 02:25:35 -0700
Subject: [Buildroot] Interest in upgrading syslinux to 5.x?
In-Reply-To: <ECCCCA15FFC640AAA891EA6FC4BB8F28@beraninstruments.com.local>
References: <CAKduhSuJ_-2B7i7YOKyuErfhve_CXi1UvmNX_U7iQUXYt3c7hw@mail.gmail.com>
 <ECCCCA15FFC640AAA891EA6FC4BB8F28@beraninstruments.com.local>
Message-ID: <CAKduhSt3Vkpc+bLP4UM8On472BZqZ7aRVRmFZsG0kOKEm4XtEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Will, this is very helpful.  And the document you mentioned is
a good reference, especially the background about 'make installer'--
while I've been building the whole thing from source, I had been
wondering what that was about.  I have a working syslinux-5.01 build
which seems to solve my problems, but I am by no means an expert.  To
answer your other question: yes, I think we have similar problems-- I
need to support install from media and install from pxe, in a
development environment.

Today I posted a small patch to upgrade syslinux to 4.06.  You could
test that if you like.  It seems like 4.06 cleaned up some rough edges
when compiling 4.05-- or at least for me it did.

I guess we could add to buildroot a 'boot/syslinux5' recipe as a peer
to 'boot/syslinux,' to provide some time for people to transition over
(if the project heads were OK with that).  It has seemed to me by
reading various forums that there are some transition headaches.

         -dp

On Wed, Mar 20, 2013 at 1:50 AM, Will Moore
<will.moore@beraninstruments.com> wrote:
> Hi Daniel,
>
>> -----Original Message-----
>> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
>> Behalf Of Daniel Price
>> Sent: 19 March 2013 20:43
>> To: buildroot at busybox.net
>> Subject: [Buildroot] Interest in upgrading syslinux to 5.x?
>>
>> Hi folks,
>>
>> I was wondering if there is interest in having the syslinux bootloader
>> upgraded to the 5.x series.  Right now in buildroot we have 4.05.
>
> I too use buildroot to build syslinux.  Unless there is something odd about 5.x
> then yes, I'm interested!
>
>>
>> I have a 64-bit x86 system wherein there is a requirement that I
>> deliver syslinux's utilities and the mbr.bin to the target, and what I
>> have found after some experimentation is that syslinux 5.x seems
>> better suited to this, and is more amenable to running on a 64-bit x86
>> system.
>
> I have a 32 bit x86 target.  If I understand correctly, you are not only looking
> at building syslinux as a host tool for generating a bootable target, but you
> want syslinux as a target tool so the target can generate bootable somethings?
> In my case I have a target that generates bootable flash drives using syslinux
> to assist in target installation during development.
>
>>
>> I have a private recipe I'm calling 'syslinux-tgt' which accomplishes
>> this for myself, but I was wondering if it makes sense to drive (a) an
>> upgrade to 5.x and (b) additional changes to make it possible
>> (optionally) to deliver syslinux onto the target system.  Thoughts?
>> I'm willing to at least take a first pass at it.
>
> I have built syslinux for the target using a script external to buildroot, using
> the buildroot built toolchain, because I didn't think anybody else would want to
> do this in buildroot ... shows what I know.
>
> FWIW I say:
> (a) yes please
> (b) yes please
>
> I am not in a position to provide good advice on how to implement this but I
> would be happy to test your efforts.
>
> I note the syslinux /doc/distrib.txt says:
>
> "For creators of Linux distributions:
>
> Syslinux is a notoriously hard program to debug, since it runs outside
> of any operating system, and has a tendency to expose BIOS and
> hardware bugs on various systems.  Therefore, I would appreciate if
> you would resist the temptation of recompiling the Syslinux bootloader
> itself (ldlinux.asm) if at all possible.  If you do that, I will have
> to refer any bug reports I receive back to the respective distributor.
>
> However, I have no such concerns about recompiling the installer
> programs, and in fact, with both libc 5 and libc 6 in common use in
> the Linux world today I understand if you wish to relink the
> Linux-based installer against your system version of libc.  Therefore
> a special makefile targets "make installer" has been included with the
> Syslinux distribution, starting with version 1.42.
>
> To rebuild the installer programs *only*, starting from a freshly
> untarred distribution copy of Syslinux, do:
>
>         make clean
>         make installer
>
> If you want to remove all intermediate files, including the ones
> obtained from assembling ldlinux.asm and which are included in the
> distribution, do "make spotless".
>
> I appreciate your assistance in this matter.
>
>         H. Peter Anvin"
>
>>
>>        -dp
>>
>> --
>> Daniel.Price at gmail.com; Twitter: @danielbprice
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>



-- 
Daniel.Price at gmail.com; Twitter: @danielbprice
