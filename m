From: Luciano Greiner <luciano.greiner@gmail.com>
Date: Wed, 8 Apr 2009 20:33:29 -0300
Subject: [Buildroot] Error while configuring QTOPIA 4
In-Reply-To: <37c712e0904081612u554e9a1cg2e355be21689bcc3@mail.gmail.com>
References: <26fbce020904081145x3966a6f2sb118941d363ccd86@mail.gmail.com>
	<87hc0zynp9.fsf@macbook.be.48ers.dk>
	<26fbce020904081531u63830ad1x8875d79a93511f59@mail.gmail.com>
	<37c712e0904081612u554e9a1cg2e355be21689bcc3@mail.gmail.com>
Message-ID: <26fbce020904081633m4802c5f0g11d1ebfbc071571e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, i meant CXX.

My CXX variable value is g++

Thanks

2009/4/8 Allan Clark <allanc@chickenandporn.com>:
> Hi Luciano;
> $(CC) isn't used.  $(CXX) is used in the code snippets:
>>        echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
> You might want to provide Peter and the list with that macro's value as
> well.  Knowing the value of $(CC) is not very useful.
> Allan
>
>
> On Wed, Apr 8, 2009 at 18:31, Luciano Greiner <luciano.greiner@gmail.com>
> wrote:
>>
>> > Strange, seems like is doesn't like:
>> >
>> > property.o: property.cpp project.h option.h
>> >        $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>> >
>> > Which looks perfectly fine. Could you change the line in
>> > qt-embedded-linux-opensource-src-4.5.0/qmake/Makefile to read:
>> >
>> > property.o: property.cpp project.h option.h
>> >        echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>> >        false
>> >
>> > And run make again?
>>
>> I couldn't edit qmake/Makefile because it is regenerated once
>> configured is executed.
>> Anyway i place an echo code to get $(CC) variable value before
>> qtopia.mk configure command, and it's value is g++
>>
>> $(CC) = g++.
>>
>> Thanks
>>
>> Luciano Greiner
>>
>>
>>
>> On Wed, Apr 8, 2009 at 4:01 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>> >>>>>> "Luciano" == Luciano Greiner <luciano.greiner@gmail.com> writes:
>> >
>> >  Luciano> Hello.
>> >  Luciano> I am using the trunk version of Buildroot. I am getting the
>> > following
>> >  Luciano> error while it's configuring QTOPIA 4:
>> >
>> >  Luciano> Creating qmake. Please wait...
>> >  Luciano> make[1]: Entering directory
>> >  Luciano>
>> > `/mnt/lfs/buildroot/build_i686/qt-embedded-linux-opensource-src-4.5.0/qmake'
>> >  Luciano> g++: @: No such file or directory
>> >  Luciano> make[1]: *** [property.o] Error 1
>> >
>> >  Luciano> Dows anyone know what may be wrong here?
>> >
>> > Strange, seems like is doesn't like:
>> >
>> > property.o: property.cpp project.h option.h
>> >        $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>> >
>> > Which looks perfectly fine. Could you change the line in
>> > qt-embedded-linux-opensource-src-4.5.0/qmake/Makefile to read:
>> >
>> > property.o: property.cpp project.h option.h
>> >        echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>> >        false
>> >
>> > And run make again?
>> >
>> > --
>> > Bye, Peter Korsgaard
>> >
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
> please, no proprietary attachments (http://tinyurl.com/cbgq)
> Sent from New York, NY, United States



-- 
Luciano Greiner
