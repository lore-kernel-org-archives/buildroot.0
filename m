From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jul 2019 00:27:25 +0200
Subject: [Buildroot] [PATCH v2 2/2] checkpackagelib/lib_config.py: check
 packages alphabetical order in {Config.in, Config.in.host}
In-Reply-To: <20190611204946.3848-2-jerzy.m.grzegorek@gmail.com>
References: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
 <20190611204946.3848-2-jerzy.m.grzegorek@gmail.com>
Message-ID: <52067533-c74f-348b-450a-0504b71b0184@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jerzy,

On 11/06/2019 22:49, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>

 Applied both to master, thanks.

 I still made a lot of changes, though:

     - calculate level by counting - instead of with a static array;
     - new_package is only used locally, so don't make it a class member;
     - do indentation according to length of prefix;
     - don't split string in the middle of a line;
     - report first wrong package per menu;
     - do replace() only once;
     - add comment why we do replace().

 Please take a look at the end result, and if there's something you don't like,
send a follow-up patch.

 Regards,
 Arnout


> ---
> Changes v1 -> v2:
>  - swap patches 1 and 2 (Arnout)
>  - drop trailing lines (copy/paste side effect)
>  - rewrap lines to < 80 chars
>  - add variable to cut lines to < 80 chars
>  - change alphabetical order of '_" to go before digits (Arnout)
> 
> TODO : checking of menu of comments and menu of menus
