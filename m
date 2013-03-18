From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 23:11:28 +0100
Subject: [Buildroot] [PATCH 5/6] package/genpart: new host-only package
In-Reply-To: <df62482b9becf843f11526c5c8117ff6a4043d56.1363544331.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 17 Mar 2013 19:19:44 +0100")
References: <cover.1363544331.git.yann.morin.1998@free.fr>
 <cover.1363544331.git.yann.morin.1998@free.fr>
 <df62482b9becf843f11526c5c8117ff6a4043d56.1363544331.git.yann.morin.1998@free.fr>
Message-ID: <87vc8owe7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Yann> ---
 Yann> Changes v1 -> v2:
 Yann>   - add due note about potential licensing issue (Thomas)
 Yann> ---
 Yann>  package/Config.in.host                        |    1 +
 Yann>  package/genpart/Config.in.host                |    8 ++++++++
 Yann>  package/genpart/genpart-fix-return-code.patch |   25 +++++++++++++++++++++++++
 Yann>  package/genpart/genpart.mk                    |   18 ++++++++++++++++++
 Yann>  4 files changed, 52 insertions(+), 0 deletions(-)
 Yann>  create mode 100644 package/genpart/Config.in.host
 Yann>  create mode 100644 package/genpart/genpart-fix-return-code.patch
 Yann>  create mode 100644 package/genpart/genpart.mk

 Yann> diff --git a/package/genpart/genpart-fix-return-code.patch b/package/genpart/genpart-fix-return-code.patch
 Yann> new file mode 100644
 Yann> index 0000000..ec18c82
 Yann> --- /dev/null
 Yann> +++ b/package/genpart/genpart-fix-return-code.patch
 Yann> @@ -0,0 +1,25 @@
 Yann> +genpart: return 0 if partition writen OK, with no do_magic
 Yann> +
 Yann> +If do_magic is false, we don't won't write the 0xaa55 magic.

s/don't//

Committed, thanks.

-- 
Bye, Peter Korsgaard
