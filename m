From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 4 Apr 2009 23:53:47 +1100
Subject: [Buildroot] UBIFS confusion
In-Reply-To: <AC4CD65049C54EDC9F34A00769C5A81F@apexjs>
References: <AC4CD65049C54EDC9F34A00769C5A81F@apexjs>
Message-ID: <20090404125347.GA11896@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 04, 2009 at 11:03:26AM +0200, Sagaert Johan wrote:
> When i need UBIFS  do i just enable UBI and UBIFS with the default kernel
> (currently using 2.6.28.8.)?
>  
> On http://git.infradead.org/ i saw  <http://git.infradead.org/ubifs-2.6.git>
> ubifs-2.6.git ,  <http://git.infradead.org/ubi-2.6.git> ubi-2.6.git , these
> seem to be kernel trees with modifications in the ubisfs fs.
>  
> i am currently using MTD userspace tools from the git repository.(mkfs.ubifs
> ,ubinize) to create ubifs images.
>  
> Do i need the to use the kernel tree from
> <http://git.infradead.org/ubifs-2.6.git> ubifs-2.6.git or
> <http://git.infradead.org/ubi-2.6.git> ubi-2.6.git or can i just use the
> default buildroot stuff ?

Default buildroot kernel is fine (>= 2.6.25 at least, maybe later).

However the current checked-in ubifs root uses an old version of
mkfs.ubifs which generates an old format. I don't think it will work
with any released kernel. You need the patches submitted by Michael Roth
this week. We should get them committed to buildroot very soon.

The ubi-2.6.git and ubifs-2.6.git trees are either old work or future
development work, but the stuff in the released kernel is stable.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
