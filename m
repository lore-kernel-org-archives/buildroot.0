From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 10:01:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 10.6.0
In-Reply-To: <1434393117-14293-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434393117-14293-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150621100118.7f16c492@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 15 Jun 2015 20:31:57 +0200, Bernd Kuhls wrote:
> Mesa3d 10.6 adds optional support for SHA-1:
> http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?id=a24bdce46f95cbe9efd3b26f157d1eb36584861f
> 
> Adding "--without-sha1" will cause this failure during configure:
> 
> configure: error: Illegal value for --with-sha1: no
> 
> so I did not add the else-clause when no SHA-1 provider is enabled.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk |    2 +-
>  package/mesa3d/mesa3d.hash               |    4 ++--
>  package/mesa3d/mesa3d.mk                 |   12 +++++++++++-
>  3 files changed, 14 insertions(+), 4 deletions(-)

Applied after simplifying the else ifeq test. Instead of:

ifeq ...
....
else
ifeq ...
...
endif
endif

You can do:

ifeq ...
...
else ifeq ...
... 
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
