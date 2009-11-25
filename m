From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Nov 2009 23:16:11 +0100
Subject: [Buildroot] [git commit master] buildroot;
	move defconfigs to configs/ and print in help
In-Reply-To: <20091125230213.27e7b090@surf> (Thomas Petazzoni's message of
	"Wed\, 25 Nov 2009 23\:02\:13 +0100")
References: <20091004202133.B35E577762@busybox.osuosl.org>
	<20091005084845.023ff120@surf> <873a5y5nbq.fsf@macbook.be.48ers.dk>
	<20091111150359.579df608@surf> <87pr7afeyi.fsf@macbook.be.48ers.dk>
	<20091125230213.27e7b090@surf>
Message-ID: <87y6lu9ro4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I'm sorry to hear. I do kind of like it ;)

 Thomas> Argh, I still don't like it ;)

:/

I'll get back to you on this in more detail tomorrow, but just wanted to
reply to one thing now:

 >> With a find-all-files-ending-in-_defconfig-under-here thing? Could be
 >> done, but is kind of ugly - Same for make <foo>_defconfig.

 Thomas> Come on, kind of ugly ? It's a one liner for <foo>_defconfig (something
 Thomas> we already had) :

 Thomas> %_defconfig: $(CONFIG)/conf
 Thomas> 	cp $(shell find ./target/ -name $@) .config

But that's without error handling! If the user mistypes the defconfig
name he gets a very odd error:

make blah_defconfig
cp .config
cp: missing destination file operand after `.config'
Try `cp --help' for more information.

Whereas with a real dest: target rule like what we have now you get a
sensible error message:

make blah_defconfig
make: *** No rule to make target `blah_defconfig'.  Stop.

That's what I mean about ugly.

-- 
Bye, Peter Korsgaard
