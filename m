From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 16:13:46 +0100
Subject: [Buildroot] [PATCH 1/1] set minimum cmake version to 3.10
In-Reply-To: <20200203142738.1558715-1-aduskett@gmail.com> (Adam Duskett's
 message of "Mon, 3 Feb 2020 06:27:38 -0800")
References: <20200203142738.1558715-1-aduskett@gmail.com>
Message-ID: <878slj3dqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > The CMakeLists.txt file uses the CMP0091 which is an MSVC runtime library flag
 > abstraction macro.

 > Because we are not building ninja for Microsoft, it is safe to remove this
 > macro and set the minimum version to 3.10.

There's unfortunately still another issue:

http://autobuild.buildroot.net/results/615/6150430d396b74a81be87d942ca571c7c15dfc52/build-end.log

CMakeLists.txt hardcodes -fdiagnostic-color, which is only supported
from gcc 4.9, breaking builds on old autobuilders:

https://gcc.gnu.org/gcc-4.9/changes.html

We don't really care about coloured error messages, so I guess we can
just patch away that line.

Care to send a patch doing that?

-- 
Bye, Peter Korsgaard
