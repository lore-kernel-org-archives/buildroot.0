From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 20 Dec 2016 17:55:41 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: fix custom patch dir legacy
	handling
In-Reply-To: <20161220230014.030d3f0d@free-electrons.com>
References: <1482203412-5361-1-git-send-email-danomimanchego123@gmail.com>
 <87tw9z7yw6.fsf@dell.be.48ers.dk>
 <06d55d32-6d74-0daa-8770-5b7e56deab81@mind.be>
 <871sx271oc.fsf@dell.be.48ers.dk>
 <CANxTyt52z7zKV59o9Qfs-EGTTHPZBX3w3ddsammdEu20CuotQw@mail.gmail.com>
 <87wpeu5l6a.fsf@dell.be.48ers.dk> <20161220230014.030d3f0d@free-electrons.com>
Message-ID: <CANxTyt7w5QA3rQYsOZ7Vev1d4-aVddVX48Oxdc065PTao6pbyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 20, 2016 at 5:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 20 Dec 2016 22:45:49 +0100, Peter Korsgaard wrote:
>
>>  > I noticed it now because we are upgrading from 2014.05 to 2016.11.  We
>>  > use both the uboot custom patch dir feature (replaced) and the linux
>>  > custom path feature (dropped, frowny face), so I'm hitting those right
>>  > now.
>>
>> Ok. The replacement for both is simply BR2_GLOBAL_PATCH_DIR (with linux
>> patches under linux/ and u-boot patches under uboot/).
>
> Not completely true: the "linux custom path" feature is not replaced by
> BR2_GLOBAL_PATCH_DIR. If one wants to get the same functionality, i.e
> telling Buildroot to use the Linux kernel source code from an available
> local directory, then the only solution is to use LINUX_OVERRIDE_SRCDIR.

Understood.  It's just that using a custom path for boot loaders and
the kernel is the norm for us, not an exception.  In fact, I've never
been on a project where we were able to use a main line kernel or
uboot.  Sometimes, we'll go through the exercise of making patches
against an initial state of a vendor's git repo, but many of out
project leaders prefer to just source control everything locally.
Under those circumstances, it's nicer to have the local path in the
defconfig than in a secondary local.mk or in the .mk file itself.

Danomi -
