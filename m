From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 19 Apr 2017 14:13:52 +0100
Subject: [Buildroot] [PATCH v2 2/2] cmake: bump version to 3.8.0
In-Reply-To: <20170419143620.417bd7f3@free-electrons.com>
References: <20170419122411.53340-1-Vincent.Riera@imgtec.com>
 <20170419122411.53340-2-Vincent.Riera@imgtec.com>
 <20170419143620.417bd7f3@free-electrons.com>
Message-ID: <b5ca1ac0-a1ab-99b5-9afe-f0f0cbc8e010@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 19/04/17 13:36, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 19 Apr 2017 13:24:11 +0100, Vicente Olivert Riera wrote:
>> cmake depends on librhash, but host-cmake doesn't. This is because we
>> use the bundled dependencies for host-cmake but not for target.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Thanks for this update. Did you test building a large number of
> cmake-package packages of Buildroot with this new CMake version?

yes, I've tested with some of them:

~/git-clones/buildroot-1/output/build $ find . -maxdepth 2 -type f -name
"CMakeLists.txt" | cut -d'/' -f2
libuci-49ec6efbdac4819033d34f08927d795f83a3932d
bullet-2.85.1
cannelloni-20160414
tinyxml2-3.0.0
rabbitmq-c-v0.8.0
host-cmake-3.8.0
libssh-0.7.3
librtlsdr-v0.5.3
ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692
bctoolbox-0.4.0
taglib-1.11.1
jasper-2.0.12
yajl-2.1.0
cjson-v1.4.6
libiqrf-v0.1.2
yaml-cpp-0.5.2
libical-1.0.1
zlib-1.2.11
expat-2.2.0
cdrkit-1.1.11
libubox-723730214732862de7e892bae2f7a7889e66bf1b
uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82
exiv2-0.25

> 
> (Of course, to really test this, you need to uninstall your system-wide
> CMake, or at least make Buildroot believe it's not
> available/appropriate).

$ cmake
bash: /usr/bin/cmake: No such file or directory

Regards,

Vincent

> 
> Thanks!
> 
> Thomas
> 
