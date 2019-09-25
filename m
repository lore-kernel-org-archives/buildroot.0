From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:05:57 -0300
Subject: [Buildroot] [PATCH 03/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: get value of variable 'level'
References: <20190903211341.10341-3-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acb8582b02_9193fde201fa41c441ad@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

> Get value of variable 'level' only just after the state change.
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  utils/checkpackagelib/lib_config.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index 8fad36f5ac..e6a5f1b182 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -114,8 +114,9 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>              elif text.startswith("endmenu"):
>                  self.state = self.state[:-5]
>  
> -        elif source_line:
>              self.level = self.get_level()
> +
> +        elif source_line:
>              new_package = source_line.group(1)

Without the initialization in previous patch, if the script finds a 'source'
line without a previous 'menu' or 'comment' it would raise a AttributeError. 
You can test this by momentarily removing the first 'menu' line from
package/Config.in.
This use case do matters IMO because it could be found when testing
package/Config.in in br2-external trees.

If you change previous patch, you can add this tag to this patch as-is:
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
