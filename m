From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:11:04 +0100
Subject: [Buildroot] [PATCH 02/10] package: add python-websocket-client
In-Reply-To: <20180309191701.23760-3-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-3-peter@korsgaard.com>
Message-ID: <CAGm1_ks92BUE3e9Jqi1Q+XmfSvefvT3j-6TCxpCNmi+MiF6O8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> WebSocket client module for python.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-websocket-client/Config.in                  |  9 +++++++++
>  .../python-websocket-client/python-websocket-client.hash   |  4 ++++
>  package/python-websocket-client/python-websocket-client.mk | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-websocket-client/Config.in
>  create mode 100644 package/python-websocket-client/python-websocket-client.hash
>  create mode 100644 package/python-websocket-client/python-websocket-client.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2cd2ac85ae..d4bd10fa28 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1390,6 +1390,7 @@ F:        package/python-enum34/
>  F:     package/python-ipaddr/
>  F:     package/python-pam/
>  F:     package/python-psutil/
> +F:     package/python-websocket-client/
>  F:     package/triggerhappy/
>
>  N:     Peter Seiderer <ps.report@gmx.net>
> diff --git a/package/Config.in b/package/Config.in
> index a5604fc36b..9c727cad6c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -949,6 +949,7 @@ menu "External python modules"
>         source "package/python-wcwidth/Config.in"
>         source "package/python-web2py/Config.in"
>         source "package/python-webpy/Config.in"
> +       source "package/python-websocket-client/Config.in"
>         source "package/python-websockets/Config.in"
>         source "package/python-werkzeug/Config.in"
>         source "package/python-whoosh/Config.in"
> diff --git a/package/python-websocket-client/Config.in b/package/python-websocket-client/Config.in
> new file mode 100644
> index 0000000000..0fbb15b328
> --- /dev/null
> +++ b/package/python-websocket-client/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
> +       bool "python-websocket-client"
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
> +       help
> +         WebSocket client for python. hybi13 is supported.
> +
> +         https://github.com/websocket-client/websocket-client.git
> diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
> new file mode 100644
> index 0000000000..3672ca074b
> --- /dev/null
> +++ b/package/python-websocket-client/python-websocket-client.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/websocket-client/json, sha256 locally computed
> +md5    790b3ecb5364293ad70c59a1b92debb1  websocket_client-0.47.0.tar.gz
> +sha256 a453dc4dfa6e0db3d8fd7738a308a88effe6240c59f3226eb93e8f020c216149  websocket_client-0.47.0.tar.gz
> +sha256 e580b2a1a57c33085dd6a07cff693d828f7c3fa8a11ce56ade2a62c46951930d  LICENSE
> diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
> new file mode 100644
> index 0000000000..58c8407db3
> --- /dev/null
> +++ b/package/python-websocket-client/python-websocket-client.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-websocket-client
> +#
> +################################################################################
> +
> +PYTHON_WEBSOCKET_CLIENT_VERSION = 0.47.0
> +PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
> +PYTHON_WEBSOCKET_CLIENT_SITE = https://pypi.python.org/packages/c9/bb/8d3dd9063cfe0cd5d03fe6a1f74ddd948f384e9c1eff0eb978f3976a7d27
> +PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
> +PYTHON_WEBSOCKET_CLIENT_LICENSE = LGPL-2.1+
> +PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">WebSocket client module for python.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
&nbsp;package/python-websocket-<wbr>client/Config.in&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 9
+++++++++<br>
&nbsp;.../python-websocket-client/<wbr>python-websocket-client.hash&nbsp;
&nbsp;|&nbsp; 4 ++++<br>
&nbsp;package/python-websocket-<wbr>client/<a
href="http://python-websocket-client.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-websocket-client.mk&amp;source=gmail&amp;ust=1520748594591000&amp;usg=AFQjCNFE2RmTLhTG92zQFBnG9s6mPJVR_Q"
rel="noreferrer" target="_blank">python-websocket-<wbr>client.mk</a> |
14 ++++++++++++++<br>
&nbsp;5 files changed, 29 insertions(+)<br>
&nbsp;create mode 100644 package/python-websocket-<wbr>client/Config.in<br>
&nbsp;create mode 100644
package/python-websocket-<wbr>client/python-websocket-<wbr>client.hash<br>
&nbsp;create mode 100644 package/python-websocket-<wbr>client/<a
href="http://python-websocket-client.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-websocket-client.mk&amp;source=gmail&amp;ust=1520748594592000&amp;usg=AFQjCNHbVX2gNKe_0ErXy9wQLr6ixlldQA"
rel="noreferrer"
target="_blank">python-websocket-<wbr>client.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 2cd2ac85ae..d4bd10fa28 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1390,6 +1390,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/python-enum34/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-ipaddr/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-pam/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-psutil/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-websocket-<wbr>client/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/triggerhappy/<br>
<br>
&nbsp;N:&nbsp; &nbsp; &nbsp;Peter Seiderer &lt;<a
href="mailto:ps.report@gmx.net">ps.report at gmx.net</a>&gt;<br>
diff --git a/package/Config.in b/package/Config.in<br>
index a5604fc36b..9c727cad6c 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -949,6 +949,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-wcwidth/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-web2py/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-webpy/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-websocket-<wbr>client/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-websockets/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-werkzeug/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-whoosh/Config.<wbr>in"<br>
diff --git a/package/python-websocket-<wbr>client/Config.in
b/package/python-websocket-<wbr>client/Config.in<br>
new file mode 100644<br>
index 0000000000..0fbb15b328<br>
--- /dev/null<br>
+++ b/package/python-websocket-<wbr>client/Config.in<br>
@@ -0,0 +1,9 @@<br>
+config BR2_PACKAGE_PYTHON_WEBSOCKET_<wbr>CLIENT<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-websocket-client"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SIX # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SSL if
BR2_PACKAGE_PYTHON # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON3_SSL if
BR2_PACKAGE_PYTHON3 # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WebSocket client for python. hybi13
is supported.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/websocket-client/websocket-client.git"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/websocket-client/websocket-client.git&amp;source=gmail&amp;ust=1520748594592000&amp;usg=AFQjCNEsAJJs7AbXINBcnNOwMhZVv3S_Yg"
rel="noreferrer"
target="_blank">https://github.com/websocket-<wbr>client/websocket-client.git</a><br>
diff --git a/package/python-websocket-<wbr>client/python-websocket-<wbr>client.hash
b/package/python-websocket-<wbr>client/python-websocket-<wbr>client.hash<br>
new file mode 100644<br>
index 0000000000..3672ca074b<br>
--- /dev/null<br>
+++ b/package/python-websocket-<wbr>client/python-websocket-<wbr>client.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/websocket-client/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/websocket-client/json&amp;source=gmail&amp;ust=1520748594593000&amp;usg=AFQjCNHKmM4X_2FOhiAzg5NmJ7xmn0xuhg"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>websocket-client/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; 790b3ecb5364293ad70c59a1b92deb<wbr>b1&nbsp;
websocket_client-0.47.0.tar.gz<br>
+sha256 a453dc4dfa6e0db3d8fd7738a308a8<wbr>8effe6240c59f3226eb93e8f020c21<wbr>6149&nbsp;
websocket_client-0.47.0.tar.gz<br>
+sha256 e580b2a1a57c33085dd6a07cff693d<wbr>828f7c3fa8a11ce56ade2a62c46951<wbr>930d&nbsp;
LICENSE<br>
diff --git a/package/python-websocket-<wbr>client/<a
href="http://python-websocket-client.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-websocket-client.mk&amp;source=gmail&amp;ust=1520748594593000&amp;usg=AFQjCNF12ZQ2DV74_tqsnK-hwBaraRXVnA"
rel="noreferrer" target="_blank">python-websocket-<wbr>client.mk</a>
b/package/python-websocket-<wbr>client/<a
href="http://python-websocket-client.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-websocket-client.mk&amp;source=gmail&amp;ust=1520748594593000&amp;usg=AFQjCNF12ZQ2DV74_tqsnK-hwBaraRXVnA"
rel="noreferrer"
target="_blank">python-websocket-<wbr>client.mk</a><br>
new file mode 100644<br>
index 0000000000..58c8407db3<br>
--- /dev/null<br>
+++ b/package/python-websocket-<wbr>client/<a
href="http://python-websocket-client.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-websocket-client.mk&amp;source=gmail&amp;ust=1520748594593000&amp;usg=AFQjCNF12ZQ2DV74_tqsnK-hwBaraRXVnA"
rel="noreferrer"
target="_blank">python-websocket-<wbr>client.mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-websocket-client<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_WEBSOCKET_CLIENT_<wbr>VERSION = 0.47.0<br>
+PYTHON_WEBSOCKET_CLIENT_<wbr>SOURCE =
websocket_client-$(PYTHON_<wbr>WEBSOCKET_CLIENT_VERSION).tar.<wbr>gz<br>
+PYTHON_WEBSOCKET_CLIENT_SITE = <a
href="https://pypi.python.org/packages/c9/bb/8d3dd9063cfe0cd5d03fe6a1f74ddd948f384e9c1eff0eb978f3976a7d27"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/c9/bb/8d3dd9063cfe0cd5d03fe6a1f74ddd948f384e9c1eff0eb978f3976a7d27&amp;source=gmail&amp;ust=1520748594594000&amp;usg=AFQjCNEArCvUFjy9BpEThAaAHZcO5u1IJA"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/c9/bb/<wbr>8d3dd9063cfe0cd5d03fe6a1f74ddd<wbr>948f384e9c1eff0eb978f3976a7d27</a><br>
+PYTHON_WEBSOCKET_CLIENT_<wbr>SETUP_TYPE = setuptools<br>
+PYTHON_WEBSOCKET_CLIENT_<wbr>LICENSE = LGPL-2.1+<br>
+PYTHON_WEBSOCKET_CLIENT_<wbr>LICENSE_FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
