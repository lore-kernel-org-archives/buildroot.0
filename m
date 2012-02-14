From: Johannes Teiwes <jteiwes@informatik.uni-bremen.de>
Date: Tue, 14 Feb 2012 17:31:31 +0100
Subject: [Buildroot] porting libffi to microblaze architecture
In-Reply-To: <CAFbHwiQUgxhuLb0VVPDs61kFQh9Gd6kPPHqEGFM8EfTzLEqmNg@mail.gmail.com>
References: <1A377131-99F1-49A3-942A-98679A105DBA@informatik.uni-bremen.de>
 <CAFbHwiQUgxhuLb0VVPDs61kFQh9Gd6kPPHqEGFM8EfTzLEqmNg@mail.gmail.com>
Message-ID: <5F4AD199-4A38-49C5-9119-129532C216D5@informatik.uni-bremen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 26.01.2012 um 20:15 schrieb Will Newton:

> On Thu, Jan 26, 2012 at 6:19 PM, Johannes Teiwes
> <jteiwes@informatik.uni-bremen.de> wrote:
>> Hey fellow buildroot contributors,
>> 
>> (Sorry for posting a similar request again - i could not find the original
>> thread)
>> 
>> I am trying to run python on a microblaze-based SoC. The Systems
>> configuration and creation is currently done using buildroot for
>> cross-compiling and package selection (which works like a charm).
>> The problem still remains that libffi (one of pythons dependencies) has not
>> been ported to the Microblaze architecture. We have an existing software
>> framework written in python, which should run on that processor - so python
>> is mandatory for me.
>> 
>> Can anybody point me to the right spots inside the libffi configuration or
>> code to adjust some parameters in order to compile that library for the
>> microblaze processor? What is the exact difficulty when porting this library
>> to a different machine?
>> 
>> One possible problem i would see is that the Microblaze CPU is some kind of
>> a moving target, since it can be configured in many ways (MMU/NOMMU,
>> HARDFPU/SOFTFPU/NOFPU etc.) so one could then only target one specific
>> configuration.
>> 
>> So i am thankful for any help, recipes for porting software or any advice,
>> you can give me.
> 
> libffi is an implementation of the calling convention on an
> architecture, so it has to be able to take a list of arguments and
> convert it into a call frame and vice versa. It's quite tricky code to
> write but only a few hundred lines or so, if you are familiar with
> your architecture's calling convention it shouldn't be too hard.
> 
> However I believe Python only needs libffi for the ctypes module so it
> may be possible to hack the build to avoid this dependency.

I managed to adjust the configure/build setting of python so that ctypes/libffi
libraries are not included in the python build. This seem to work out so i now 
have python running on microblaze (it is quite slow though).

Thanks for the suggestion!

Kind regards,
Johannes Teiwes

--
Johannes Teiwes - jteiwes at tzi.de



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120214/92bf79a3/attachment.html>
