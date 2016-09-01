From: Matt Flax <flatmax@flatmax.org>
Date: Thu, 1 Sep 2016 17:51:31 +1000
Subject: [Buildroot] Is there an equivalent of yocto's devshell?
In-Reply-To: <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
References: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
 <87a8fszmq7.fsf@dell.be.48ers.dk>
 <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
Message-ID: <8b51ea03-6172-ce10-9a80-7caf43952de1@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/09/16 17:20, Ottavio Campana wrote:
>>> Particularly, I am not able to find if buildroot offers a feature
>>> similar to the devshell of yocto. The devshell is a shell with all the
>>> environment variables already set, so that it is possibile to invoke
>>> commands such as make in the same way that the build process does. By
>>> working in the devshell, a developer can work already in the correct
>>> environment for cross-compiling, which can save a lot of time.
>>> Does something similar to the devshell exist in buildroot?
>> I have never used this 'devshell', but I take it that it is something
>> that adds the cross compiler to the path and possibly sets up some
>> environment variables like CC/CXX/CROSS_COMPILE/ARCH to point to the
>> cross compiler?
>>
>> If so, we don't have anything quite like that, but writing a little
>> shell script for your project adding output/host/usr/bin to your path
>> and exporting those environment variables shouldn't take many minutes.
>>
>> Or does it do something more special than that?
> Well, le'ts say that it configures the not only the cross compiler but it also sets all the variables for pointing to the staging environment for finding includes and linking to libraries. Compiling a self contained program is trivial, but when you need to include different libraries things start to be more difficult.
>
> I can write the script, but can you tell my where I can find all the variables that are set by buildroot before compiling a package?
>
You can find that information out by echoing env at some point in the 
package build process.

Is it necessary to have a devshell ? Could you simply run 'make package' 
instead and work live in the output/build/package directory ?
You can rerun various parts of the make process by deleting the .stamp_* 
files in the package directory.

Conceptually if you build the package you are working on natively on 
your desktop, you should be able to do all the library inclusion and 
linking locally ... once happy, you can simply invoke buildroot to cross 
compile for you ... I would imagine that that would be a much faster way 
top develop ...

Matt
