From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 9 Jul 2007 21:16:45 +0200
Subject: [Buildroot] [buildroot 0001415]: SVN buildroot does not build
	configuration package
In-Reply-To: <37c712e0707091150q216848bqfb06055300b50398@mail.gmail.com>
References: <6b74b6a0ff9392d0dc56e671767727a0@busybox.net>
	<20070709182752.GB24951@aon.at>
	<37c712e0707091150q216848bqfb06055300b50398@mail.gmail.com>
Message-ID: <20070709191645.GA25250@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 09, 2007 at 02:50:19PM -0400, Allan Clark wrote:
>On 7/9/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:

>>There's no need to touch foo.h
>
>Actually, there is, and I discussed it in the list

You said something about it, have to revisit the details.
>
>>>patching file toolchain/gcc/4.2.0/500-bsd-no-map_anonymous.patch
>>>patching file toolchain/dependencies/dependencies.sh
>>>patching file toolchain/dependencies/dependencies.mk
>>>patching file package/make/make.mk
>>
>>Is there a newer version of make out there?
>
>I think it was updated in r19056; this change is used with following:
>
>>>patching file toolchain/dependencies/check-host-make.sh
>
>See also bug #1422

ah, i thought that was already in. My bad, it was automake for the host.

>>>:~/src/buildroot Allan$ chmod +x
>>>toolchain/dependencies/check-host-make.sh
>>
>>I don't think that you really need this to be executable
>
>Fails if it isn't executable.

It is called via
$(shell $(CONFIG_SHELL) $(check-lxdialog)
I fail to see how this would require it to be executable unless you
don't have a shell (which is unlikely since then you couldn't run it
either way ;)

>I assume if my bug#1422, resolved by file#1072 and 1073 is
>incorporated, then I won't need to make this file executable, it'll
>checkout executable just as check-host-sed.sh does.

That late-binding of MAKE1 would be really, really ugly. hm.

head -1
this is deprecated (didn't look if sed does the same; if so both need
fixing).

Re your change to dependencies.mk. Please explain why you do not use the
very same scheme for host-make as for sed-make?
