From: Raul Hidalgo Caballero <deinok@deinok.com>
Date: Thu, 7 Jan 2021 23:52:11 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
In-Reply-To: <CAOiXNkARyVd8=v7ZShcdAw7eZHDY+Apf5_vLDsxiGT-tpGsEvg@mail.gmail.com>
References: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
 <20210104085858.68f57652@windsurf>
 <CAOiXNkARyVd8=v7ZShcdAw7eZHDY+Apf5_vLDsxiGT-tpGsEvg@mail.gmail.com>
Message-ID: <CABWPoFFFA_jB0bqBSGDmnk+7YvM6br0=7=KcnKUvnctVrvmQNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Glad to hear that the general approach of my patch is okay!!

I will work on the changes requested this weekend.
Probably I will need a bit of help regarding "git commits" as I'm not used
to the email system.

Regarding Andrey's patch,
I'm not sure if that is the correct approach, I mean, the idea is okay for
most of the cases,
but what if you install the dotnet-runtime -> v5.0.0 and the package that
you want to install needs v3.1.0 ?

My idea is to make small steps until dotnet is perfectly integrated with
buildroot, while my knowledge of buildroot grows.
The steps are:
* Add support for host-dotnet-sdk only (via direct download)
* Add all supported host archs
* Add generic package for dotnet using only the host-dotnet-sdk
(self-contained) every package includes it's own runtime
* Add support for dotnet-runtime (via direct download) (already done vi
Andrey)
* Add support for dotnet-aspnetcore (via direct download)
* Add support for not self-contained in the generic package
* Start building target packages using source (this will be a bit hard)
* Start building hos packages using source (this will be a pretty hard)

Best Regards,
HIDALGO CABALLERO, Raul

On Mon, Jan 4, 2021 at 9:53 AM Andrey Nechypurenko <andreynech@gmail.com>
wrote:

> Hi Folks,
>
> > > Notice that to build  dotnet, you need a working dotnet. This is the
> reason
> > > for host is just downloading and extracting a precompiled one
> >
> > Thanks for your contribution!
> >
> > The first comment is that your patch only adds host-dotnet-sdk, and we
> > separately had a patch in September 2020 from Andrey Nechypurenko
> > adding the dotnet-runtime. My understanding is that in fact both are
> > needed to have complete .NET support in Buildroot: host-dotnet-sdk to
> > get the compiler on the host machine, and dotnet-runtime to have the
> > runtime on the target. Is this correct ?
>
> Basically yes. It is correct. Strictly speaking, when
> (cross)compiling/packaging .net core application, there are two options:
>
> 1. Include all runtime parts (mainly bunch of .so files) with application.
>
> 2. Assume that the target platform has .net runtime installed and does not
> include relevant parts into the application.
>
> I was focusing on the second option since it prevents runtime duplication
> for more than one application (it is not a neglectable amount, in
> particular
> for embedded applications).
>
> > Andrey said he would come up within a new iteration, but I don't think
> > he has posted any new version in the last few months.
>
> You are right. I've got comments and improvement suggestions but somehow
> this activity was preempted by others with higher priority :-)  Will
> definitely try to complete it in the near future.
>
> Regards,
> Andrey.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210107/3d82d9f3/attachment.html>
