From: hartleys <hartleys@visionengravers.com>
Date: Tue, 2 Sep 2008 14:15:50 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	gamesgames/ace_of_penguins games/gnuch etc...
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909812D2F@mi8nycmail19.Mi8.com>
References: <20080829132737.BF3503C864@busybox.net><20080829153841.37df370c@atmel.com><BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com><19223815.post@talk.nabble.com><COL102-DS131551BA49AC350CABE3EFDC630@phx.gbl><19250901.post@talk.nabble.com>
	<BD79186B4FD85F4B8E60E381CAEE1909812D2F@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909812D51@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tuesday, September 02, 2008 10:49 AM, hartleys wrote:
>> I have just tried to patch various games packages and java ones jamvm

>> (packages/java/jamvm) works fine patch-version and patch-version.arch

>> work
>>
>> ace_of_penguins - the libtool patch fails I think this a fault with 
>> libtool patch not the dir move lxdoom - patch target works rubix - 
>> patch target works gnuchess - patch target works vice - patch target 
>> works
>>
>> So I think the move is fine and that the issues are with making the 
>> libtool patch apply to more targets Daniel Laird
>
> Daniel, I still don't see how the patches can be applied correctly
with
> the current rule in Makefile.autotools.in.

Dumb, dumb, dumb.... Ok. I get how the patches are installed...

In the comments at the top of Makefile.autotools.in there is an example
of the AUTOTARGETS call:

$(eval $(call AUTOTARGETS,foo))

At some point another argument was added to the call:

$(eval $(call AUTOTARGETS,package_dir,foo))

This is explained later in the file but I missed it. For the package I
was trying to patch/build in a subdirectory of package/customize I had
the package_dir argument set wrong. After I chaged it my source does get
patched correctly.

> I tried to test it this morning by building one of the games packages
> (gnuchess) and it never even gets processed. I think there needs to be
> a games.mk in package/games that does a:
>
> include package/games/*/*.mk

BTW, as far as I can tell this is still needed to get any of the games
to build.
