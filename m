From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 10:06:05 +0100
Subject: [Buildroot] [PATCH v3,
 2/6] package/gerbera: security bump to version 1.6.4
In-Reply-To: <CAPi7W80A9r5UuUQFuh5nLMKkgifP_KHFLEf0J749aNRouhmgtw@mail.gmail.com>
 (Fabrice Fontaine's message of "Fri, 29 Jan 2021 09:56:50 +0100")
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
 <20210125194949.1173139-2-fontaine.fabrice@gmail.com>
 <877dnw3mbn.fsf@dell.be.48ers.dk> <87a6ssywv9.fsf@dell.be.48ers.dk>
 <CAPi7W80A9r5UuUQFuh5nLMKkgifP_KHFLEf0J749aNRouhmgtw@mail.gmail.com>
Message-ID: <874kj0w1s2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> > Committed to 2020.02.x and 2020.11.x, thanks.
 >> 
 >> > I've also pulled the addition of the libnpupnp package for 2020.02.x.
 >> 
 >> Gerbera now unfortunately needs cmake 3.14+:
 >> 
 >> CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
 >> CMake 3.14 or higher is required.  You are running version 3.13.4
 >> 
 >> http://autobuild.buildroot.net/results/871/8717612ae32cc491b868f37fbbc960c16b562877/build-end.log
 >> 
 >> And we only require 3.10 on 2020.02.x / 2020.11.x. Any idea how to fix?
 > Unfortunately, I don't think there is an easy fix to remove this requirement.
 > gerbera requires cmake 3.14 since version 1.6.0 and
 > https://github.com/gerbera/gerbera/commit/0120e20cf4ae514de429e7f08d99a0a377f50553

 > The commit log specifies that they bumped CMake minimum to have
 > proper support for properties on imported targets as well as some Find modules.

 > We could retrieve upstream commit e5d582588904f6cacc7e4bf25104326e7b917e4d
 > to lower the dependency on cmake 3.13 but that won't help much.

Thanks for investigating. I guess the only pragmatic solution then is
the add a dependency for gerbera on host-cmake (3.15), and figure out a
way to use that for the build.

-- 
Bye, Peter Korsgaard
