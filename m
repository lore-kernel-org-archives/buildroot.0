From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:13:14 +0100
Subject: [Buildroot] [PATCH v3 1/5] package: refactor listing of
 extractor dependencies
In-Reply-To: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
Message-ID: <20170215221314.36963682@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 22:15:38 +0200, Baruch Siach wrote:
> Don't special case $(XZCAT) when constructing DL_TOOLS_DEPENDENCIES. The next
> commit will introduce another extractor that automatically builds when not
> installed. Introduce EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS that lists
> archive extensions for which the extractor is already checked in
> support/dependencies/check-host-foo.mk. Use this in the newly introduced
> extractor-dependency to populate DL_TOOLS_DEPENDENCIES.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I've applied the entire series to master, after fixing the
$(firstword ...) function call, as noticed by Thomas DS. I'll make some
comments on PATCH 2/5 though.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
