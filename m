From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Apr 2014 16:53:48 -0300
Subject: [Buildroot] [PATCH 3/6] upstream glibc 2.18/2.19 works fine
 with microblaze
In-Reply-To: <CAPALihNu56_2XK5+oVrwON=pWS22xisVNTJc5Z6GX0vCvftScg@mail.gmail.com>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>	<1397382423-4939-4-git-send-email-wbx@openadk.org>	<53553336.2020401@zacarias.com.ar>	<CAPALihO_K2VsaYO9erhFrKZpY9755ACOjsm56O6VvxO9MA6-0Q@mail.gmail.com>	<535EA993.8080108@zacarias.com.ar>
 <CAPALihNu56_2XK5+oVrwON=pWS22xisVNTJc5Z6GX0vCvftScg@mail.gmail.com>
Message-ID: <535EB1CC.8010707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/28/2014 04:45 PM, William Welch wrote:

> Hi again,
> 
> Thank you for your help on this -- I should have said, that I am using
> the 'git' buildroot from earlier today ( a few hours ago), with no luck
> on the native toolchain.  So am I correct, that, for example, using the
> 'git buildroot', then ' make qemu_microblazeel_mmu_defconfig'  should
> build the native toolchain and the resulting image should boot?  Or,
> maybe the patches are not merged into the git tree yet?
> 
> I am not very skilled with qemu, so to confirm, are the directions in
> the boards/qemu/microblazeel-mmu/readme.txt correct?  It is a little
> confusing, since they mention the s3adsp1800, whereas the system.dts
> mentions a ML505 design.  Also the readme mentions qemu 1.7.0? I have
> 1.5.0 at the moment but I can install 1.7.0 if required.
> 
> thank you,
> 
> William

Hi.
They are not merged yet, Waldemar was waiting for my gcc 4.9.x patches
to get merged (done) and is going to rebase when he has time probably.
The directions in the readme.txt are correct, i make it a habit of
testing them regularly.
I have seen different versions of Qemu failing to work properly, even if
newer or older, there's no rule for that, that's the reason i mention
the exact version there.
Unfortunately for the 2014.02 release when the toolchain changes were
shipped and the configs weren't updated so they are effectively broken
for the current toolchain (it may be that the current toolchain is
broken for real scenarios, i can't know).
Waldemar's last patch updates the qemu defconfigs to a nice and simpler
config without the need for an external dts and brings in networking
support as well.
For the "latest" i've used Qemu 2.0.0
And to make things nicer i've got a patchset that builds qemu within
buildroot to avoid the messy problem of different vesions available, it
just needs some proper docs i think and should get in, right guys? :)
Regards.
