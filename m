From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:05:09 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with python and
 cmake <= 3.7
In-Reply-To: <20181128235633.10449-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 29 Nov 2018 00:56:33 +0100")
References: <20181128235633.10449-1-fontaine.fabrice@gmail.com>
Message-ID: <87o9a22rmy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > domoticz will fail to build with python and older cmake
 > Indeed, find_package(PythonLibs 3.4) will not recognize python 3.7 until
 > cmake 3.7 and the following commit:
 > https://github.com/Kitware/CMake/commit/c31573b9641e0f1bc7a34149506db51f3494323b

 > To fix this, add a call to find_package(PythonInterp). Indeed, if
 > FindPythonInterp has already found the major and minor version, that
 > version will be inserted between the user supplied versions and the
 > stock version list since cmake in version 3.1 and
 > https://github.com/Kitware/CMake/commit/3816cd2dc7a7cc220e4f1b1e87fee986545b9cb3

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8e82501a7b49da628ec026132ffca44c0c813040

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
