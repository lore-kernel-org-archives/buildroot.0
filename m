From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Apr 2009 21:01:22 +0200
Subject: [Buildroot] Error while configuring QTOPIA 4
In-Reply-To: <26fbce020904081145x3966a6f2sb118941d363ccd86@mail.gmail.com>
	(Luciano Greiner's message of "Wed\, 8 Apr 2009 15\:45\:37 -0300")
References: <26fbce020904081145x3966a6f2sb118941d363ccd86@mail.gmail.com>
Message-ID: <87hc0zynp9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luciano" == Luciano Greiner <luciano.greiner@gmail.com> writes:

 Luciano> Hello.
 Luciano> I am using the trunk version of Buildroot. I am getting the following
 Luciano> error while it's configuring QTOPIA 4:

 Luciano> Creating qmake. Please wait...
 Luciano> make[1]: Entering directory
 Luciano> `/mnt/lfs/buildroot/build_i686/qt-embedded-linux-opensource-src-4.5.0/qmake'
 Luciano> g++: @: No such file or directory
 Luciano> make[1]: *** [property.o] Error 1

 Luciano> Dows anyone know what may be wrong here?

Strange, seems like is doesn't like:

property.o: property.cpp project.h option.h
        $(CXX) -c -o $@ $(CXXFLAGS) property.cpp

Which looks perfectly fine. Could you change the line in
qt-embedded-linux-opensource-src-4.5.0/qmake/Makefile to read:

property.o: property.cpp project.h option.h
        echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
        false

And run make again?

-- 
Bye, Peter Korsgaard
