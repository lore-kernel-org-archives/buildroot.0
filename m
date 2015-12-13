From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:15:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/read-edid: Needs c++
In-Reply-To: <1449999343-6032-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449999343-6032-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213141509.17b78748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 10:35:43 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/8c1/8c11e463b68121fe0331acf9f8a42a1d3fef40c7//
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This is not the proper fix: there is no C++ code in this package. The
proper fix is to adjust CMakeLists.txt to remove the C++ check. This is
done by doing:

	project (read-edid C)

See https://cmake.org/cmake/help/v3.0/command/project.html for details,
and especially: "Optionally you can specify which languages your
project supports. Example languages are C, CXX (i.e. C++), Fortran,
etc. By default C and CXX are enabled if no language options are given."

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
