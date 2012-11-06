From: Vasanth Ragavendran <ragavendra.2007@gmail.com>
Date: Tue, 6 Nov 2012 14:48:39 +0800
Subject: [Buildroot] Build root local site method
In-Reply-To: <50984A5F.1060409@mind.be>
References: <CADfuMF4YnAPm_m6YbjO0oCYPJKxqgGwX9amz7SOXhRB3x3mewg@mail.gmail.com>
 <50984A5F.1060409@mind.be>
Message-ID: <CADfuMF4EHOgsdNJf89T9SvCSjgRC8Tr4Pk_O4TxHqehuxz1FPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks you so much Arnout. It works fine. My mistake. I hadn't looked into
the case sensitive feature. Thanks again!


On Tue, Nov 6, 2012 at 7:23 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 11/05/12 13:41, Vasanth Ragavendran wrote:
>
>> Hi
>>
>> This is with reference to the download method which is specified while
>> compiling a new package. I'm writing certain
>> programs which needs to be cross compiled and run in my embedded board.
>> In my <pkg>.mk file I'm specifying the 'site' to
>> the directory containing my source code and the 'site_method' to "local".
>> I've made necessary changes to the Config.in
>> files in all locations. I am able to select this package of mine from the
>> menuconfig, however the package refuses to
>> build for some unknown reason neither does the build print any errors. It
>> just quietly skips compiling this package and
>> finishes generating the file system. And the location which I'm pointing
>> to in the mk file contains the necessary source
>> code. I'm wondering what step I've skipped. Attaching the Config.in and
>> <pkg>.mk file which I've created for my package.
>> Kindly help as I'm struck in this and unable to proceed. I've referred to
>> the manual but unable to solve this issue.
>>
>
>  FTPCLIENT_INSTALL_TARGET should be YES, in capitals, else it will NOT
> install.
> (Actually, YES is the default so you can just remove that line).
>
>  Maybe we should check that _INSTALL_TARGET etc. are either YES or NO.  But
> I'm afraid that will make an empty make much slower again...  So maybe
> there
> should be a 'make ftpclient-wtf-is-wrong-with-**it' that does the checks
> :-)
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121106/c75c785f/attachment.html>
