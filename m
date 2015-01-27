From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 13:52:20 +0100
Subject: [Buildroot] [PATCH] alsa-utils: needs dynamic library support
In-Reply-To: <27b7692b7892024566e160a09c2d49df8cb3481c.1422354073.git.baruch@tkos.co.il>
References: <27b7692b7892024566e160a09c2d49df8cb3481c.1422354073.git.baruch@tkos.co.il>
Message-ID: <20150127135220.7832b906@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 27 Jan 2015 12:21:13 +0200, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/314/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
> http://autobuild.buildroot.net/results/964/964e44f0c1653370600c7e8c647abda3f6380e34/
> http://autobuild.buildroot.net/results/d72/d72f31bab907c7485d03db4597d01fd759277db4/
> ...
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/alsa-utils/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I am not sure. alsa-utils hardcodes:

ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"

but in practice, alsa-lib does not necessarily depends on -ldl.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
