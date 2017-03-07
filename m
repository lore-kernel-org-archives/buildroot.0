From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Mar 2017 00:04:50 +0100
Subject: [Buildroot] [PATCH 1/2] scripts/pycompile: Accomodate latest
 Python 3 codebase
In-Reply-To: <20170306224852.30968-1-andrew.smirnov@gmail.com>
References: <20170306224852.30968-1-andrew.smirnov@gmail.com>
Message-ID: <20170308000450.6e2b4e93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 14:48:51 -0800, Andrey Smirnov wrote:
> As of the version 3.6.0 compile_dir() call will treat its 'quiet'
> argument as a full blown integer rather than a boolean value and perform
> integer comparison operations such as '<' or '>='.
> 
> To account for that convert ReportProblem type to be a true derivative
> of built-in int() and override all of int's rich comparison operators in
> order to be able to "sniff" for PyCompileError in all possible use-cases
> 
> The integer value ReportProblem pretends to be is determined by class
> variable VALUE which is set to 1.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  support/scripts/pycompile.py | 47 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 7 deletions(-)

Yegor, could you review this patch from Andrey, since you originally
wrote the pycompile.py logic? Also adding Samuel Martin in Cc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
