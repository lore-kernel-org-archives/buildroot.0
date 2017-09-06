From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Wed,  6 Sep 2017 21:22:07 +0100
Subject: [Buildroot] Add wireguard package
Message-ID: <20170906202208.23404-1-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have multiple question about this patch.

  * Do we need to keep the manual call to depmod?
  * I did some king of metapackage containing two others, but if the user
    uncheck both those sub packages we are on an incorrect state.
    How can I fix this issue?
  * This package have a couple of kernel configs as dependencies.
    Should we force them in the kernel config? I don't know how to that... :)
    The kernel configs are:
      CONFIG_NET, CONFIG_INET, CONFIG_NET_UDP_TUNNEL,
      CONFIG_CRYPTO_BLKCIPHER, CONFIG_PADATA
