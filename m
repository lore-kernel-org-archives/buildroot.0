From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 13:57:27 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
Message-ID: <20131007135727.3cb4150d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Mon,  7 Oct 2013 13:42:10 +0200, J?r?me Pouiller wrote:
> Add patch from :
>   https://bugs.php.net/patch-display.php?bug_id=65426&patch=db6.patch&revision=1376033083&download=1
> 
> Notice this patch was not applied by upstream because of licence
> issue with berkeleydb 6. Linking with berkeleydb 6 may force user
> to publish patch applyed to php.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

This looks problematic to me. PHP is licensed under the "PHP license",
which according to http://en.wikipedia.org/wiki/PHP_License is
incompatible with the GPL (and therefore I assume with the AGPL,
which is the new license of BerkeleyDB).

Therefore, linking PHP with BerkeleyDB version 6 creates a PHP binary
that cannot legally be distributed.

If this analysis is correct, I'd suggest one of the following options:

 * Drop the support for BerkeleyDB support in PHP.

 * Add a berkeleydb5 package that packages the last known non-AGPL
   version of BerkeleyDB, and use that for PHP.

Considering how useful BerkeleyDB can be with PHP, I'm suggesting the
first option.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
