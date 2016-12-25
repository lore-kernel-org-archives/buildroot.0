From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Dec 2016 20:00:59 +0200
Subject: [Buildroot] [PATCH] Fix reverse dependencies of util-linux
In-Reply-To: <1482675981-4575-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1482675981-4575-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161225180059.jlmzfuuiqumcuf6l@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul,

On Sun, Dec 25, 2016 at 07:56:21PM +0530, Rahul Bedarkar wrote:
> Commit 006a328ad6be ("util-linux: fix build with ncurses") removed
> dependency on BR2_USE_WCHAR, but failed to update the reverse
> dependencies of util-linux.
> 
> This commit fixes all such reverse dependencies by removing dependency
> on BR2_USE_WCHAR if not required by package itself.
> 
> Thanks to comments that we add in Config.in for dependencies which are
> pulled from selected packages.

Have you verified that these packages actually build without BR2_USE_WCHAR? 
Some packages might have grown dependent on wchar over time. You may use a 
basic[1] config to verify that.

[1] http://autobuild.buildroot.net/toolchains/configs/br-arm-basic.config

> Fixes: 006a328ad6be ("util-linux: fix build with ncurses")
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
