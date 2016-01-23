From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 Jan 2016 23:50:15 +0200
Subject: [Buildroot] [PATCH 1/2] vboot-utils: convert to Git formatted
 patches
In-Reply-To: <20160123131151.1dca8d7d@free-electrons.com>
References: <1453410610-12040-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160123131151.1dca8d7d@free-electrons.com>
Message-ID: <20160123215015.GA27966@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sat, Jan 23, 2016 at 01:11:51PM +0100, Thomas Petazzoni wrote:

> Despite the absence of review/ack, I've applied those two patches since
> they fix a very frequent build failure (#1 failure in today's report).

Since it was probably me who should have at least tried it:
the package builds and works well, but there's a typo in the patch.

> -typedef struct rsa_st RSA;
> +struct rsa_st;
(...)
> -  RSA* rsa_private_key;  /* Private key data */
> +  struct rsa_rt* rsa_private_key;  /* Private key data */

The second one should be struct rsa_st, not rsa_rt.
