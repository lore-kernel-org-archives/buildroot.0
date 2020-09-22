From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:28:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/quagga: fix build with gcc 10
In-Reply-To: <20200921213030.57054-1-fontaine.fabrice@gmail.com>
References: <20200921213030.57054-1-fontaine.fabrice@gmail.com>
Message-ID: <20200922212854.60f042e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 23:30:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> + struct ethaddr {
> +     u_char octet[ETHER_ADDR_LEN];
> +-} __packed;

I think the intentation was to use the packed gcc attribute, and
perhaps in the past there was a __packed defined to
__attribute__((packed)) or something like that. When this define went
away, __packed became the name of a variable :)

That being said, I'm not sure the packed attribute makes anything
special on a structure that has a single member, so I've applied. We'll
also see what upstream says.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
