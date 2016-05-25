From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 23:49:35 +0200
Subject: [Buildroot] [PATCH 1/3] package/tinc: needs libdl for OpenSSL
 support
In-Reply-To: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160525234935.541a332b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 14:26:29 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d5b/d5b2f905d8da79cebda1408ffceac6d4c99f9e7b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tinc/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

It is somewhat weird that they decide that OpenSSL needs dlopen, while
it doesn't seem like it use it. But well, that's what tinc's configure
script has decided, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
