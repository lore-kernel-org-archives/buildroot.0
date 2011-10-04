From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 18:05:04 -0500
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, October 04, 2011 3:36 PM, H Hartley Sweeten wrote:
>
> Hello all,
>
> The output of pkg-stats shows almost every package with the following status:
>
> AUTOTARGETS GENTARGETS  CMAKETARGETS   manual
> target host target host target host  target              Actions
>   NO    NO    NO    NO    NO    NO     NO   YES  * convert to generic target
>
> I don't think this output is correct but I can't figure out what's wrong
> with the script.

Thomas,

I think the problem with pkg-stats is due to your patches:

 package: remove useless arguments from CMAKETARGETS
 package: remove useless arguments from AUTOTARGETS
 package: remove useless arguments from GENTARGETS
 package: add helper functions to get package name and directory magically

The grep tests are still looking for the package name and directory to
determine the package type.

I'll post a patch shortly.

One other thing with pkg-stats.

Can you think of any way to pull the _VERSION of the packages out of the *.mk
files and show that information in the output html file?

Regards,
Hartley
