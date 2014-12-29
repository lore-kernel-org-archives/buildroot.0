From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 15:38:14 +0100
Subject: [Buildroot] [PATCH 1/2] libnftnl: rename patch to new convention,
	use Git formatted patch
Message-ID: <1419863895-19319-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-to-libnftnl_xfree-to-avoid-symbol-namin.patch} | 257 ++++++++++++---------
 1 file changed, 151 insertions(+), 106 deletions(-)
 rename package/libnftnl/{libnftnl-0001-rename-xfree.patch => 0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch} (58%)

diff --git a/package/libnftnl/libnftnl-0001-rename-xfree.patch b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
similarity index 58%
rename from package/libnftnl/libnftnl-0001-rename-xfree.patch
rename to package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
index 5816a6b..eda5b4b 100644
--- a/package/libnftnl/libnftnl-0001-rename-xfree.patch
+++ b/package/libnftnl/0001-Rename-xfree-to-libnftnl_xfree-to-avoid-symbol-namin.patch
@@ -1,4 +1,8 @@
-Rename xfree() to libnftnl_xfree() to avoid symbol naming conflict
+From 85dfe7dcd20c54e6d75d66a400f7ae038a52239b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Dec 2014 15:31:40 +0100
+Subject: [PATCH 1/2] Rename xfree() to libnftnl_xfree() to avoid symbol naming
+ conflict
 
 When ELF binaries and shared libraries are used, the internal
 functions of libnftnl such as xfree() are not visible to the outside
@@ -18,10 +22,32 @@ libnftnl_xfree().
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Gustavo: update for version 1.0.3]
 
-diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
---- libnftnl-1.0.3.orig/src/chain.c	2014-12-16 08:16:44.082395482 -0300
-+++ libnftnl-1.0.3/src/chain.c	2014-12-16 08:17:05.994151598 -0300
-@@ -89,11 +89,11 @@
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/chain.c          | 18 +++++++++---------
+ src/common.c         |  2 +-
+ src/expr.c           |  2 +-
+ src/expr/data_reg.c  |  2 +-
+ src/expr/immediate.c |  2 +-
+ src/expr/log.c       |  6 +++---
+ src/expr/match.c     |  6 +++---
+ src/expr/target.c    |  6 +++---
+ src/gen.c            |  2 +-
+ src/internal.h       |  2 +-
+ src/mxml.c           |  2 +-
+ src/rule.c           | 24 ++++++++++++------------
+ src/ruleset.c        |  2 +-
+ src/set.c            | 18 +++++++++---------
+ src/set_elem.c       | 10 +++++-----
+ src/table.c          | 12 ++++++------
+ src/utils.c          |  2 +-
+ 17 files changed, 59 insertions(+), 59 deletions(-)
+
+diff --git a/src/chain.c b/src/chain.c
+index b67385e..9ccde54 100644
+--- a/src/chain.c
++++ b/src/chain.c
+@@ -89,11 +89,11 @@ EXPORT_SYMBOL(nft_chain_alloc);
  void nft_chain_free(struct nft_chain *c)
  {
  	if (c->table != NULL)
@@ -36,7 +62,7 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
  }
  EXPORT_SYMBOL(nft_chain_free);
  
