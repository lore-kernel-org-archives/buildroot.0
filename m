From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 11 Jun 2020 21:14:04 +0300
Subject: [Buildroot] [PATCH 1/1] python-pybind: new package
In-Reply-To: <20200610225523.5bc2d13b@windsurf.home>
References: <20200608213043.3443-1-guillaume.bressaix@gmail.com>
 <20200610225523.5bc2d13b@windsurf.home>
Message-ID: <CALFsTFXhvaq-sgWkHEk=gzOQTgDjbhKzNwOTVfrBiTT1Hqq40Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm not sure pybind11 is just a "regular" python package.
First, it needs C++11 so we have to make sure the toolchain supports
that in order to be able to actually compile the generated pybind11
code.
Secondly, the installation through setup.py just installs the pybind11
headers and it doesn't give any way for C++ projects to locate the
package. For example, this project won't find pybind11 because it uses
find_package(pybind11...) in it's CMakeLists.txt:
https://github.com/pybind/pybind11_json. The installation of pybind11
using CMake gives a solution to this problem.

Those considerations have been taken into account in a previous patch
I sent to the mailing list few weeks ago:
https://patchwork.ozlabs.org/project/buildroot/patch/20200513183903.8656-1-asafka7 at gmail.com/

Regards,
Asaf.
