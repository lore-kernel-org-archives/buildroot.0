From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Oct 2014 14:47:52 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-24
In-Reply-To: <20141025063015.AC1771011CB@stock.ovh.net>
References: <20141025063015.AC1771011CB@stock.ovh.net>
Message-ID: <CAMo8BfLG1rHMWQgsL=t=zW8mnWDqQ-Efzzo=M1rsx45fx9sq_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 25, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-10-24
>       xtensa | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/3236ddfe8eaf89f05f84db60eb42583cca397464/

Fails with

Linking C executable winpr-hash
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `powl'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `fmodl'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `ceill'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `log10l'
../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `floorl'

because long double math is not enabled in xtensa uclibc. I'll send a patch.

>       xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/

Fails with

/usr/bin/make -j4 -C
/home/test/autobuild/instance-1/output/build/schifra-0.0.1
COMPILER="/home/test/autobuild/instance-1/output/host/usr/bin/xtensa-buildroot-linux-uclibc-g++"
OPTIONS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals -pipe -Os
-o" all
make[1]: Entering directory
`/home/test/autobuild/instance-1/output/build/schifra-0.0.1'
/home/test/autobuild/instance-1/output/host/usr/bin/xtensa-buildroot-linux-uclibc-g++
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mlongcalls -mtext-section-literals -pipe -Os   -o -o
schifra_reed_solomon_codec_validation
schifra_reed_solomon_codec_validation.cpp -lstdc++ -lm
xtensa-buildroot-linux-uclibc-g++: error:
schifra_reed_solomon_codec_validation: No such file or directory

note -o -o schifra_reed_solomon_codec_validation in the command line.
Couldn't reproduce, looks like there's something in the environment
variables on the build host.

-- 
Thanks.
-- Max
