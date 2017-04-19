From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Apr 2017 07:15:53 +0300
Subject: [Buildroot] [PATCH] Restore .git directory in git package
 downloads
In-Reply-To: <1492574439-4617-1-git-send-email-james@balean.com.au>
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
Message-ID: <20170419041553.w2hxo7dqnzuaccan@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

On Tue, Apr 18, 2017 at 11:00:39PM -0500, James Balean wrote:
> Removing the .git directory during package download and caching prevents
> Builroot users from making and testing changes to external software
> packages using Buildroot. This patch enables users to commit locally,
> make patches and contribute back to the projects they are using.

The OVERRIDE_SRCDIR mechanism is meant to cover this use case. See section 
8.12.6 "Using Buildroot during development" in the manual[1]. Is there 
anything missing for your use case?

[1] http://nightly.buildroot.org/manual.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
