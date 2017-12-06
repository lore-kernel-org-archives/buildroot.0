From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:40:17 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: Add a patch for hosts without
 libz
In-Reply-To: <20171206144006.3282-1-johan.oudinet@gmail.com>
References: <20171206144006.3282-1-johan.oudinet@gmail.com>
Message-ID: <20171206234017.63b9ceb1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Dec 2017 15:40:06 +0100, Johan Oudinet wrote:
> Since commit 640c988fd4, erts/configure adds -lz to LIBS but
> this variable is also used in some Dynamic Erlang drivers. Fix
> Makefiles in such drivers to use the LDLIBS variable instead.
> 
> This patch has been reported upstream (see ERL-529) and should fix
> http://autobuild.buildroot.net/results/3a3/3a3b9a4568c706bd6caad3c63d356680c8405ac5/
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  ...-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/erlang/0004-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