-@@ -111,7 +111,7 @@
+@@ -111,7 +111,7 @@ void nft_chain_attr_unset(struct nft_chain *c, uint16_t attr)
  	switch (attr) {
  	case NFT_CHAIN_ATTR_TABLE:
  		if (c->table) {
@@ -45,7 +71,7 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
  			c->table = NULL;
  		}
  		break;
-@@ -119,7 +119,7 @@
+@@ -119,7 +119,7 @@ void nft_chain_attr_unset(struct nft_chain *c, uint16_t attr)
  		break;
  	case NFT_CHAIN_ATTR_TYPE:
  		if (c->type) {
@@ -54,7 +80,7 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
  			c->type = NULL;
  		}
  		break;
-@@ -164,7 +164,7 @@
+@@ -164,7 +164,7 @@ void nft_chain_attr_set_data(struct nft_chain *c, uint16_t attr,
  		break;
  	case NFT_CHAIN_ATTR_TABLE:
  		if (c->table)
@@ -63,7 +89,7 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
  
  		c->table = strdup(data);
  		break;
-@@ -194,7 +194,7 @@
+@@ -194,7 +194,7 @@ void nft_chain_attr_set_data(struct nft_chain *c, uint16_t attr,
  		break;
  	case NFT_CHAIN_ATTR_TYPE:
  		if (c->type)
@@ -72,7 +98,7 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
  
  		c->type = strdup(data);
  		break;
-@@ -915,7 +915,7 @@
+@@ -915,7 +915,7 @@ void nft_chain_list_free(struct nft_chain_list *list)
  		list_del(&r->head);
  		nft_chain_free(r);
  	}
@@ -81,7 +107,7 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
  }
  EXPORT_SYMBOL(nft_chain_list_free);
  
-@@ -994,6 +994,6 @@
+@@ -994,6 +994,6 @@ EXPORT_SYMBOL(nft_chain_list_iter_next);
  
  void nft_chain_list_iter_destroy(struct nft_chain_list_iter *iter)
  {
@@ -89,10 +115,11 @@ diff -Nura libnftnl-1.0.3.orig/src/chain.c libnftnl-1.0.3/src/chain.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_chain_list_iter_destroy);
-diff -Nura libnftnl-1.0.3.orig/src/common.c libnftnl-1.0.3/src/common.c
---- libnftnl-1.0.3.orig/src/common.c	2014-12-16 08:16:44.082395482 -0300
-+++ libnftnl-1.0.3/src/common.c	2014-12-16 08:17:05.997151702 -0300
-@@ -48,7 +48,7 @@
+diff --git a/src/common.c b/src/common.c
+index a6f2508..735b098 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -48,7 +48,7 @@ EXPORT_SYMBOL(nft_parse_err_alloc);
  
  void nft_parse_err_free(struct nft_parse_err *err)
  {
@@ -101,10 +128,24 @@ diff -Nura libnftnl-1.0.3.orig/src/common.c libnftnl-1.0.3/src/common.c
  }
  EXPORT_SYMBOL(nft_parse_err_free);
  
-diff -Nura libnftnl-1.0.3.orig/src/expr/data_reg.c libnftnl-1.0.3/src/expr/data_reg.c
---- libnftnl-1.0.3.orig/src/expr/data_reg.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/expr/data_reg.c	2014-12-16 08:17:06.055153703 -0300
-@@ -130,7 +130,7 @@
+diff --git a/src/expr.c b/src/expr.c
+index 55557da..d23af01 100644
+--- a/src/expr.c
++++ b/src/expr.c
+@@ -52,7 +52,7 @@ void nft_rule_expr_free(struct nft_rule_expr *expr)
+ 	if (expr->ops->free)
+ 		expr->ops->free(expr);
+ 
+-	xfree(expr);
++	nftnl_xfree(expr);
+ }
+ EXPORT_SYMBOL(nft_rule_expr_free);
+ 
+diff --git a/src/expr/data_reg.c b/src/expr/data_reg.c
+index 33b3346..a217d77 100644
+--- a/src/expr/data_reg.c
++++ b/src/expr/data_reg.c
+@@ -130,7 +130,7 @@ static int nft_data_reg_verdict_xml_parse(union nft_data_reg *reg,
  				   NFT_XML_OPT, err);
  	if (chain != NULL) {
  		if (reg->chain)
@@ -113,10 +154,11 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/data_reg.c libnftnl-1.0.3/src/expr/data_
  
  		reg->chain = strdup(chain);
  	}
