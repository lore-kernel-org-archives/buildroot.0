From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 20 Oct 2013 09:32:30 +0200
Subject: [Buildroot] [PATCH 03/12] support: trivial fixes (typos and
 minor rewording) in gen-manual-lists.py
In-Reply-To: <8ab1607b9a16453d4b4c7a4ca89af705e5e1c857.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
 <8ab1607b9a16453d4b4c7a4ca89af705e5e1c857.1382127504.git.s.martin49@gmail.com>
Message-ID: <CAAXf6LXuDPVv--__ruJJ8bZ1kZTDMFuEjJ9m_JeGE5a9bFY-PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,


On Fri, Oct 18, 2013 at 10:31 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes v1 -> v2:
> - split patch content
> - detail a bit more the commit message
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/scripts/gen-manual-lists.py | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
> index 3568843..5c81e1d 100755
> --- a/support/scripts/gen-manual-lists.py
> +++ b/support/scripts/gen-manual-lists.py
> @@ -107,7 +107,7 @@ def get_symbol_parents(item, root=None, enable_choice=False):
>          parent = parent.get_parent()
>      if isinstance(root, kconfiglib.Menu) or \
>              (enable_choice and isinstance(root, kconfiglib.Choice)):
> -        parents.append("") # Dummy empty parrent to get a leading arrow ->
> +        parents.append("") # Dummy empty parent to get a leading arrow ->
>      parents.reverse()
>      return parents
>
> @@ -126,15 +126,14 @@ def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
>      :param sub_menu:       Output the column with the sub-menu path
>
>      """
> -    def _format_entry(label, parents, sub_menu):
> +    def _format_entry(item, parents, sub_menu):
>          """ Format an asciidoc table entry.
>
>          """
>          if sub_menu:
> -            return "| {0:<40} <| {1}\n".format(label, " -> ".join(parents))
> +            return "| {0:<40} <| {1}\n".format(item, " -> ".join(parents))
>          else:
> -            return "| {0:<40}\n".format(label)
> -
> +            return "| {0:<40}\n".format(item)
>      lines = []
>      for item in get_symbol_subset(root, filter_func):
>          if not item.is_symbol() or not item.prompts:
> --



Ack on the above changes.

I also spotted a few other typos in that file that could be fixed at
the same time:

- lasst -> last in comment of get_symbol_parents
- consumtion -> consumption  (line 267)
- noticebly -> noticeably (line 269)
- re-scannig -> re-scanning (or even rescanning) (line 269)

Best regards,
Thomas
