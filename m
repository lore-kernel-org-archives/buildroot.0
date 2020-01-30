From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2020 11:35:37 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/libmodsecurity: new package
In-Reply-To: <20200130095629.18339-1-frank.vanbever@essensium.com> (Frank
 Vanbever's message of "Thu, 30 Jan 2020 10:56:28 +0100")
References: <20200120123310.29892-1-frank.vanbever@essensium.com>
 <20200130095629.18339-1-frank.vanbever@essensium.com>
Message-ID: <87r1zh8c5i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Vanbever <frank.vanbever@essensium.com> writes:

 > The dependency on !BR2_STATIC_LIBS is due to missing Libs.private in the
 > libmodconfig pkg-config file making builds that statically link against
 > libmodsecurity fail.

 > Lua is disabled due to using the host libraries.
 > Yajl is disabled as enabling it forces the tests to be built. These tests have a
 > hard dependency on libmodsecurity.a which is not built when --disable-static is
 > used in the configuration. There is no flag to disable these tests.

 > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
 > ---
 > Changes v2 -> v3: nothing
 > Changes v1 -> v2:
 > - bump version to 3.0.4
 > - fix URL
 > - Move menu entry to Libraries/Networking
 > - Add reconf comment
 > - Coding style fixes
 > - cleaned up CONF_OPTS
 > - Add explicit C++ & static dependency
 > - Explicitly disabled unavailable dependencies
 > - Explicitly disabled Yajl and Lua
 > - Cleaned up dependencies

Committed, thanks.

-- 
Bye, Peter Korsgaard
