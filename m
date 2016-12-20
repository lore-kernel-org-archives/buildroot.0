From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 22:45:49 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: fix custom patch dir legacy
	handling
In-Reply-To: <CANxTyt52z7zKV59o9Qfs-EGTTHPZBX3w3ddsammdEu20CuotQw@mail.gmail.com>
 (Danomi Manchego's message of "Tue, 20 Dec 2016 16:22:41 -0500")
References: <1482203412-5361-1-git-send-email-danomimanchego123@gmail.com>
 <87tw9z7yw6.fsf@dell.be.48ers.dk>
 <06d55d32-6d74-0daa-8770-5b7e56deab81@mind.be>
 <871sx271oc.fsf@dell.be.48ers.dk>
 <CANxTyt52z7zKV59o9Qfs-EGTTHPZBX3w3ddsammdEu20CuotQw@mail.gmail.com>
Message-ID: <87wpeu5l6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 >> >  This is 2016.11.x material.
 >> 
 >> It has been broken since 2016.05-rc1, but OK - We can indeed add it for
 >> 2016.11.x

 > I noticed it now because we are upgrading from 2014.05 to 2016.11.  We
 > use both the uboot custom patch dir feature (replaced) and the linux
 > custom path feature (dropped, frowny face), so I'm hitting those right
 > now.

Ok. The replacement for both is simply BR2_GLOBAL_PATCH_DIR (with linux
patches under linux/ and u-boot patches under uboot/).

I've applied the fix to the the 2016.11.x branch and will include it in
the upcoming 2016.11.1 release.

-- 
Bye, Peter Korsgaard
