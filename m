From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sun, 12 Feb 2017 16:36:02 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170212151431.1fe6cce3@free-electrons.com>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212151431.1fe6cce3@free-electrons.com>
Message-ID: <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 12.02.2017 15:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 12 Feb 2017 03:04:44 +0100, Marcus Hoffmann wrote:
>> Drop both patches since they are included upstream.
>> We don't need to autoreconf now.
>>
>> Note: classpath 0.99 has a bug in it's autoconf scripts, such that
>> configure always fails when specifying --disable-tools[1].
>> We enable these for now.
>>
>> Also explicitly disable GJDoc generation, as this defaults to on now.
>> --disable-plugin is not needed any more, since this is now the default.
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70660
>>
>> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
>> ---
>> Changes v2 -> v3:
>>   - Fixed announcement url in .hash file (This time for real...)
>>   - Clarify dropping the --disable-plugin option.
> 
> Applied to next, thanks. I have two comments though:
> 
>  1. If you're using/interested in classpath, would you mind adding your
>     name in the DEVELOPERS file for this package? Same if you're
>     using/interested in jamvm. Those two packages are currently not
>     associated to any developer, it would be nice to have a developer
>     interested in those two packages.
I don't know, we are looking into jamvm/classpath but haven't decided on
a Java VM/class library yet. For now I would wait a while until there is
a decision if we'll be using those packages.

> 
>  2. classpath has a "depends on BR2_PACKAGE_JAMVM" and jamvm has a
>     "select BR2_PACKAGE_CLASSPATH" which feels a bit like a circular
>     dependency. It would be nice to fix that up as well.

What would be the preferred solution here? JamVM selecting classpath
seems fine, as long as there is no alternative class library in
buildroot. So we allow selecting classpath but not JamVM? Here is a list
of projects using gnu classpath:
https://www.gnu.org/software/classpath/stories.html#jvm

But if you explicitly select the gnu classpath library then you probably
know why you want it, right?

I can send a patch changing that.

> 
> Thanks a lot!
> 
> Thomas
> 

Marcus
