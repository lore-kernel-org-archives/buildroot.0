From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Apr 2015 12:15:02 +0300
Subject: [Buildroot] [PATCH 1/1] json-c: bump version to
 json-c-0.12-20140410
In-Reply-To: <1429002618-22546-1-git-send-email-sagaert.johan@proximus.be>
References: <1429002618-22546-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20150414091501.GQ2279@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert Johan,

On Tue, Apr 14, 2015 at 11:10:18AM +0200, Sagaert Johan wrote:
> diff --git a/package/json-c/0001-remove-unused-assignment.patch b/package/json-c/0001-remove-unused-assignment.patch
> new file mode 100644
> index 0000000..369e89f
> --- /dev/null
> +++ b/package/json-c/0001-remove-unused-assignment.patch
> @@ -0,0 +1,30 @@
> +From 35087bf7775481fbb880d38cde03ea654474dfa1 Mon Sep 17 00:00:00 2001
> +From: Sagaert Johan <sagaert.johan@proximus.be>
> +Date: Tue, 14 Apr 2015 10:43:05 +0200
> +Subject: [PATCH 1/1] remove unused asignment
> +
> +Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> +---
> + json_tokener.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/json_tokener.c b/json_tokener.c
> +index 19de8ef..9a76293 100644
> +--- a/json_tokener.c
> ++++ b/json_tokener.c
> +@@ -352,12 +352,10 @@ struct json_object* json_tokener_parse_ex(struct json_tokener *tok,
> + 
> +     case json_tokener_state_inf: /* aka starts with 'i' */
> +       {
> +-	int size;
> + 	int size_inf;
> + 	int is_negative = 0;
> + 
> + 	printbuf_memappend_fast(tok->pb, &c, 1);
> +-	size = json_min(tok->st_pos+1, json_null_str_len);
> + 	size_inf = json_min(tok->st_pos+1, json_inf_str_len);
> + 	char *infbuf = tok->pb->buf;
> + 	if (*infbuf == '-')

It seems this packages builds with -Werror, hence the need for this patch to 
avoid build breakage. A better solution, in my opinion, is to remove -Werror.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
