From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 15:35:11 +0200
Subject: [Buildroot] [PATCH v2 09/13] utils/checkpackagelib:
 CommentsMenusPackagesOrder: check the order of comments menu
In-Reply-To: <20191005122227.7297-10-jerzy.m.grzegorek@gmail.com>
References: <20191005122227.7297-1-jerzy.m.grzegorek@gmail.com>
 <20191005122227.7297-10-jerzy.m.grzegorek@gmail.com>
Message-ID: <c82eff05-802d-14b8-dee7-2ac5b6a94511@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/10/2019 14:22, Jerzy Grzegorek wrote:
> At any level if the 'comment ...' line occurs for the first time a new state
> '-comment' is added and all arrays elements for that level are initialized.
> For the second and subsequent time only packages arrays elements are initialized.
> The menu of comments corresponds to menu of packages of lower level.
> Only the valid comments are compared. The comment is valid only if there is
> at least one a 'source ...' line after it and before the next 'comment ...',
> 'menu ...' or 'if ...' line.
> The alphabetical order of comments at that level is checked until the first
> error occurs.

 I think this and the following check (and therefore also the three subsequent
fixes) should not be done.

 Indeed, for the comments/menus, it's likely that there are other concerns than
alphabetical ordering which are more relevant. For example, it makes more sense
for JSON to come after Javascript then before it.


 Regards,
 Arnout

> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[snip]
