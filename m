From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:18:16 +0100
Subject: [Buildroot] [PATCH 06/10] package: add python-texttable
In-Reply-To: <20180309191701.23760-7-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-7-peter@korsgaard.com>
Message-ID: <CAGm1_kvUmP0L3rhZJQ1dTJ=QWX+5MBVg-S78GuVWUc9y_xV1gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Module for creating simple ASCII tables.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-texttable/Config.in             |  6 ++++++
>  package/python-texttable/python-texttable.hash |  4 ++++
>  package/python-texttable/python-texttable.mk   | 14 ++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/python-texttable/Config.in
>  create mode 100644 package/python-texttable/python-texttable.hash
>  create mode 100644 package/python-texttable/python-texttable.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ced3af7169..10dab1d2e4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1393,6 +1393,7 @@ F:        package/python-enum34/
>  F:     package/python-ipaddr/
>  F:     package/python-pam/
>  F:     package/python-psutil/
> +F:     package/python-texttable/
>  F:     package/python-websocket-client/
>  F:     package/triggerhappy/
>
> diff --git a/package/Config.in b/package/Config.in
> index 1043338a7e..6068ef573e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -932,6 +932,7 @@ menu "External python modules"
>         source "package/python-systemd/Config.in"
>         source "package/python-tabledata/Config.in"
>         source "package/python-tempora/Config.in"
> +       source "package/python-texttable/Config.in"
>         source "package/python-typepy/Config.in"
>         source "package/python-thrift/Config.in"
>         source "package/python-tomako/Config.in"
> diff --git a/package/python-texttable/Config.in b/package/python-texttable/Config.in
> new file mode 100644
> index 0000000000..1c8dde8d3f
> --- /dev/null
> +++ b/package/python-texttable/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_TEXTTABLE
> +       bool "python-texttable"
> +       help
> +         module for creating simple ASCII tables.
> +
> +         https://github.com/foutaise/texttable/
> diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
> new file mode 100644
> index 0000000000..448d6b7dd1
> --- /dev/null
> +++ b/package/python-texttable/python-texttable.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/texttable/json, sha256 locally computed
> +md5    a712b5a5464d51c5fc43c64d9d2cd0de  texttable-0.9.1.tar.gz
> +sha256 119041773ff03596b56392532f9315cb3a3116e404fd6f36e76a7dc088d95c79  texttable-0.9.1.tar.gz
> +sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
> diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
> new file mode 100644
> index 0000000000..96fe6cf882
> --- /dev/null
> +++ b/package/python-texttable/python-texttable.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-texttable
> +#
> +################################################################################
> +
> +PYTHON_TEXTTABLE_VERSION = 0.9.1
> +PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
> +PYTHON_TEXTTABLE_SITE = https://pypi.python.org/packages/02/e1/2565e6b842de7945af0555167d33acfc8a615584ef7abd30d1eae00a4d80
> +PYTHON_TEXTTABLE_SETUP_TYPE = distutils
> +PYTHON_TEXTTABLE_LICENSE = LGPL-3.0+
> +PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Module for creating simple ASCII tables.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp;
1 +<br>
&nbsp;package/python-texttable/<wbr>Config.in&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 6 ++++++<br>
&nbsp;package/python-texttable/<wbr>python-texttable.hash |&nbsp; 4 ++++<br>
&nbsp;package/python-texttable/<a href="http://python-texttable.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-texttable.mk&amp;source=gmail&amp;ust=1520748594544000&amp;usg=AFQjCNFUTIfgxNrFalNVHWJtcMZbQnTvUA"
rel="noreferrer" target="_blank">pytho<wbr>n-texttable.mk</a>&nbsp;
&nbsp;| 14 ++++++++++++++<br>
&nbsp;5 files changed, 26 insertions(+)<br>
&nbsp;create mode 100644 package/python-texttable/<wbr>Config.in<br>
&nbsp;create mode 100644 package/python-texttable/<wbr>python-texttable.hash<br>
&nbsp;create mode 100644 package/python-texttable/<a
href="http://python-texttable.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-texttable.mk&amp;source=gmail&amp;ust=1520748594544000&amp;usg=AFQjCNFUTIfgxNrFalNVHWJtcMZbQnTvUA"
rel="noreferrer" target="_blank">pytho<wbr>n-texttable.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index ced3af7169..10dab1d2e4 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1393,6 +1393,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/python-enum34/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-ipaddr/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-pam/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-psutil/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-texttable/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-websocket-<wbr>client/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/triggerhappy/<br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 1043338a7e..6068ef573e 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -932,6 +932,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-systemd/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-tabledata/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-tempora/<wbr>Config.in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source "package/python-texttable/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-typepy/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-thrift/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-tomako/Config.<wbr>in"<br>
diff --git a/package/python-texttable/<wbr>Config.in
b/package/python-texttable/<wbr>Config.in<br>
new file mode 100644<br>
index 0000000000..1c8dde8d3f<br>
--- /dev/null<br>
+++ b/package/python-texttable/<wbr>Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_PYTHON_TEXTTABLE<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-texttable"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;module for creating simple ASCII tables.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/foutaise/texttable/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/foutaise/texttable/&amp;source=gmail&amp;ust=1520748594545000&amp;usg=AFQjCNFNH6X92MW5fNwZEaI86CJX6Dp66g"
rel="noreferrer"
target="_blank">https://github.com/foutaise/<wbr>texttable/</a><br>
diff --git a/package/python-texttable/<wbr>python-texttable.hash
b/package/python-texttable/<wbr>python-texttable.hash<br>
new file mode 100644<br>
index 0000000000..448d6b7dd1<br>
--- /dev/null<br>
+++ b/package/python-texttable/<wbr>python-texttable.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/texttable/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/texttable/json&amp;source=gmail&amp;ust=1520748594545000&amp;usg=AFQjCNGdIxvDq7osQzpe4f4ttpEu_uCABA"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>texttable/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; a712b5a5464d51c5fc43c64d9d2cd0<wbr>de&nbsp;
texttable-0.9.1.tar.gz<br>
+sha256 119041773ff03596b56392532f9315<wbr>cb3a3116e404fd6f36e76a7dc088d9<wbr>5c79&nbsp;
texttable-0.9.1.tar.gz<br>
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bd<wbr>c1eece45ac569dc21b3b037520b446<wbr>4768&nbsp;
LICENSE<br>
diff --git a/package/python-texttable/<a
href="http://python-texttable.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-texttable.mk&amp;source=gmail&amp;ust=1520748594545000&amp;usg=AFQjCNEqNcj3eudYbLwZCRO5Gy426oYu0g"
rel="noreferrer" target="_blank">pyt<wbr>hon-texttable.mk</a>
b/package/python-texttable/<a href="http://python-texttable.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-texttable.mk&amp;source=gmail&amp;ust=1520748594546000&amp;usg=AFQjCNHCMWXe_tKrCDfYZHcsHIDo9gBAXA"
rel="noreferrer" target="_blank">pyt<wbr>hon-texttable.mk</a><br>
new file mode 100644<br>
index 0000000000..96fe6cf882<br>
--- /dev/null<br>
+++ b/package/python-texttable/<a href="http://python-texttable.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-texttable.mk&amp;source=gmail&amp;ust=1520748594546000&amp;usg=AFQjCNHCMWXe_tKrCDfYZHcsHIDo9gBAXA"
rel="noreferrer" target="_blank">pyt<wbr>hon-texttable.mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-texttable<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_TEXTTABLE_VERSION = 0.9.1<br>
+PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_<wbr>VERSION).tar.gz<br>
+PYTHON_TEXTTABLE_SITE = <a
href="https://pypi.python.org/packages/02/e1/2565e6b842de7945af0555167d33acfc8a615584ef7abd30d1eae00a4d80"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/02/e1/2565e6b842de7945af0555167d33acfc8a615584ef7abd30d1eae00a4d80&amp;source=gmail&amp;ust=1520748594547000&amp;usg=AFQjCNEPr8ajQPAffCn90_UnpgYsPjNSFA"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/02/e1/<wbr>2565e6b842de7945af0555167d33ac<wbr>fc8a615584ef7abd30d1eae00a4d80</a><br>
+PYTHON_TEXTTABLE_SETUP_TYPE = distutils<br>
+PYTHON_TEXTTABLE_LICENSE = LGPL-3.0+<br>
+PYTHON_TEXTTABLE_LICENSE_<wbr>FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
