From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 12:47:07 +0200
Subject: [Buildroot] [PATCH v3 1/4] Remove trailing slash from all
 package site URLs
In-Reply-To: <1443456634-21484-2-git-send-email-luca@lucaceresoli.net>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150930124707.3520a87e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 28 Sep 2015 18:10:31 +0200, Luca Ceresoli wrote:
> The recommended form is without the trailing slash, and will become
> mandatory in a coming commit.
> 
> This avoids the need for the $$($(2)_SITE:/=) magic in package/pkg-generic.mk
> to avoid double slashes in download URLs, like
> "https://mosh.mit.edu//mosh-1.2.5.tar.gz".
>                      ^^
> 
> Note: this work has already been done in b0b9606530dfc6de4030 a few
> months ago and earlier in c7f4b964718bc5a3329b and 4a9eb20de817fa64,
> but no check has been added at that time to avoid new slashes to slip
> in, and so they did. This time a patch will follow immediately to
> prevent future mistakes from being unnoticed.
> 
> Mass-replaced with the following command:
> 
>   git grep -l '_SITE.*/$' | xargs sed -i '/_SITE.*=/s|/$||'
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
