From: hartleys <hartleys@visionengravers.com>
Date: Wed, 13 Aug 2008 15:18:33 -0400
Subject: [Buildroot] Package haserl does not install to root filesystem
In-Reply-To: <873al8rb7t.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE190960E889@mi8nycmail19.Mi8.com>
	<873al8rb7t.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190966BDD6@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 13, 2008 12:01 PM, Peter Korsgaard wrote:
>> I have the haserl package selected (due to webif) but it
>> does not get installed when I do a make.
>>
>> After the initial make is complete and the root filesystem
>> exists in my $(TARGET_DIR) I can do the following to get it
>> to install:
>>
>> $ make haserl-dirclean
>> $ make
>>
>> Any ideas how to fix it?
>
> Could you be a bit more specific? Does it error out or does
> the haserl install step never run? It seems to work here.

For the initial make with the root filesystem not existing in
$(TARGET_DIR) but haserl is in $(BUILD_DIR) the build completes with no
errors but haserl is not installed. Actually, none of the
Makefile.autotools.in steps run for haserl.

The "make haserl-dirclean; make" will then do all the steps in
Makefile.autotools.in and install haserl.

I think the problem is because of $(BUILD_DIR)/%/.stamp_target_installed
still existing.

>> Also, I'm not sure it matters but, the haserl.mk looks
>> different than most the other .mk that use AUTOTARGETS. It
>> uses := instead of = to set all the variables.
>
> That's afaik ok. := is more efficient than = so it should
> normally be used.

Not a problem. It just was different so thought I would ask.

Hartley Sweeten
