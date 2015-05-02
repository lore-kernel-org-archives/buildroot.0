From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 14:25:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fix strerror_l related
 compile error
In-Reply-To: <1430563403-22945-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430563403-22945-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150502142514.2304411c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  2 May 2015 12:43:23 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/ae3/ae31f4585d2c2f850473c446f1ccfba7699c711b/
> http://autobuild.buildroot.net/results/504/504cf78a08315e2fc6eaeb9a29ae791972753830/
> http://autobuild.buildroot.net/results/092/09280c5d63da9b8b58916c32e6040a98f7ff0ee8/
> http://autobuild.buildroot.net/results/da6/da62d97ea060ce03db94f59a91d84a235d03e8f0/
> http://autobuild.buildroot.net/results/7a4/7a40f66b3be8cd71a27df04415c4851cd4426cc3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0007-strerror.patch |   41 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/vlc/0007-strerror.patch

I think you should add the explanation to the commit log as to why
strerror_l() is not available. glibc implements it, but not uClibc.
However it is available on musl.

So a better fix would be to add a configure.ac check for strerror_l().
Maybe such a fix would be acceptable upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
