From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 15 Oct 2007 08:50:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
References: <20071012210141.1DF69A5E1B@busybox.net><0710131046500.9729@somehost><1192269439.26495.4.camel@elrond.atmel.sweden><0710131212520.9729@somehost><1192300638.26495.13.camel@elrond.atmel.sweden><0710132115250.9729@somehost><1192307460.26495.27.camel@elrond.atmel.sweden>
	<0710132305350.9729@somehost>
Message-ID: <016c01c80ef8$e931c350$9900a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> The guys at Atmel do the gcc ports for AVR32.
> I see.
> 
>> I am trying to make it easier for other people to build it.
> That's nice of you.
> 
>> This change does not break any other arch.
> Fair enough.  You may be right.
> 
>> It used to be "-cp", and the change to "cp" broke the AVR32 arch.
> 
> Alright.  Why don't you then make that '-cp' conditional on AVR32 and
> leave it 'cp' for all other?  In a way that would help identify oddities
> with AVR32 everywhere.  One size fits all is quite hard to find.
> 

Some people are against having architecture specific extensions in the common files.
I believe it is better to continue the build, and then do a verify afterwards.
If you read archives, a lot of people consider the libgcc_s to be a PITA.

>> Can you explain why all other archs are broken?
> 
> I'm afraid I can't.  And I won't bother trying to. It may be unfair to
> blame all buildroot brokenness on you.  Still, buildroot is broken in
> various places.  One thing gets fixed and two other break.  That's my
> experience of the passed weeks :(
> 

The "-cp" -> "cp" patch has caused me several hundred hours
of extra work, and this can all be blamed on Bernhard.
Any problems caused by patches trying to fix the broken AVR32
can therefore indirectly be blamed on Bernhard as well.

In practice, I do *not* want to blame Bernhard for *that* patch, since it 
very difficult to do a full test of buildroot using all parameters.

However, Bernhard has a policy which is to always use the latest stuff,
which makes IMHO Buildroot, nothing more than a (nice) toy.

You reported a build problem with JPEG and think that creating
a directory in $(STAGING_DIR) during the jpeg build
was the problem which caused the toolchain build to fail.
You probably only need to reflect on this for a millisecond or so to 
realize how absurd that is...

I rather think this is a result of Bernhards patch to deprecate older
versions of Binutils, automatically changing an existing *working* ".config" 
into something which might, or might not work after a "make menuconfig".


>> If the build works for all other archs, then the cp will work.
> 
> Yes, I agree.  'cp' shouldn't be a problem in this context.  Still, if for
> some misterious reason it doesn't get built, '-cp' doesn't break the build
> making us aware of that and things break later in other places?  Trouble
> shooting that scenario will be more painful, IMO.
> 
>> You have not explained in what way you suffer.
> 
> Thanks, I got better after getting out the previous post ;)
> 
> I'll try to explain.  Every time I check out a new tree, it takes one or
> several days to get it to build.  And when I think I'm done (save some
> patches not yet accepted upstream), check out a new tree, apply my
> patches, I start seeing things breaking again in various ways and I have
> to start all over again.  And that's _very_ frustrating!
> 
> Happened again today :(
> 

Build a toolchain that works, then use an external toolchain.
Saves you a lot of time...


Best Regards
Ulf Samuelsson
