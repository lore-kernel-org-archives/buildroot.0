From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 15:52:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-06
In-Reply-To: <45c5b4b3-a11a-1ec3-2f7b-c8abf229b06f@green-communications.fr>
References: <20200907070901.69C16870AE@hemlock.osuosl.org>
 <45c5b4b3-a11a-1ec3-2f7b-c8abf229b06f@green-communications.fr>
Message-ID: <20200907155258.48f8a088@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Sep 2020 11:47:59 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> On 07/09/2020 09:08, Thomas Petazzoni wrote:>
> libgit2 | CVE-2014-9390    |
> https://security-tracker.debian.org/tracker/CVE-2014-9390
> So libgit2 is affected by a 6 year old security vulnerability that has
> been fixed before the package was actually introduced in buildroot...
> 
> This apparently comes directly from the nvd database, do i wait for it
> to be fixed, or should i add it to LIBGIT2_IGNORE_CVES ? The manual
> doesn't say anything about this case.

Thanks for getting back to us about this.

According to what
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=774048 says, it was
fixed upstream in version 0.21.3, and a quick inspection indeed shows
this commit between 0.21.2 and 0.21.3:

commit 928429c5c96a701bcbcafacb2421a82602b36915
Author: Vicent Mart? <vicent@github.com>
Date:   Tue Nov 25 00:14:52 2014 +0100

    tree: Check for `.git` with case insensitivy

So I believe that the NVD database should be updated to indicate that
only versions up to 0.21.2 are affected.

Matt has documented at
https://elinux.org/Buildroot:Security_Vulnerability_Management how to
request updates of NVD entries, but I've never followed the process
myself.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
