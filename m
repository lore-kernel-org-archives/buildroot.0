From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Sat, 11 Jul 2009 19:34:54 -0000 (Europe/London)
Subject: [Buildroot] [PATCH] Add support for custom post-build script
Message-ID: <45286.172.16.221.250.1247340894.squirrel@cvs.xtale.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Thanks Daniel

It would be nice to have a proto type package aka
hello world for us first timers. As for me being able to build for two
different platforms 32bit / 64bit is great feature of buildroot. At the
moment we have been using lfs for 32 bit and 64 bit. Does a package have
to have a network location for download as my prototype code / initial
program ideas go through many revisions before they even get to that stage
:-).

Nick

> On Fri, Jul 10, 2009 at 04:26:39PM
-0000, nfrench at xtale.biz wrote:
>> I am currently building my
app using the tools in staging_dir to
>> build my app then I
mount the built ext2 from binaries cp my program on
>> and
build a new ext2
> 
> This is exactly what I want to
avoid. I know it is possible, but using
> the post-build script
method is faster, more logic and more straight
> forward.
> 
>> Is there a standard why to do this .ie
>>
this custom post-build
> 
> Well, it's up to you what you
do with that script. You'll be fed with
> the target rootfs as $1
and could then do something like
> 
> 	cp
/path/to/your/hello $1/usr/bin/
> 
> Or remove unwanted
files etc. Up to you.
> 
>> would it be possible to
document how to
>> add a simple Hello World app.? So that
it gets built? with
>> buildroot or have I missed somthing
in the docs.
> 
> No, don't confuse that. Your application
will not be built by buildroot
> by the post-build script.
> 
> If you want to do that, you need to add your own
package. See the
> package/ folder how others do that. And if that
package is building a
> publically available project, please
consider sending a patch back to
> this list so everybody can
benefit from it.
> 
> Daniel
> 
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090711/8f5f01e8/attachment.htm>
