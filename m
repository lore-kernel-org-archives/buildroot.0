From: Bill Bogstad <bogstad@pobox.com>
Date: Sat, 29 Aug 2009 09:31:55 -0400
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <159a01660908290033y692d41e8r781a5d4c9b3445f6@mail.gmail.com>
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
	<2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
	<87a5b0800908280931x523f6c88k1e006634d612425f@mail.gmail.com>
	<2d6a9f6f0908281451i4f7e1ed1s1f5da2693b6559a4@mail.gmail.com>
	<159a01660908290033y692d41e8r781a5d4c9b3445f6@mail.gmail.com>
Message-ID: <2d6a9f6f0908290631h2a599334t608bec3f73fe6d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 29, 2009 at 3:33 AM, Daniele Salvatore
Albano<d.albano@gmail.com> wrote:
> Ubuntu is perfectly supported, just need to use bash instead of dash, just run
> sudo dpkg-reconfigure dash
>
> and say no when it ask for sh link to dash

Please reread the section of my previous message below.  I did exactly
what you said and got exactly
the same error message.  It may be that dash vs. bash sometimes causes
a problem, but that is NOT
the problem in this case.  Everything works perfectly with bash if I
don't compile kexec.  It only fails
if I add kexec to my config file and bash vs. dash makes no difference
in that case.  This is easily repeatable on my system.  It still maybe
that my system is different from other Ubuntu 8.04 systems,
but until someone attempts to repeat it I can only assume it's a
problem with buildroot.

Finally, I would quibble with your statement about Ubuntu being
perfectly supported as well.  Having to
make such a fundamental change to a core program of the system in
order to get it to work correctly
seems a little much.   In any case, it looks like the top level
Makefile already handles things if /bin/sh isn't bash.  It may be that
some parts of buildroot don't make use of SHELL properly, but that
would seem to be a bug rather then a dependency.  The actual
dependency is that bash be installed on the system somewhere.

From Makefile:

# we want bash as shell
SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
        else if [ -x /bin/bash ]; then echo /bin/bash; \
        else echo sh; fi; fi)

Bill Bogstad

>
> 2009/8/28 Bill Bogstad <bogstad@pobox.com>:
>> Re: suggestion to replace /bin/sh with a link to bash.
>>
>.....
>>
>> In either case, it doesn't matter. ?I made the switch and get exactly
>> the same error. ?I'll be switching it back to the default since it
>> doesn't matter and I would prefer a 'standard' Ubuntu host environment
>> for other uses of the machine.
