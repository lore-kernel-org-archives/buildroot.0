From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:00:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/taglib: add upstream patch to
 fix taglib-config
In-Reply-To: <20190610212023.9483-2-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 10 Jun 2019 23:20:22 +0200")
References: <20190610212023.9483-1-joerg.krause@embedded.rocks>
 <20190610212023.9483-2-joerg.krause@embedded.rocks>
Message-ID: <87imswaufy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > The current taglib-config program does not work when cross-compiling as it only
 > returns paths to the host, which breaks building programs which link against
 > taglib.

 > For example gerbera uses `taglib-config` and it fails with:

 > ```
 > [..]
 > -- Found TagLib: -L/usr/lib -ltag
 > [..]
 > arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
 > ```

 > Before the patch the output of `taglib-config` is:
 > ```
 > $ ./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/taglib-config --libs
 > -L/usr/lib -ltag
 > ```

 > Add a patch from upstream which fixes taglib-config.

 > After applying the fix, the pkg-config file is correct:
 > ```
 > $ ./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/taglib-config --libs
 > -L/home/joerg/Development/git/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -ltag
 > ```

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
