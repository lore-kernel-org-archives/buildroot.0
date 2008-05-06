From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 6 May 2008 14:19:14 -0300
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:atngw100 atngw100-base
	atngw100-expanded etc...
In-Reply-To: <008e01c8af69$830eef00$5e8d910a@atmel.com>
References: <20080506013810.213FE3C6D4@busybox.net>
	<46a136670805051855v20cfee30o267907b605f6bc9a@mail.gmail.com>
	<008e01c8af69$830eef00$5e8d910a@atmel.com>
Message-ID: <d6cda7730805061019j4d5a8d8fvb4c9c2d3016c89d2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>  > A couple of us AVR32 users have been
>  > discussing the patch.avr32 scheme, is this out of the question?
>
>  What is the benefit?
>  You can add patches to the AVR32 prepatched toolchain at "target/device/Atmel/toolchain"
>  Just need to add the correct directories.
>
>  The drawback of having patches inside the svn is that everyone not
>  using AVR32 will have to suffer the additional download.

Anyone not using avahi suffers additional download for that package,
as well as java, or MIPS, or x86. Do you see where I'm getting?

The benefit are several:

- More eye balls: the underlying building is used and improved by many
different platforms. Improvements in one affects all. A breakage here
will be detected and fixed more rapidly.

- Freedom of access: anyone with commit access to SVN can fix or
update the whole system, there is no dependency on a single person.

- Less disk space consumed and bandwidth saved: Anyone building for
more than one platform doesn't require additional 50Mb per toolchain.
That's for all developers, everyone here has at least once built for a
different $(ARCH) than they usually do.

- It worked: the external toolchain doesnt.

- Gives visibility to patches: If a patch breaks an $(ARCH) all you
have to do is rename it, but you gain the knowleadge that the issue
exists, and the patch maintainer can be notified. This makes it easier
for patches to be accepted upstream later on.

- We could get rid of Atmel Specifics: In buildroot we have 2 flavors
of external toolchain: generic and Atmel. Kill Atmel.

Seriously, building an image takes several gigabytes, my dl dir has
1Gb of downloaded packages alone, when extracted they expand a lot,
when compiled, another 2 fold, how significant is a few patches?

Regards,
    Thiago A. Correa
