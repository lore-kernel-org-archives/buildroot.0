From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:03:31 +0100
Subject: [Buildroot] [PATCH next 1/4] lttng-tools: bump version to 2.9.0
In-Reply-To: <20161130175352.uqsmg6hb3hmlbgem@tarshish>
References: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
 <20161130175352.uqsmg6hb3hmlbgem@tarshish>
Message-ID: <20161130220331.2875f971@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 19:53:52 +0200, Baruch Siach wrote:

> On Wed, Nov 30, 2016 at 05:04:42PM +0000, Vicente Olivert Riera wrote:
> > Drop sha256 hash. The combination of md5 and sha1 hashes is enough.  
> 
> I don't think so. Neither md5 nor sha1 is considered cryptographically secure. 
> Their combination is probably better than either alone. But sha256 is even 
> better. Not only because of its larger hash value, but also because the 
> algorithm itself. Why drop it?

We had a quick discussion on IRC, where Vicente asked about this, and
both Peter and myself gave our feeling. Our feeling is that the
combination of two "weak" hashes is good enough for what Buildroot uses
hashes for. If no hash is provided by upstream or only one weak hash,
then having a sha256 hash is what we prefer. But when there's already
two "weak hashes" provided by upstream, we believe it's good enough.

Finding a collision is md5 is doable. Finding a collision in sha1 is
harder, but apparently in the range of possible. But creating a
collision that matches both is most likely really difficult to
achieve.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
