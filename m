From: David Prime <david@primefarm.co.uk>
Date: Wed, 29 Nov 2006 17:52:18 -0000 (UTC)
Subject: [Buildroot] problem generating c++ compiler for target arch
In-Reply-To: <loom.20061129T184236-586@post.gmane.org>
References: <33335.80.176.236.13.1164224678.squirrel@mail.primefarm.co.uk>
	<20061122200213.GB1863@aon.at>
	<33446.80.176.236.13.1164226145.squirrel@mail.primefarm.co.uk>
	<20061122201834.GD1863@aon.at>
	<33518.80.176.236.13.1164226860.squirrel@mail.primefarm.co.uk>
	<loom.20061129T184236-586@post.gmane.org>
Message-ID: <27766.80.176.236.13.1164822738.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, November 29, 2006 5:45 pm, MikeW wrote:
> <lists@...> writes:
>
>
>>
>> OK,
>>
>>
>> I managed to get buildroot to complete the build at last. Sadly, the
>> c++ compiler is b0rked.
>>
>> Looks like it's missing all sorts of libraries and things. Here is some
>>  sample output trying to compile a very simple program (C++ hello
>> world):
>>
>>
>> david <at> tulip:~/buildroot/build_arm/staging_dir/bin$ ./arm-linux-gcc
>> foo.cpp /tmp/ccNH0d2c.o: In function `std::__verify_grouping(char
>> const*, unsigned int, std::basic_string<char, std::char_traits<char>,
>> std::allocator<char>
>>
>>> const&)':
>>>
>> foo.cpp:(.text+0x20): undefined reference to `std::basic_string<char,
>> std::char_traits<char>, std::allocator<char> >::size() const'
>> foo.cpp:(.text+0x98): undefined reference to `std::basic_string<char,
>> std::char_traits<char>, std::allocator<char> >::operator[](unsigned int)
>>  const'
> ...
>
>>
>> All sorts of things missing there - have I inadvertantly broken lots of
>>  buildroot?
>>
>> David
>>
>>
>
> Did you specify libstdc++ in your menuconfig ?


Yes of course, but it's failing mysteriously. It seems to get built but I
dunno where it breaks down after that, I've not much experience with this
compiler bootstrapping stuff.
