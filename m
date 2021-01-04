From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 4 Jan 2021 09:53:02 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
In-Reply-To: <20210104085858.68f57652@windsurf>
References: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
 <20210104085858.68f57652@windsurf>
Message-ID: <CAOiXNkARyVd8=v7ZShcdAw7eZHDY+Apf5_vLDsxiGT-tpGsEvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

> > Notice that to build  dotnet, you need a working dotnet. This is the reason
> > for host is just downloading and extracting a precompiled one
>
> Thanks for your contribution!
>
> The first comment is that your patch only adds host-dotnet-sdk, and we
> separately had a patch in September 2020 from Andrey Nechypurenko
> adding the dotnet-runtime. My understanding is that in fact both are
> needed to have complete .NET support in Buildroot: host-dotnet-sdk to
> get the compiler on the host machine, and dotnet-runtime to have the
> runtime on the target. Is this correct ?

Basically yes. It is correct. Strictly speaking, when
(cross)compiling/packaging .net core application, there are two options:

1. Include all runtime parts (mainly bunch of .so files) with application.

2. Assume that the target platform has .net runtime installed and does not
include relevant parts into the application.

I was focusing on the second option since it prevents runtime duplication
for more than one application (it is not a neglectable amount, in particular
for embedded applications).

> Andrey said he would come up within a new iteration, but I don't think
> he has posted any new version in the last few months.

You are right. I've got comments and improvement suggestions but somehow
this activity was preempted by others with higher priority :-)  Will
definitely try to complete it in the near future.

Regards,
Andrey.
