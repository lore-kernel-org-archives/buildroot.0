From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 May 2015 13:43:53 +0200
Subject: [Buildroot] [PATCH] libsodium: new package
In-Reply-To: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
References: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <55587EF9.1010003@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

Le 17/05/2015 01:38, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/Config.in                |  1 +
>  package/libsodium/Config.in      |  6 ++++++
>  package/libsodium/libsodium.hash |  2 ++
>  package/libsodium/libsodium.mk   | 14 ++++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/libsodium/Config.in
>  create mode 100644 package/libsodium/libsodium.hash
>  create mode 100644 package/libsodium/libsodium.mk
> 

Since you are adding a new library, some packages will try to link with it.
As far I know, zeromq can link with libsodium, so a new dependency should be
added in a follow up patch.

There is even an upstream path to disable libsodium in zeromq:
https://github.com/zeromq/zeromq4-x/commit/faaf4550263395b84e6a80d3f9d7ba8816cdd714

Care to take a look ?

Best regards,
Romain
