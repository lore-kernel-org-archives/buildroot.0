From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 10:04:50 +0200
Subject: [Buildroot] [PATCH] package/xen: Use POSIX complaint header
 includes
In-Reply-To: <20170418033531.klfwusvs6ruu2x6b@tarshish>
References: <20170417231457.2691-1-alistair.francis@xilinx.com>
 <20170418033531.klfwusvs6ruu2x6b@tarshish>
Message-ID: <79a11f95-dc85-4fa7-10c4-808b385479fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-17 05:35, Baruch Siach wrote:
> Hi Alistair,
> 
> On Mon, Apr 17, 2017 at 04:14:57PM -0700, Alistair Francis wrote:
>> To fix build issues when using the musl library use POSIX compatible
>> library inclues.
> 
> Is there any build failure or run time issue that these patches are fixing?
> 
> It would be nice to have build warnings dealt with upstream to have a clean 
> build. But Buildroot doesn't carry patches for the sole purpose of fixing 
> build time warnings.

 +1 to that.

> When build warnings break the build because of -Werror, we either add 
> -Wno-error, or patch out the -Werror to fix the build.

 But not to this. A fundamental solution with an upstreamable patch is better,
-Wno-error is rather a stopgap measure when avoiding warnings is too difficult.
Which is often the case, by the way, e.g. if upstream haven't tested their code
yet with GCC 7.


 So, if this patch fixes a build or runtime failure, please mention this in the
commit message; if not, please mark the patch as Rejected in patchwork (but do
send it upstream, of course!).

 Regardless of this: thanks for the contribution, Alistair!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
