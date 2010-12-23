From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 23 Dec 2010 09:46:12 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
	CMake packages
In-Reply-To: <20101223084644.018fa724@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTinkazQ2EzvCE46nSYmAkGiEJ3Ti+oM6=7g+u0Y5@mail.gmail.com>
	<AANLkTi=tmgB5T23WvH112P1YgrO-w+xjwtiU9=D01J90@mail.gmail.com>
	<AANLkTi=frxyYAzAaApiwAfxairhSKe38qkBgvk633_eF@mail.gmail.com>
	<20101223084644.018fa724@surf>
Message-ID: <AANLkTinpJpLVjV7ogcT35GcX6RPfpG66k0hGQEkyfSko@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 23 December 2010 08:46, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 22 Dec 2010 22:34:17 +0100
> Samuel Martin <s.martin49@gmail.com> wrote:
>
>> srctree:
>> ? output/build/cdrkit-1.1.10
>> buildtree:
>> ? output/build/cdrkit-1.1.10/build
>> Like this, we keep only one directory per package and don't mess up the
>> source tree.
>> Whatever, both solutions are good. For me, it's not a big deal, but maybe BR
>> leaders will prefer one or the other solution to keep it consistent.
>
> I agree.

I actually chose to build in SRCDIR for the sake of consistency - autotools
packages build in SRCDIR :-)

What if a package already has a build/ dir inside of its source tree?
Maybe a bit safer
if we call the build dir _cmake_build/ or something? I'll introduce a
$(2)_BUILDDIR
variable in the next patch series and point it to a build dir inside
the source tree.

Best regards,
Bj?rn Forsman
