From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 22:04:46 +0200
Subject: [Buildroot] [PATCH 1/2] lua: fix dynamic library install
In-Reply-To: <20180928173519.9731-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 Sep 2018 19:35:18 +0200")
References: <20180928173519.9731-1-fontaine.fabrice@gmail.com>
Message-ID: <875zyg17oh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In 0002-shared-libs-for-lua.patch, revision number is used to set
 > library name:
 > TO_SOLIB = liblua.so.$(R)

 > However, library is built using PKG_VERSION which is passed only during
 > build step:
 > $(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?

 > As a result, dynamic library is not installed in staging or target paths
 > since bump to lua 5.3.5

 > So, instead of replacing R by PKG_VERSION and passing this variable in
 > all steps, simply update R to 5

 > Fixes:
 >  - http://autobuild.buildroot.net/results/28b6672188bb0082ac1467d3b45904880e3634f3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
