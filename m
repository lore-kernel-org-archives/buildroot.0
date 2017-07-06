From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:54:09 +0200
Subject: [Buildroot] [PATCH v3] pkg-stats: allow to sort by column
In-Reply-To: <20170706013631.19238-1-ricardo.martincoski@gmail.com>
References: <20170701043555.25851-1-ricardo.martincoski@gmail.com>
 <20170706013631.19238-1-ricardo.martincoski@gmail.com>
Message-ID: <20170706215409.109ed854@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 22:36:31 -0300, Ricardo Martincoski wrote:
> With 2000+ packages it's not trivial to identify i.e.:
> - all packages that don't have a hash file;
> - all packages that have patches;
> - all packages that have code style warnings;
> 
> User experience can be improved by dynamically sorting the resulting
> table.
> 
> There is an open-source solution that does that in the client-side and
> requires minimal changes to our script: sorttable.js.
> The script is MIT licensed as stated in its website.
> 
> Include instructions to download the third-party script and adapt our
> script accordingly, following the example in the tool's website.
> 
> Also add a hint to the user that the table can be sorted.
> Display the hint when all these conditions are met:
> - the browser has JavaScript support enabled;
> - the sorttable.js script is loaded;
> - the page is loaded.
> 
> Usage (static table):
> ./support/scripts/pkg-stats > /tmp/pkg.html
> 
> Usage (sortable table):
> ./support/scripts/pkg-stats > /tmp/pkg.html
> wget https://www.kryogenix.org/code/browser/sorttable/sorttable.js \
>   -O /tmp/sorttable.js
> Open /tmp/pkg.html using a JavaScript-enabled web browser and click on
> the headers of the table to sort it.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

I've changed your patch so that the generated HTML directly uses the
online Javascript file, rather than having to download it separately.
Applied with this change, and a few other additional changes to
pkg-stats.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
