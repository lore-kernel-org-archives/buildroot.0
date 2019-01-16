From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:21:27 +0100
Subject: [Buildroot] [PATCH] package/supertux: needs gcc >= 6
In-Reply-To: <20181229123120.30803-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 29 Dec 2018 13:31:20 +0100")
References: <20181229123120.30803-1-romain.naour@gmail.com>
Message-ID: <87won49wvs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The initial build issue [1] has been fixed upstream but the supertux
 > fail to link with boost libraries when using gcc 5 (which use C++11 by default):

 > libsupertux2_lib.a(main.cpp.o): In function `boost::system::error_category::std_category::equivalent(std::error_code const&, int) const':
 > main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei[_ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei]+0x32): undefined reference to `boost::system::detail::generic_category_instance'
 > main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei[_ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei]+0x47): undefined reference to `boost::system::detail::generic_category_instance'
 > main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei[_ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei]+0x99): undefined reference to `boost::system::detail::generic_category_instance'
 > libsupertux2_lib.a(main.cpp.o): In function `boost::system::error_category::std_category::equivalent(int, std::error_condition const&) const':
 > main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition[_ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition]+0x33): undefined reference to `boost::system::detail::generic_category_instance'
 > main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition[_ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition]+0x48): undefined reference to `boost::system::detail::generic_category_instance'
 > collect2: error: ld returned 1 exit status

 > This is a similar issue as the one reported by [2].

 > With gcc 5, boost libraries are compiled using C++11 but
 > supertux2_lib.a is using C++14 standard.

 > To fix the issue, boost libraries should be build using C++14
 > standard but we currently don't have an option to "force" the
 > default C++ standard used by the compiler.

 > So bump the minimum gcc version to gcc 6 since the C++14 is
 > used by default.

 > [1] https://github.com/SuperTux/supertux/issues/1014
 > [2] https://github.com/boostorg/system/issues/26

 > Fixes:
 > http://autobuild.buildroot.net/results/5b4/5b452c155917d783b3d8167fde48c2c938a74b95

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
