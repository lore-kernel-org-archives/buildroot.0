From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:03:33 -0300
Subject: [Buildroot] [PATCH 02/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: change the type of variable 'level'
References: <20190903211341.10341-2-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acaf59c204_9193fde2016f54c43942@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

> checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: change the type of variable 'level'

Perhaps:
utils/checkpackagelib: CommentsMenusPackagesOrder: change the type of variable 'level'
However I have no good suggestion to make the subject shorter.

> Change the type of variable "level" to make it a class member.
> It will be used not only locally.
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  utils/checkpackagelib/lib_config.py | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index a3fbd0e69e..8fad36f5ac 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -93,12 +93,12 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>                  elif text.startswith("menu"):
>                      self.state += "-menu"
>  
> -            level = self.get_level()
> +            self.level = self.get_level()

Please also initialize this variable:
     def before(self):
         self.state = ""
+        self.level = 0
like you did in patch 5.

With the initialization fixed you can add:
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
