From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 8 May 2009 06:17:27 -0300
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <87hbzwatgw.fsf@macbook.be.48ers.dk>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 8, 2009 at 5:29 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> ?>> - Please sign off on your fixes (git commit -s)
>
> ?Thiago> Can this be done easily after it has been commited? Since I had setup
> ?Thiago> my name and address, I had hopes that it would do it automagically.
>
> You can rebase your commits and edit the descriptions - Something
> like:
>

Ok, after an hour of wrestling with git and it's man pages, I think I
got it right :)
I was even able to split the kernel update commit.

> ?>> - What do you mean with 'this fixes iptables compile'? What does the
> ?>> ?kernel has to do with iptables compilation?
>
> ?Thiago> Something is wrong in the kernel headers in previous versions.
> ?Thiago> Something in byteorder.h prevended it from building earlier.
>
> But the Linux.advanced stuff doesn't have anything to do with kernel
> headers, right?

Unfortunally, it doesn't look like it. Even if I select 2.6.29 for the
linux headers (toolchain), the build fails. Unless I actually update
the kernel on the target, it fails to build for avr32. According to
the avr32-linux mailling list, there was a byteorder.h restructuring a
while back, so I guess some versions of the headers are not what
iptables expects.

> ?Thiago> I thought of using master for current and 2009.07 for next. But I
> ?Thiago> could use a suggestion anyway.
>
> I would think it would be easier to leave master alone so you easily
> pull new changes in the main repo and rebase your commits on it.

Yeah, after all this rebase thing I see your point. I guess I will do
that once those changes are merged.

> ?Thiago> But feel free to apply a previous patch that does the same. I still
> ?Thiago> haven't figured out how to do git am stuff :D
>
> Ok. git am is easy - Simply save the mail and run git am -s <file>
>

A bit easier said than done *smile*.
I do all of my buildroot development over ssh. Anyway, what happens if
I apply a patch and then you apply it a while later before pulling
from my tree? I guess we will conflict right?

my git pull-request: (thanks for the tip)

The following changes since commit 30b9a6ae5b1d770d9b8eae9e9bafc316a4923762:
  Peter Korsgaard (1):
        dmraid: broken with parallel make (lib + tools race)

are available in the git repository at:

  git://git.buildroot.net/~correa/git/buildroot.git master

Thiago A. Correa (4):
      Update atngw100_defconfig
      Add dl folder to gitignore
      Update Linux Advanced to 2.6.29.2
      Update atngw100_defconfig to kernel 2.6.29.2

 .gitignore                                      |    1 +
 target/device/Atmel/atngw100/atngw100_defconfig |   38 +++++++++-------------
 target/linux/Config.in.advanced                 |   17 +++++-----
 target/linux/Config.in.versions                 |   10 ++++--
 4 files changed, 33 insertions(+), 33 deletions(-)

Kind Regards,
   Thiago A. Correa
