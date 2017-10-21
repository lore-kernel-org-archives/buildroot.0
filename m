From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 09:51:08 +0200
Subject: [Buildroot] [V2 1/1] package/strongswan: Install libraries to
 /usr/lib
In-Reply-To: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171021095108.0ea87545@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Aug 2017 10:18:08 -0500, Sam Voss wrote:
> Install strongswan ipsec libraries into /usr/lib instead of
> /usr/lib/ipsec in an effort to not need a custom RPATH for this package.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

I think you said that the RPATH to /usr/lib/ipsec was being stripped
from the Strongswan binary, therefore causing a runtime failure.

However, I did a test build, and I do see /usr/lib/ipsec kept in the
RPATH:

 0x0000001d (RUNPATH)                    Library runpath: [/usr/lib/ipsec]

So, even though installing the libraries in /usr/lib is indeed better
for consistency, I'd like to understand why you had an issue running
the Strongswan program.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
