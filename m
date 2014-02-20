From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 08:49:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] icu: detect and add compiler symbol
	prefix to the assembly code
In-Reply-To: <20140220083102.609c5783@skate> (Thomas Petazzoni's message of
 "Thu, 20 Feb 2014 08:31:02 +0100")
References: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
 <87wqgqyaxy.fsf@dell.be.48ers.dk> <20140220083102.609c5783@skate>
Message-ID: <87sirexlys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Wed, 19 Feb 2014 23:50:01 +0100, Peter Korsgaard wrote:

 >> We recently added this patch to icu for bfin symbol prefix, but from
 >> todays autobuilder I see that icu's configure script completely doesn't
 >> support uclinux (E.G. bfin):
 >> 
 >> http://autobuild.buildroot.net/results/d11/d118b4f753ade63201758e1b14ca54d96ec77698/build-end.log
 >> 
 >> What's going on here? Should I revert this patch and instead mark icu as
 >> unavailable on bfin?

 > No. I believe icu support bfin-linux-uclibc (i.e FDPIC), but not
 > bfin-uclinux. I've modified icu so that it accepts bfin-uclinux as
 > well, but apparently icu generates an ELF file by itself (!), and puts
 > it in an .a archive. Which of course is not really to the taste of the
 > FLAT format ld used on bfin-uclinux.

Ahh yes, I missed the different bfin variants.

 > I'm trying to figure out if icu can be convinced to generate source
 > code instead and compile it, but the icu source code is weird, to say
 > the least.

 > So I believe I will send a patch that disables ICU when !BR2_BINFMT_ELF.

Ok, thanks.

-- 
Bye, Peter Korsgaard
