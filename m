From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:23:54 +0100
Subject: [Buildroot] [PATCH v3,
 2/6] package/gerbera: security bump to version 1.6.4
In-Reply-To: <877dnw3mbn.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 28 Jan 2021 20:15:08 +0100")
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
 <20210125194949.1173139-2-fontaine.fabrice@gmail.com>
 <877dnw3mbn.fsf@dell.be.48ers.dk>
Message-ID: <87a6ssywv9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> - This version is compatible with libupnp 1.14.x which fix
 >> CallStranger a.k.a. CVE-2020-12695
 >> - Drop all patches (already in version)
 >> - expat is not needed since version 1.5.0 and
 >> https://github.com/gerbera/gerbera/commit/a4f0cccd6a1f741c55ca69b06cff3a964eebc1f3
 >> - fmt is a mandatory dependency since version 1.5.0 and
 >> https://github.com/gerbera/gerbera/commit/fe81e5fc8898d6e3a53ce30ddaafb8439683f46f
 >> - spdlog is a mandatory dependency since version 1.5.0 and
 >> https://github.com/gerbera/gerbera/commit/615d698fe4dce9d7462022a00c74af1fac7a1003
 >> - pugixml is a mandatory dependency since version 1.5.0 and
 >> https://github.com/gerbera/gerbera/commit/c244006aa04ab2e4c5f3e7003ca727e05440238d
 >> - libnpupnp can be used instead of libupnp since version 1.6.2 and
 >> https://github.com/gerbera/gerbera/commit/e648763626e3c2512801bd127a0a3b96c8716faf
 >> - Set CXX_FILESYSTEM_NO_LINK_NEEDED to ON to avoid a build failure
 >> due to check_cxx_source_runs which has been added with
 >> https://github.com/gerbera/gerbera/commit/8ea0fce24ce9b1cf870837c3be984fed50581dfb
 >> - Update indentation in hash file (two spaces)

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> Changes v2 -> v3:
 >> - Bump to version 1.6.4 and add libnpupnp dependency

 > Committed to 2020.02.x and 2020.11.x, thanks.

 > I've also pulled the addition of the libnpupnp package for 2020.02.x.

Gerbera now unfortunately needs cmake 3.14+:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  CMake 3.14 or higher is required.  You are running version 3.13.4

http://autobuild.buildroot.net/results/871/8717612ae32cc491b868f37fbbc960c16b562877/build-end.log

And we only require 3.10 on 2020.02.x / 2020.11.x. Any idea how to fix?

-- 
Bye, Peter Korsgaard
