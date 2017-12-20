From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 22:31:45 +0100
Subject: [Buildroot] package "expat" fails to build without a C++
 compiler
In-Reply-To: <20171220205345.lxrjqnwcpclvcwvi@workotop.localdomain> (Damien
 Riegel's message of "Wed, 20 Dec 2017 15:53:45 -0500")
References: <20171219215831.4rlfcixr32ocr7tg@workotop.localdomain>
 <87r2rpcf5n.fsf@dell.be.48ers.dk>
 <20171220205345.lxrjqnwcpclvcwvi@workotop.localdomain>
Message-ID: <87vah19jcu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Riegel <damien.riegel@savoirfairelinux.com> writes:

 > On Wed, Dec 20, 2017 at 09:34:12PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Damien" == Damien Riegel <damien.riegel@savoirfairelinux.com> writes:
 >> 
 >> > Hi,
 >> > I tried to build an image with the "expat" package in it, using a
 >> > toolchain without a C++ compiler. It fails with the following error:
 >> 
 >> >   configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
 >> >   configure: error: C++ preprocessor "/lib/cpp" fails sanity check
 >> 
 >> > Enabling C++ support fixed that error.
 >> 
 >> Hmm, can you have a look in expat-2.2.4/config.log to see what exactly
 >> goes wrong?
 >> 
 >> /lib/cpp is from your host toolchain, so enabling or not enabling C++
 >> support shouldn't matter.

 > /lib/cpp is the default value for the C++ preprocessor when '$CXX -E'
 > fails. When activating C++ support, $CXX points to a program that is
 > actually there, and CXXCPP doesn't default to /lib/cpp. That's why it
 > builds successfully when I activate C++ support.

Ok. CXX actually also points to an available program when C++ support
isn't available (it points to 'false').

 > I guess you have /lib/cpp on your machine and I don't.

:/

Out of interest, what Distribution are you using?

 > I tried to remove the AC_PROG_CXX macro, but autoreconf complains that
 > there are C++ sources. They must be in a part of the program that isn't
 > built by Buildroot.

I guess that is from tests/runtestspp.cpp :/

-- 
Bye, Peter Korsgaard
