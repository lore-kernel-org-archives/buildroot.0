From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 5 Mar 2017 17:39:08 -0300
Subject: [Buildroot] [PATCH] chocolate-doom: bump to version 2.3.0
In-Reply-To: <20170305212528.2c2402bc@free-electrons.com>
References: <1488739214-32676-1-git-send-email-rprebello@gmail.com>
 <20170305212528.2c2402bc@free-electrons.com>
Message-ID: <CABLs7GWTJGbxg9z4cY01OT+FE4PHLqONUCaG1f5KSPzmqbQFyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not really. There's still one remaining patch
(0004-configure-Switch-to-pkg-config-macros.patch) which unfortunately
touches configure.ac. Only the ones which have been merged upstream
were removed.

The next chocolate-doom release (v3.0.0) will use SDL2, and that wil
include changes on the configure script to use pkg-config for finding
libraries, so we'll be able to get rid of that last remaining patch
when this version comes out. For now, however, v2.3.0 is the latest
stable release.

2017-03-05 17:25 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sun,  5 Mar 2017 15:40:14 -0300, Rodrigo Rebello wrote:
>> Also remove patches that have been merged upstream.
>>
>> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>> ---
>>  ...ruct-attribute-directive-ignored-warnings.patch | 49 -------------
>>  ...-configure-fix-with-PACKAGE-option-checks.patch | 67 ------------------
>>  ...se-of-ioperm-inb-outb-to-x86-architecture.patch | 80 ----------------------
>>  package/chocolate-doom/chocolate-doom.hash         |  2 +-
>>  package/chocolate-doom/chocolate-doom.mk           |  2 +-
>>  5 files changed, 2 insertions(+), 198 deletions(-)
>
> Since you're removing all patches, can we remove <pkg>_AUTORECONF = YES
> in the .mk file?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
