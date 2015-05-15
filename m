From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Fri, 15 May 2015 12:05:25 +0100
Subject: [Buildroot] Generating Debug Info Files
In-Reply-To: <20150514215914.10e83cad@free-electrons.com>
References: <00b501d08d9b$87eae570$97c0b050$@osullivan@cloudiumsystems.com>
 <20150514215914.10e83cad@free-electrons.com>
Message-ID: <5555D2F5.80308@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thanks for your reply, I already have debugging symbols on for the test 
application running on my target but perf still complains:
Failed to open test_application, continuing without symbols

The file has symbols and is not stripped and gdb has no problem finding 
the symbols so I think the issue is that perf is expecting to find the 
symbols in some separate file, its difficult to get clarity on this but 
I believe that in Ubuntu you would install a debug package, I believe 
this installs separate files with symbol information in certain 
locations like for example /usr/lib/.debug for libraries.
I was going to try and do something similar with my buildroot file 
system to see if it resolved the perf problem.

regards
John

On 14/05/15 20:59, Thomas Petazzoni wrote:

> Dear John OSullivan,
>
> On Wed, 13 May 2015 17:40:31 +0100, John OSullivan wrote:
>
>> When I run perf on my buildroot based system it complains about missing
>> symbols for my libraries and applications. I know it is possible to generate
>> binaries with symbolic information in the staging area by selecting 'build
>> packages with debugging symbols', but is there any way of generating
>> separate .debug type files or do I need to do this in postBuild with a
>> script based on objcopy.
> No, we don't have support for separate .debug files currently.
>
> But how would it work exactly, since perf is running on the target?
>
> Don't you simply need to have debugging symbols on the target? If
> that's the case, you can simply do BR2_ENABLE_DEBUG=y and
> BR2_strip_none=y.
>
> Best regards,
>
> Thomas
