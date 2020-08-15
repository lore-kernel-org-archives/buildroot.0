From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Sat, 15 Aug 2020 14:25:42 +0200
Subject: [Buildroot] Package for .NET Core runtime
In-Reply-To: <20200813212833.3a8f4005@windsurf.home>
References: <CAOiXNkB1uAiKUczr42uOtXQLR1ZujhhWOCyADfaUQqzVEcAH_w@mail.gmail.com>
 <20200813212833.3a8f4005@windsurf.home>
Message-ID: <CAOiXNkAoGPo+dsXjkkvC=mCE+r0X2SzoxN9wMaU1B1tL1+3HYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Thanks for the contribution and the details? The package doesn't seem
> to be that complicated. Do you think you could take the time to address
> the few issues you've pointed out, and submit it as a proper patch for
> inclusion ?

It would be interesting for me to improve the package and I would
definitely try to do it. However, I could not commit to any particular
deadline since tasks with higher priority could preempt this activity
:-) . I will post to the list when I progress on this.

> In any case, could you give some details on how this .NET Core runtime
> is meant to be used ? For example, would I need to take the SDK for
> x86-64 from https://dotnet.microsoft.com/download/dotnet-core/3.1,
> build a program with it, place the binary on the target, where it can
> run thanks to the .NET Core runtime you have packaged ?

Yes, that is right. The host compiler generates binaries which could
be executed on the target. As I understand, .NET Core runtime is
essentially a bunch of libraries which are required to run the
application. Advantage of having the runtime installed ist that these
libraries could be used by multiple applications. As an alternative,
on the host, it is possible to generate so-called self-contained
applications. They contain the binary itself and the copy of runtime.
So if there are multiple applications, runtime can save the space on
target. Whether the application is self-contained or framework
(runtime) dependent is controlled by compilation with --self-contained
parameter:
$ dotnet publish -c Release -r linux-arm --self-contained false

What would be really cool is to provide support for .NET Core
applications similar to how it is made, for example, with Golang
($(eval $(golang-package))). Together with the runtime package it will
enable a rather smooth way to build .NET applications with Buildroot.

Regards,
Andrey.
