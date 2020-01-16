From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jan 2020 11:05:38 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <e7e0088e1b76adf1492f06e81b386a0018b9336b.camel@orolia.com>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
 <e7e0088e1b76adf1492f06e81b386a0018b9336b.camel@orolia.com>
Message-ID: <20200116110538.335a41b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jan 2020 10:01:09 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Just to be sure I understand, when you say "when TRANSIENT_DOWNLOAD is
> NO.", it'd be the same as if TRANSIENT_DOWNLOAD download is not defined
> at all, right?

Yes.

There is maybe a little bit of an issue in Yann's current
implementation as he does:

	$(if $($(2)_DOWNLOAD_TRANSIENT),-F) \

so in fact, -F would be passed as soon as <pkg>_DOWNLOAD_TRANSIENT is
non-empty, so <pkg>_DOWNLOAD_TRANSIENT = NO would in fact pass -F.

But this bug already exists for <pkg>_GIT_SUBMODULES:

	$(if $($(2)_GIT_SUBMODULES),-r) \

And it is trivial to fix.

> If it's the case, then that seems to me like a good idea, because it
> renders explicit the risk taken by the user when using a branch (which
> can be done unknowingly ATM).

Absolutely.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
