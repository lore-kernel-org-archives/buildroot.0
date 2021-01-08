From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Fri, 8 Jan 2021 13:01:51 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
In-Reply-To: <CABWPoFFFA_jB0bqBSGDmnk+7YvM6br0=7=KcnKUvnctVrvmQNA@mail.gmail.com>
References: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
 <20210104085858.68f57652@windsurf>
 <CAOiXNkARyVd8=v7ZShcdAw7eZHDY+Apf5_vLDsxiGT-tpGsEvg@mail.gmail.com>
 <CABWPoFFFA_jB0bqBSGDmnk+7YvM6br0=7=KcnKUvnctVrvmQNA@mail.gmail.com>
Message-ID: <CAOiXNkBPm8ksDHTWXrzA9zmFZxShEWSOSeG4pn0r3iYRZxKq6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Regarding Andrey's patch, I'm not sure if that is the correct approach, I
> mean, the idea is okay for most of the cases, but what if you install the
> dotnet-runtime -> v5.0.0 and the package that you want to install needs
> v3.1.0 ?

AFAIK, it is possible to have multiple runtimes installed. There are many
ways to say which one should be used by a particular application. One of
them, for example, using DOTNET_ENVIRONMENT environment variable (
https://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-5.0
) . Also, AFAIK, if the application is packaged with runtime, it will use
this packaged version even if there is separate runtime installed.

Anyway, I think there is no "right way" [tm]. It depends on the application.
For example, in a well controlled environment such as an embedded system
where only a predefined set of applications is installed, common runtime
would be preferable because it saves a considerable amount of space if
multiple applications need it.

Regards,
Andrey.
