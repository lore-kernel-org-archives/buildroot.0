From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 27 Mar 2008 13:57:40 +1100
Subject: [Buildroot] using of local dir
In-Reply-To: <877ifp1bzg.fsf@macbook.be.48ers.dk>
References: <47EA8F05.8090102@gmx.net> <20080326180926.GA404@mx.loc>
	<877ifp1bzg.fsf@macbook.be.48ers.dk>
Message-ID: <20080327025740.GB5036@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 26, 2008 at 09:12:03PM +0100, Peter Korsgaard wrote:
> Well, the local/save/getconfig stuff does seem kinda overengineered -
> Couldn't we just have a bunch of *_defconfig files under configs/
> instead with a make %_defconfig target like the kernel has instead?

As long as you can have several projects built within the same tree. I'm
using the projects functionality to have several related projects built
this way.

Mind you I don't like using getconfig/saveconfig; too prone to losing
changes if you forget to saveconfig. Instead I use "make BOARD=xyz .."
each time. I will sometime send some patches to improve this method.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
