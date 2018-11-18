From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 22:16:50 +0100
Subject: [Buildroot] [PATCH] package/xen: Bump Xen to 4.11.0 and
 backport a fix
In-Reply-To: <CANQCQpbyf4Q72Qkjug8D417kHWB2q7g0b0SwMVAcKW7u9pEyGg@mail.gmail.com>
 (Matthew Weber's message of "Sat, 17 Nov 2018 18:14:28 -0600")
References: <20181117221707.28399-1-alistair@alistair23.me>
 <CANQCQpbyf4Q72Qkjug8D417kHWB2q7g0b0SwMVAcKW7u9pEyGg@mail.gmail.com>
Message-ID: <87tvkekrwd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Alistair,
 > On Sat, Nov 17, 2018 at 4:19 PM Alistair Francis <alistair23@gmail.com> wrote:
 >> 
 >> Bump the Xen package to the latest release and backport a fix from the
 >> Xen master brach.
 >> 

 > Good call on doing the bump, I didn't look close enough to see that
 > would catch the patches[1][2] I sent and my [3] was a yocto reference
 > to your patch below.  I'll reject mine and provide my tested by on
 > this set as it is a much cleaner fix.

 > I'd suggest splitting this patch into a two separate patches(unsure of
 > others preference).

 > Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

 > [1] https://patchwork.ozlabs.org/patch/999090/
 > [2] https://patchwork.ozlabs.org/patch/999089/
 > [3] https://patchwork.ozlabs.org/patch/999088/

Hmm, I was hessitating what to do. As we are past -rc1 it would be nicer
to just fix build issues on 4.10.2 instead of bumping, but judging from
the upstream patch series, more patches will be needed:

https://www.mail-archive.com/xen-devel at lists.xenproject.org/msg11467.html

I checked upstream, and these patches have still not made it to the
4.10.x series, so moving to 4.11.x for gcc 8 support is probably the
cleanest solution after all.

Committed, thanks.

-- 
Bye, Peter Korsgaard
