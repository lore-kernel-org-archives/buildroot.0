From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:21:35 +0100
Subject: [Buildroot] [PATCH 1/2 v3] core: make symlinks relative when
 preparing the SDK
In-Reply-To: <9f4825baa7a475b4d8f262925e1ff652b31cd6fb.1545491919.git.yann.morin.1998@free.fr>
References: <cover.1545491919.git.yann.morin.1998@free.fr>
 <9f4825baa7a475b4d8f262925e1ff652b31cd6fb.1545491919.git.yann.morin.1998@free.fr>
Message-ID: <20181226222135.4ef03363@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Dec 2018 16:18:51 +0100, Yann E. MORIN wrote:
> The SDK is supposed to be relocatable, so symlinks must not be
> absolute.
> 
> Add a new helper script, that replaces all absolute symlinks with
> relative ones.

This script is really not trivial. This additional complexity raises a
simple question: how many packages install such absolute symlinks?
Should we instead detect such absolute symlinks, and use that to fix
the problematic packages ?

I am not saying at all that the approach of fixing all symlinks is
wrong, but I'd like to see a proper discussion on the balance between
fixing the problematic packages vs. taking the "brutal" approach of
this new fix-symlinks script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