-diff -Nura libnftnl-1.0.3.orig/src/expr/immediate.c libnftnl-1.0.3/src/expr/immediate.c
---- libnftnl-1.0.3.orig/src/expr/immediate.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/expr/immediate.c	2014-12-16 08:17:06.052153599 -0300
-@@ -47,7 +47,7 @@
+diff --git a/src/expr/immediate.c b/src/expr/immediate.c
+index 3d4e48c..d48a4e1 100644
+--- a/src/expr/immediate.c
++++ b/src/expr/immediate.c
+@@ -47,7 +47,7 @@ nft_rule_expr_immediate_set(struct nft_rule_expr *e, uint16_t type,
  		break;
  	case NFT_EXPR_IMM_CHAIN:
  		if (imm->data.chain)
@@ -125,10 +167,11 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/immediate.c libnftnl-1.0.3/src/expr/imme
  
  		imm->data.chain = strdup(data);
  		break;
-diff -Nura libnftnl-1.0.3.orig/src/expr/log.c libnftnl-1.0.3/src/expr/log.c
---- libnftnl-1.0.3.orig/src/expr/log.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/expr/log.c	2014-12-16 08:17:06.038153116 -0300
-@@ -40,7 +40,7 @@
+diff --git a/src/expr/log.c b/src/expr/log.c
+index 0a324c4..0eec1dc 100644
+--- a/src/expr/log.c
++++ b/src/expr/log.c
+@@ -40,7 +40,7 @@ static int nft_rule_expr_log_set(struct nft_rule_expr *e, uint16_t type,
  	switch(type) {
  	case NFT_EXPR_LOG_PREFIX:
  		if (log->prefix)
@@ -137,7 +180,7 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/log.c libnftnl-1.0.3/src/expr/log.c
  
  		log->prefix = strdup(data);
  		break;
-@@ -154,7 +154,7 @@
+@@ -154,7 +154,7 @@ nft_rule_expr_log_parse(struct nft_rule_expr *e, struct nlattr *attr)
  
  	if (tb[NFTA_LOG_PREFIX]) {
  		if (log->prefix)
@@ -146,7 +189,7 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/log.c libnftnl-1.0.3/src/expr/log.c
  
  		log->prefix = strdup(mnl_attr_get_str(tb[NFTA_LOG_PREFIX]));
  		e->flags |= (1 << NFT_EXPR_LOG_PREFIX);
-@@ -331,7 +331,7 @@
+@@ -331,7 +331,7 @@ static void nft_rule_expr_log_free(struct nft_rule_expr *e)
  {
  	struct nft_expr_log *log = nft_expr_data(e);
  
@@ -155,10 +198,11 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/log.c libnftnl-1.0.3/src/expr/log.c
  }
  
  struct expr_ops expr_ops_log = {
-diff -Nura libnftnl-1.0.3.orig/src/expr/match.c libnftnl-1.0.3/src/expr/match.c
---- libnftnl-1.0.3.orig/src/expr/match.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/expr/match.c	2014-12-16 08:17:06.043153289 -0300
-@@ -53,7 +53,7 @@
+diff --git a/src/expr/match.c b/src/expr/match.c
+index 26a368f..b452d06 100644
+--- a/src/expr/match.c
++++ b/src/expr/match.c
+@@ -53,7 +53,7 @@ nft_rule_expr_match_set(struct nft_rule_expr *e, uint16_t type,
  		break;
  	case NFT_EXPR_MT_INFO:
  		if (mt->data)
@@ -167,7 +211,7 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/match.c libnftnl-1.0.3/src/expr/match.c
  
  		mt->data = data;
  		mt->data_len = data_len;
-@@ -150,7 +150,7 @@
+@@ -150,7 +150,7 @@ static int nft_rule_expr_match_parse(struct nft_rule_expr *e, struct nlattr *att
  		void *match_data;
  
  		if (match->data)
@@ -176,7 +220,7 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/match.c libnftnl-1.0.3/src/expr/match.c
  
  		match_data = calloc(1, len);
  		if (match_data == NULL)
-@@ -240,7 +240,7 @@
+@@ -240,7 +240,7 @@ static void nft_rule_expr_match_free(struct nft_rule_expr *e)
  {
  	struct nft_expr_match *match = nft_expr_data(e);
  
@@ -185,10 +229,11 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/match.c libnftnl-1.0.3/src/expr/match.c
  }
  
  struct expr_ops expr_ops_match = {
-diff -Nura libnftnl-1.0.3.orig/src/expr/target.c libnftnl-1.0.3/src/expr/target.c
---- libnftnl-1.0.3.orig/src/expr/target.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/expr/target.c	2014-12-16 08:17:06.026152702 -0300
-@@ -53,7 +53,7 @@
+diff --git a/src/expr/target.c b/src/expr/target.c
+index a79bc9e..bf836b7 100644
+--- a/src/expr/target.c
++++ b/src/expr/target.c
+@@ -53,7 +53,7 @@ nft_rule_expr_target_set(struct nft_rule_expr *e, uint16_t type,
  		break;
  	case NFT_EXPR_TG_INFO:
  		if (tg->data)
@@ -197,7 +242,7 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/target.c libnftnl-1.0.3/src/expr/target.
  
  		tg->data = data;
  		tg->data_len = data_len;
-@@ -150,7 +150,7 @@
+@@ -150,7 +150,7 @@ static int nft_rule_expr_target_parse(struct nft_rule_expr *e, struct nlattr *at
  		void *target_data;
  
  		if (target->data)
@@ -206,7 +251,7 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/target.c libnftnl-1.0.3/src/expr/target.
  
  		target_data = calloc(1, len);
  		if (target_data == NULL)
-@@ -241,7 +241,7 @@
+@@ -241,7 +241,7 @@ static void nft_rule_expr_target_free(struct nft_rule_expr *e)
  {
  	struct nft_expr_target *target = nft_expr_data(e);
  
@@ -215,22 +260,11 @@ diff -Nura libnftnl-1.0.3.orig/src/expr/target.c libnftnl-1.0.3/src/expr/target.
  }
  
  struct expr_ops expr_ops_target = {
-diff -Nura libnftnl-1.0.3.orig/src/expr.c libnftnl-1.0.3/src/expr.c
---- libnftnl-1.0.3.orig/src/expr.c	2014-12-16 08:16:44.082395482 -0300
-+++ libnftnl-1.0.3/src/expr.c	2014-12-16 08:17:05.996151667 -0300
-@@ -52,7 +52,7 @@
- 	if (expr->ops->free)
- 		expr->ops->free(expr);
- 
--	xfree(expr);
-+	nftnl_xfree(expr);
- }
- EXPORT_SYMBOL(nft_rule_expr_free);
- 
-diff -Nura libnftnl-1.0.3.orig/src/gen.c libnftnl-1.0.3/src/gen.c
---- libnftnl-1.0.3.orig/src/gen.c	2014-12-16 08:16:44.082395482 -0300
-+++ libnftnl-1.0.3/src/gen.c	2014-12-16 08:17:05.999151770 -0300
-@@ -37,7 +37,7 @@
+diff --git a/src/gen.c b/src/gen.c
+index 21d3a49..515abc4 100644
+--- a/src/gen.c
++++ b/src/gen.c
+@@ -37,7 +37,7 @@ EXPORT_SYMBOL(nft_gen_alloc);
  
  void nft_gen_free(struct nft_gen *gen)
  {
@@ -239,9 +273,10 @@ diff -Nura libnftnl-1.0.3.orig/src/gen.c libnftnl-1.0.3/src/gen.c
  }
  EXPORT_SYMBOL(nft_gen_free);
  
-diff -Nura libnftnl-1.0.3.orig/src/internal.h libnftnl-1.0.3/src/internal.h
---- libnftnl-1.0.3.orig/src/internal.h	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/internal.h	2014-12-16 08:17:06.014152288 -0300
+diff --git a/src/internal.h b/src/internal.h
+index db9af11..898a7e7 100644
+--- a/src/internal.h
++++ b/src/internal.h
 @@ -16,7 +16,7 @@
  #include <libnftnl/common.h>
  #include <linux/netfilter/nf_tables.h>
@@ -251,10 +286,11 @@ diff -Nura libnftnl-1.0.3.orig/src/internal.h libnftnl-1.0.3/src/internal.h
  
  #define BASE_DEC 10
  #define BASE_HEX 16
-diff -Nura libnftnl-1.0.3.orig/src/mxml.c libnftnl-1.0.3/src/mxml.c
---- libnftnl-1.0.3.orig/src/mxml.c	2014-12-16 08:16:44.084395550 -0300
-+++ libnftnl-1.0.3/src/mxml.c	2014-12-16 08:17:06.079154531 -0300
-@@ -84,7 +84,7 @@
+diff --git a/src/mxml.c b/src/mxml.c
+index a97d380..f4b5a05 100644
+--- a/src/mxml.c
++++ b/src/mxml.c
+@@ -84,7 +84,7 @@ struct nft_rule_expr *nft_mxml_expr_parse(mxml_node_t *node,
  		goto err_expr;
  
  	tree = mxmlLoadString(NULL, xml_text, MXML_OPAQUE_CALLBACK);
@@ -263,10 +299,11 @@ diff -Nura libnftnl-1.0.3.orig/src/mxml.c libnftnl-1.0.3/src/mxml.c
  
  	if (tree == NULL)
  		goto err_expr;
-diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
---- libnftnl-1.0.3.orig/src/rule.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/rule.c	2014-12-16 08:17:06.062153945 -0300
-@@ -75,11 +75,11 @@
+diff --git a/src/rule.c b/src/rule.c
+index c974f8b..56bf6ef 100644
+--- a/src/rule.c
++++ b/src/rule.c
+@@ -75,11 +75,11 @@ void nft_rule_free(struct nft_rule *r)
  		nft_rule_expr_free(e);
  
  	if (r->table != NULL)
@@ -281,7 +318,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  }
  EXPORT_SYMBOL(nft_rule_free);
  
-@@ -97,13 +97,13 @@
+@@ -97,13 +97,13 @@ void nft_rule_attr_unset(struct nft_rule *r, uint16_t attr)
  	switch (attr) {
  	case NFT_RULE_ATTR_TABLE:
  		if (r->table) {
@@ -297,7 +334,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  			r->chain = NULL;
  		}
  		break;
-@@ -139,13 +139,13 @@
+@@ -139,13 +139,13 @@ void nft_rule_attr_set_data(struct nft_rule *r, uint16_t attr,
  	switch(attr) {
  	case NFT_RULE_ATTR_TABLE:
  		if (r->table)
@@ -313,7 +350,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  
  		r->chain = strdup(data);
  		break;
-@@ -395,7 +395,7 @@
+@@ -395,7 +395,7 @@ static int nft_rule_parse_expr2(struct nlattr *attr, struct nft_rule *r)
  
  	if (tb[NFTA_EXPR_DATA]) {
  		if (expr->ops->parse(expr, tb[NFTA_EXPR_DATA]) < 0) {
@@ -322,7 +359,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  			return -1;
  		}
  	}
-@@ -491,7 +491,7 @@
+@@ -491,7 +491,7 @@ int nft_rule_nlmsg_parse(const struct nlmsghdr *nlh, struct nft_rule *r)
  			mnl_attr_get_payload(tb[NFTA_RULE_USERDATA]);
  
  		if (r->user.data)
@@ -331,7 +368,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  
  		r->user.len = mnl_attr_get_payload_len(tb[NFTA_RULE_USERDATA]);
  
-@@ -1064,7 +1064,7 @@
+@@ -1064,7 +1064,7 @@ EXPORT_SYMBOL(nft_rule_expr_iter_next);
  
  void nft_rule_expr_iter_destroy(struct nft_rule_expr_iter *iter)
  {
@@ -340,7 +377,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  }
  EXPORT_SYMBOL(nft_rule_expr_iter_destroy);
  
-@@ -1094,7 +1094,7 @@
+@@ -1094,7 +1094,7 @@ void nft_rule_list_free(struct nft_rule_list *list)
  		list_del(&r->head);
  		nft_rule_free(r);
  	}
@@ -349,7 +386,7 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
  }
  EXPORT_SYMBOL(nft_rule_list_free);
  
-@@ -1179,6 +1179,6 @@
+@@ -1179,6 +1179,6 @@ EXPORT_SYMBOL(nft_rule_list_iter_next);
  
  void nft_rule_list_iter_destroy(struct nft_rule_list_iter *iter)
  {
@@ -357,10 +394,11 @@ diff -Nura libnftnl-1.0.3.orig/src/rule.c libnftnl-1.0.3/src/rule.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_rule_list_iter_destroy);
-diff -Nura libnftnl-1.0.3.orig/src/ruleset.c libnftnl-1.0.3/src/ruleset.c
---- libnftnl-1.0.3.orig/src/ruleset.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/ruleset.c	2014-12-16 08:17:06.008152081 -0300
-@@ -48,7 +48,7 @@
+diff --git a/src/ruleset.c b/src/ruleset.c
+index 6bb7582..e482e18 100644
+--- a/src/ruleset.c
++++ b/src/ruleset.c
+@@ -48,7 +48,7 @@ void nft_ruleset_free(struct nft_ruleset *r)
  		nft_set_list_free(r->set_list);
  	if (r->flags & (1 << NFT_RULESET_ATTR_RULELIST))
  		nft_rule_list_free(r->rule_list);
@@ -369,10 +407,11 @@ diff -Nura libnftnl-1.0.3.orig/src/ruleset.c libnftnl-1.0.3/src/ruleset.c
  }
  EXPORT_SYMBOL(nft_ruleset_free);
  
-diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
---- libnftnl-1.0.3.orig/src/set.c	2014-12-16 08:16:44.084395550 -0300
-+++ libnftnl-1.0.3/src/set.c	2014-12-16 08:17:06.077154462 -0300
-@@ -47,15 +47,15 @@
+diff --git a/src/set.c b/src/set.c
+index 2385031..0355f99 100644
+--- a/src/set.c
++++ b/src/set.c
+@@ -47,15 +47,15 @@ void nft_set_free(struct nft_set *s)
  	struct nft_set_elem *elem, *tmp;
  
  	if (s->table != NULL)
@@ -391,7 +430,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
  }
  EXPORT_SYMBOL(nft_set_free);
  
-@@ -71,14 +71,14 @@
+@@ -71,14 +71,14 @@ void nft_set_attr_unset(struct nft_set *s, uint16_t attr)
  	case NFT_SET_ATTR_TABLE:
  		if (s->flags & (1 << NFT_SET_ATTR_TABLE))
  			if (s->table) {
@@ -408,7 +447,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
  				s->name = NULL;
  			}
  		break;
-@@ -122,13 +122,13 @@
+@@ -122,13 +122,13 @@ void nft_set_attr_set_data(struct nft_set *s, uint16_t attr, const void *data,
  	switch(attr) {
  	case NFT_SET_ATTR_TABLE:
  		if (s->table)
@@ -424,7 +463,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
  
  		s->name = strdup(data);
  		break;
-@@ -963,7 +963,7 @@
+@@ -963,7 +963,7 @@ void nft_set_list_free(struct nft_set_list *list)
  		list_del(&s->head);
  		nft_set_free(s);
  	}
@@ -433,7 +472,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
  }
  EXPORT_SYMBOL(nft_set_list_free);
  
-@@ -1047,7 +1047,7 @@
+@@ -1047,7 +1047,7 @@ EXPORT_SYMBOL(nft_set_list_iter_next);
  
  void nft_set_list_iter_destroy(struct nft_set_list_iter *iter)
  {
@@ -442,10 +481,11 @@ diff -Nura libnftnl-1.0.3.orig/src/set.c libnftnl-1.0.3/src/set.c
  }
  EXPORT_SYMBOL(nft_set_list_iter_destroy);
  
-diff -Nura libnftnl-1.0.3.orig/src/set_elem.c libnftnl-1.0.3/src/set_elem.c
---- libnftnl-1.0.3.orig/src/set_elem.c	2014-12-16 08:16:44.084395550 -0300
-+++ libnftnl-1.0.3/src/set_elem.c	2014-12-16 08:17:06.072154290 -0300
-@@ -44,11 +44,11 @@
+diff --git a/src/set_elem.c b/src/set_elem.c
+index 95f12bf..12d636e 100644
+--- a/src/set_elem.c
++++ b/src/set_elem.c
+@@ -44,11 +44,11 @@ void nft_set_elem_free(struct nft_set_elem *s)
  {
  	if (s->flags & (1 << NFT_SET_ELEM_ATTR_CHAIN)) {
  		if (s->data.chain) {
@@ -459,7 +499,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set_elem.c libnftnl-1.0.3/src/set_elem.c
  }
  EXPORT_SYMBOL(nft_set_elem_free);
  
-@@ -64,7 +64,7 @@
+@@ -64,7 +64,7 @@ void nft_set_elem_attr_unset(struct nft_set_elem *s, uint16_t attr)
  	case NFT_SET_ELEM_ATTR_CHAIN:
  		if (s->flags & (1 << NFT_SET_ELEM_ATTR_CHAIN)) {
  			if (s->data.chain) {
@@ -468,7 +508,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set_elem.c libnftnl-1.0.3/src/set_elem.c
  				s->data.chain = NULL;
  			}
  		}
-@@ -98,7 +98,7 @@
+@@ -98,7 +98,7 @@ void nft_set_elem_attr_set(struct nft_set_elem *s, uint16_t attr,
  		break;
  	case NFT_SET_ELEM_ATTR_CHAIN:	/* NFTA_SET_ELEM_DATA */
  		if (s->data.chain)
@@ -477,7 +517,7 @@ diff -Nura libnftnl-1.0.3.orig/src/set_elem.c libnftnl-1.0.3/src/set_elem.c
  
  		s->data.chain = strdup(data);
  		break;
-@@ -716,7 +716,7 @@
+@@ -716,7 +716,7 @@ EXPORT_SYMBOL(nft_set_elems_iter_next);
  
  void nft_set_elems_iter_destroy(struct nft_set_elems_iter *iter)
  {
@@ -486,10 +526,11 @@ diff -Nura libnftnl-1.0.3.orig/src/set_elem.c libnftnl-1.0.3/src/set_elem.c
  }
  EXPORT_SYMBOL(nft_set_elems_iter_destroy);
  
-diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
---- libnftnl-1.0.3.orig/src/table.c	2014-12-16 08:16:44.082395482 -0300
-+++ libnftnl-1.0.3/src/table.c	2014-12-16 08:17:06.001151840 -0300
-@@ -45,9 +45,9 @@
+diff --git a/src/table.c b/src/table.c
+index c93e6fb..c89bca1 100644
+--- a/src/table.c
++++ b/src/table.c
+@@ -45,9 +45,9 @@ EXPORT_SYMBOL(nft_table_alloc);
  void nft_table_free(struct nft_table *t)
  {
  	if (t->flags & (1 << NFT_TABLE_ATTR_NAME))
@@ -501,7 +542,7 @@ diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
  }
  EXPORT_SYMBOL(nft_table_free);
  
-@@ -65,7 +65,7 @@
+@@ -65,7 +65,7 @@ void nft_table_attr_unset(struct nft_table *t, uint16_t attr)
  	switch (attr) {
  	case NFT_TABLE_ATTR_NAME:
  		if (t->name) {
@@ -510,7 +551,7 @@ diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
  			t->name = NULL;
  		}
  		break;
-@@ -95,7 +95,7 @@
+@@ -95,7 +95,7 @@ void nft_table_attr_set_data(struct nft_table *t, uint16_t attr,
  	switch (attr) {
  	case NFT_TABLE_ATTR_NAME:
  		if (t->name)
@@ -519,7 +560,7 @@ diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
  
  		t->name = strdup(data);
  		break;
-@@ -486,7 +486,7 @@
+@@ -486,7 +486,7 @@ void nft_table_list_free(struct nft_table_list *list)
  		list_del(&r->head);
  		nft_table_free(r);
  	}
@@ -528,7 +569,7 @@ diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
  }
  EXPORT_SYMBOL(nft_table_list_free);
  
-@@ -565,6 +565,6 @@
+@@ -565,6 +565,6 @@ EXPORT_SYMBOL(nft_table_list_iter_next);
  
  void nft_table_list_iter_destroy(struct nft_table_list_iter *iter)
  {
@@ -536,10 +577,11 @@ diff -Nura libnftnl-1.0.3.orig/src/table.c libnftnl-1.0.3/src/table.c
 +	nftnl_xfree(iter);
  }
  EXPORT_SYMBOL(nft_table_list_iter_destroy);
-diff -Nura libnftnl-1.0.3.orig/src/utils.c libnftnl-1.0.3/src/utils.c
---- libnftnl-1.0.3.orig/src/utils.c	2014-12-16 08:16:44.083395516 -0300
-+++ libnftnl-1.0.3/src/utils.c	2014-12-16 08:17:06.064154014 -0300
-@@ -206,7 +206,7 @@
+diff --git a/src/utils.c b/src/utils.c
+index 9013b68..7058269 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -206,7 +206,7 @@ int nft_fprintf(FILE *fp, void *obj, uint32_t type, uint32_t flags,
  
  out:
  	if (buf != _buf)
@@ -548,3 +590,6 @@ diff -Nura libnftnl-1.0.3.orig/src/utils.c libnftnl-1.0.3/src/utils.c
  
  	return ret;
  }
+-- 
+2.1.0
+
-- 
2.1.0
