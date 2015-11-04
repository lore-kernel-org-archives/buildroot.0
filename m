From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 18:41:39 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libdcadec: enable shared
 build
In-Reply-To: <1445279931-18041-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445279931-18041-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151104184139.55c7e6ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 19 Oct 2015 20:38:51 +0200, Bernd Kuhls wrote:
> The libdcadec package currently only builds a static library, which is
> naturally built without -fPIC (since this is generally not needed for
> static libraries).
> 
> However, when the generated static library gets used inside a larger
> dynamic library, such as ffmpeg's one, the link fails, since we're
> trying to include in a shared library non-PIC code.
> 
> To solve this, this commit changes the way the libdcadec library is
> built to make sure a shared variant of the library gets built when
> appropriate. This way, ffmpeg has a PIC-enabled libdcadec library to
> link with.
> 
> Fixes
> http://autobuild.buildroot.net/results/bd3/bd34d1d2f2d35455d1ddefa1ec247c78f341603f/
> http://autobuild.buildroot.net/results/4f7/4f7c87e47e763ce656c50b5862408b18e6f185ab/
> http://autobuild.buildroot.net/results/998/99836db091af610a99dbc815b7fdf09cc1d531d1/
> http://autobuild.buildroot.net/results/a19/a19023e094cbed491444665d6839a9e65a8eee6c/
> http://autobuild.buildroot.net/results/98d/98dde028d1d6199f05c904b498bc39bbaa112aa6/
> http://autobuild.buildroot.net/results/4ff/4ffcae6cae419df35e8ca29d429ee178bcf31882/
> http://autobuild.buildroot.net/results/8ce/8ced16874255ace4923f6b8888c3fca07f28b804/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: pasted patch description from Thomas,
>     changed static libs detection (Thomas)
> v2: removed -fPIC for static build (Thomas, Samuel)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
