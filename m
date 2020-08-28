From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Aug 2020 09:17:12 +0200
Subject: [Buildroot] [Question] How to depend on a feature in libc
In-Reply-To: <CAJX3zAvDehsPYF_kQSOT5xeynDYn_q=M64vBKueLvWtKmnymQg@mail.gmail.com>
References: <CAJX3zAvDehsPYF_kQSOT5xeynDYn_q=M64vBKueLvWtKmnymQg@mail.gmail.com>
Message-ID: <58bb32b6-d56e-775f-4cb9-3766ff7fe468@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/08/2020 19:26, Avraham Shukron wrote:
> I want to add a package that has an optional feature that requires the
> <fenv.h> header from C99.
> Apparently, this module is optional in uClibc, and it is not included in
> the default config.

 Note that even if it is enabled, its implementation is incomplete.

> I want my package's Config.in file to define a boolean config entry
> that depends on
> whether or not the selected libc has <fenv.h>.
> 
> How can I do that?

 There is no such option. Cfr. e.g. the spidermonkey package: it is simply
disabled on uClibc due to missing fenv support.

 There are also a few packages where we patch out the fenv requirement. e.g.
boost, pixman.

 Regards,
 Arnout
