From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:04:07 +0200
Subject: [Buildroot] Package for .NET Core runtime
In-Reply-To: <CAOiXNkAoGPo+dsXjkkvC=mCE+r0X2SzoxN9wMaU1B1tL1+3HYw@mail.gmail.com>
References: <CAOiXNkB1uAiKUczr42uOtXQLR1ZujhhWOCyADfaUQqzVEcAH_w@mail.gmail.com>
 <20200813212833.3a8f4005@windsurf.home>
 <CAOiXNkAoGPo+dsXjkkvC=mCE+r0X2SzoxN9wMaU1B1tL1+3HYw@mail.gmail.com>
Message-ID: <20200815160407.3c712daa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrey,

On Sat, 15 Aug 2020 14:25:42 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> It would be interesting for me to improve the package and I would
> definitely try to do it. However, I could not commit to any particular
> deadline since tasks with higher priority could preempt this activity
> :-) . I will post to the list when I progress on this.

No worries, we also don't have any specific deadline in Buildroot :-)

Perhaps you could start by sending with "git send-email" the patch you
already have, so we can start giving some initial feedback ?

> Yes, that is right. The host compiler generates binaries which could
> be executed on the target. As I understand, .NET Core runtime is
> essentially a bunch of libraries which are required to run the
> application. Advantage of having the runtime installed ist that these
> libraries could be used by multiple applications. As an alternative,
> on the host, it is possible to generate so-called self-contained
> applications. They contain the binary itself and the copy of runtime.
> So if there are multiple applications, runtime can save the space on
> target. Whether the application is self-contained or framework
> (runtime) dependent is controlled by compilation with --self-contained
> parameter:
> $ dotnet publish -c Release -r linux-arm --self-contained false
> 
> What would be really cool is to provide support for .NET Core
> applications similar to how it is made, for example, with Golang
> ($(eval $(golang-package))). Together with the runtime package it will
> enable a rather smooth way to build .NET applications with Buildroot.

Thanks for those details! Considering what you said, I believe it would
make sense to also package the .NET SDK as a host package in Buildroot,
so that a user can easily have both the compiler on the build machine
and the runtime on the target machine. What do you think ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
