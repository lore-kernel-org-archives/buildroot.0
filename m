From: Raul Hidalgo Caballero <deinok@deinok.com>
Date: Tue, 12 Jan 2021 10:09:05 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
In-Reply-To: <CABWPoFH_UbU=b7T5yr2Wf23E1fz-dGe+SuVkiMqJGNtYXitLFg@mail.gmail.com>
References: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
 <20210104085858.68f57652@windsurf>
 <CAOiXNkARyVd8=v7ZShcdAw7eZHDY+Apf5_vLDsxiGT-tpGsEvg@mail.gmail.com>
 <CABWPoFFFA_jB0bqBSGDmnk+7YvM6br0=7=KcnKUvnctVrvmQNA@mail.gmail.com>
 <CAOiXNkBPm8ksDHTWXrzA9zmFZxShEWSOSeG4pn0r3iYRZxKq6g@mail.gmail.com>
 <CABWPoFH_UbU=b7T5yr2Wf23E1fz-dGe+SuVkiMqJGNtYXitLFg@mail.gmail.com>
Message-ID: <CABWPoFG2q8n27nSULRf1mh7ook=wSOJq1uw8xCTLcWmudEdo2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Made a patch here: https://github.com/deinok/buildroot/pull/1/files
If it looks good I will send it all joined as a .patch file.

Fixed all the issues except for:
Testing -> Do you have an example for testing a host package?


On Mon, Jan 11, 2021 at 12:50 PM Raul Hidalgo Caballero <deinok@deinok.com>
wrote:

> Yes, I'm agree. There is no perfect way, we should found an approach that
> is perfectly fitted in all cases.
>
> For now, having support for host-dotnet-sdk is a must in any case
>
>
>
> On Fri, Jan 8, 2021 at 1:02 PM Andrey Nechypurenko <andreynech@gmail.com>
> wrote:
>
>> Hi,
>>
>> > Regarding Andrey's patch, I'm not sure if that is the correct approach,
>> I
>> > mean, the idea is okay for most of the cases, but what if you install
>> the
>> > dotnet-runtime -> v5.0.0 and the package that you want to install needs
>> > v3.1.0 ?
>>
>> AFAIK, it is possible to have multiple runtimes installed. There are many
>> ways to say which one should be used by a particular application. One of
>> them, for example, using DOTNET_ENVIRONMENT environment variable (
>>
>> https://docs.microsoft.com/en-us/aspnet/core/fundamentals/environments?view=aspnetcore-5.0
>> ) . Also, AFAIK, if the application is packaged with runtime, it will use
>> this packaged version even if there is separate runtime installed.
>>
>> Anyway, I think there is no "right way" [tm]. It depends on the
>> application.
>> For example, in a well controlled environment such as an embedded system
>> where only a predefined set of applications is installed, common runtime
>> would be preferable because it saves a considerable amount of space if
>> multiple applications need it.
>>
>> Regards,
>> Andrey.
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210112/2d1d614b/attachment.html>
