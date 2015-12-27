From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:45:25 +0100
Subject: [Buildroot] [PATCHv3] toolchain: granular choice for stack
	protector
In-Reply-To: <CAKbGBLhQahOvac7XK7EWsQcK_6Um+j4_f0a+ZD3Td7sitpm9xg@mail.gmail.com>
References: <1451214451-26133-1-git-send-email-yann.morin.1998@free.fr>
 <CAKbGBLhQahOvac7XK7EWsQcK_6Um+j4_f0a+ZD3Td7sitpm9xg@mail.gmail.com>
Message-ID: <20151227124525.763fcd14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven,

On Sun, 27 Dec 2015 03:39:19 -0800, Steven Noonan wrote:

> When SSP is *enabled* (BR2_ENABLE_SSP) the default should be
> BR2_SSP_STRONG (if available). It's generates code that's
> better-protected than BR2_SSP_REGULAR, but faster and smaller than
> BR2_SSP_ALL.
> 
> Only crazy folks would use BR2_SSP_ALL if BR2_SSP_STRONG is an option. ;)

We want to preserve existing behavior as much as possible. So people
who enabled BR2_ENABLE_SSP were paying the price of BR2_SSP_ALL, and we
should therefore keep using BR2_SSP_ALL for such users. That's the
point of legacy handling: minimizing the amount of "surprise" /changes
for users upgrading Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
