From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 6 Aug 2018 09:25:20 -0700
Subject: [Buildroot] [PATCH v2] download: fix file:// BR2_PRIMARY_SITE
 (download cache)
In-Reply-To: <20180805123956.GC12445@scaer>
References: <20180719034232.20746-1-hollis_blanchard@mentor.com>
 <20180805123956.GC12445@scaer>
Message-ID: <05d2fcc3-9f04-863d-c370-a9d1fc487773@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/05/2018 05:39 AM, Yann E. MORIN wrote:
> Hollis, All,
>
> On 2018-07-18 20:42 -0700, Hollis Blanchard spake thusly:
>> As far as I can tell, wget is the only downloader currently usable with
>> BR2_PRIMARY_SITE, and that doesn't work at all for file:// URLs. The symptoms
>> are these:
> Why do you need to have a primary that points to local files? Isn't it
> sufficient to export BR2_DL_DIR and opint it to your local cache
> instead?
We've actually had well-meaning developers corrupt the shared download 
cache before. In that case they manually repacked a kernel tarball 
complete with their experimental changes. In other cases, I've seen 
downloads fail when RHEL6 tools (e.g. curl, git) fail to download from 
some https site due to SSL compatibility problems. In both cases, not 
only was the tarball corrupted, but also there was no hash to check, 
since it was a custom kernel version.

To avoid problems like that, we have an official build job that 
populates the (otherwise read-only) download cache, and then individual 
developer builds are free to download other stuff besides (e.g. 
experimenting with a kernel versions, adding packages).

Hollis Blanchard
Mentor Graphics Emulation Division
