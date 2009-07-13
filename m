From: Paul Archer <ptarcher@gmail.com>
Date: Mon, 13 Jul 2009 13:14:22 +1000
Subject: [Buildroot] [PATCH] Add support for custom post-build script
In-Reply-To: <45286.172.16.221.250.1247340894.squirrel@cvs.xtale.biz>
References: <45286.172.16.221.250.1247340894.squirrel@cvs.xtale.biz>
Message-ID: <56ea0bb80907122014r612a89c2j71b131a01dc83345@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I second the prototype example of a simple helloworld package.

On Sun, Jul 12, 2009 at 5:34 AM, <nfrench@xtale.biz> wrote:
> Thanks Daniel
>
> It would be nice to have a proto type package aka hello world for us first
> timers. As for me being able to build for two different platforms 32bit /
> 64bit is great feature of buildroot. At the moment we have been using lfs
> for 32 bit and 64 bit. Does a package have to have a network location for
> download as my prototype code / initial program ideas go through many
> revisions before they even get to that stage :-).
>
> Nick
>
>> On Fri, Jul 10, 2009 at 04:26:39PM -0000, nfrench at xtale.biz wrote:
>>> I am currently building my app using the tools in staging_dir to
>>> build my app then I mount the built ext2 from binaries cp my program on
>>> and build a new ext2
>>
>> This is exactly what I want to avoid. I know it is possible, but using
>> the post-build script method is faster, more logic and more straight
>> forward.
>>
>>> Is there a standard why to do this .ie
>>> this custom post-build
>>
>> Well, it's up to you what you do with that script. You'll be fed with
>> the target rootfs as $1 and could then do something like
>>
>> cp /path/to/your/hello $1/usr/bin/
>>
>> Or remove unwanted files etc. Up to you.
>>
>>> would it be possible to document how to
>>> add a simple Hello World app.? So that it gets built? with
>>> buildroot or have I missed somthing in the docs.
>>
>> No, don't confuse that. Your application will not be built by buildroot
>> by the post-build script.
>>
>> If you want to do that, you need to add your own package. See the
>> package/ folder how others do that. And if that package is building a
>> publically available project, please consider sending a patch back to
>> this list so everybody can benefit from it.
>>
>> Daniel
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
----
Regards
Paul Archer
ptarcher at gmail.com
