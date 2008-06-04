From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 4 Jun 2008 11:11:42 -0300
Subject: [Buildroot] root fs
In-Reply-To: <2590773a0806031759j7ea229e6l797fd9250c6f3243@mail.gmail.com>
References: <2590773a0806031618y36f52acdub806d896da6ad0ae@mail.gmail.com>
	<6306c640806031730n7b1a0ffayece31eb66d657615@mail.gmail.com>
	<326f33790806031753o781d8638l804bbbf9da3001ec@mail.gmail.com>
	<2590773a0806031759j7ea229e6l797fd9250c6f3243@mail.gmail.com>
Message-ID: <d6cda7730806040711j4cd573ej2001550ff6bc26a2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What I do is rm -rf build_* toolchain_* binaries project_*

Except for the config, this pretty much resets everything back to
checkout state.

On Tue, Jun 3, 2008 at 9:59 PM, Christopher Taylor <chtaylo3@gmail.com> wrote:
> Yeah, I was trying to avoid a make clean/ make distclean ....
>
> I appreciate your assistance!
>
> -Chris
>
> On Tue, Jun 3, 2008 at 8:53 PM, Arun Reddy <reddyac@gmail.com> wrote:
>> Hi Chris,
>>
>> You can also try ensuring you're doing a completely clean build by doing the
>> following within the main Buildroot directory:
>>
>> make clean
>> make distclean
>> make menuconfig (your settings will still be there, but you want to exit
>> right away so the Config.input file gets created)
>> make
>>
>> Make sure you have some time on your hands before doing this though.
>>
>> On Tue, Jun 3, 2008 at 5:30 PM, Ram kumar <ramkumar.research@gmail.com>
>> wrote:
>>>
>>> hi,
>>>      you can try this http://www.linuxfromscratch.org/lfs/ . i have not
>>> tried..i think it describes all the steps including handcrafting the
>>> filesystem.But make sure whether it is worth scratching your head for
>>> building the file system from the scratch.
>>>
>>> Regards,
>>> Ram
>>>
>>> On Tue, Jun 3, 2008 at 4:18 PM, Christopher Taylor <chtaylo3@gmail.com>
>>> wrote:
>>>>
>>>> Does anyone know how to get the root fs to be built from scratch?  I
>>>> deleted it with a make clean in buildroot and now some of the files
>>>> aren't installing into the root dir; most notably: /etc/passwd,
>>>> /etc/shadow, and /usr/share/udhcpd/default.script
>>>>
>>>> There are probably a few others so instead of hunting them down I'd
>>>> like to try and get BR/BB to install them over again.
>>>>
>>>> Any help appreciated!
>>>>
>>>> -Chris
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at uclibc.org
>>>> http://busybox.net/mailman/listinfo/buildroot
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at uclibc.org
>>> http://busybox.net/mailman/listinfo/buildroot
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
