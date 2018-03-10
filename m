From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:14:13 +0100
Subject: [Buildroot] [PATCH 05/10] package: add python-cached-property
In-Reply-To: <20180309191701.23760-6-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-6-peter@korsgaard.com>
Message-ID: <CAGm1_kuj5R9szHq880vNKQ3GswnnDJf5Crz_WppHoe8AjsGYSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> A decorator for caching properties in classes.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-cached-property/Config.in                   |  6 ++++++
>  package/python-cached-property/python-cached-property.hash |  4 ++++
>  package/python-cached-property/python-cached-property.mk   | 14 ++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/python-cached-property/Config.in
>  create mode 100644 package/python-cached-property/python-cached-property.hash
>  create mode 100644 package/python-cached-property/python-cached-property.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9b68652b5f..ced3af7169 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1385,6 +1385,7 @@ F:        package/memtool/
>  F:     package/mosquitto/
>  F:     package/python-alsaaudio/
>  F:     package/python-backports-ssl-match-hostname/
> +F:     package/python-cached-property/
>  F:     package/python-docker/
>  F:     package/python-docker-pycreds/
>  F:     package/python-enum/
> diff --git a/package/Config.in b/package/Config.in
> index c1bf7067aa..1043338a7e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -737,6 +737,7 @@ menu "External python modules"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bitstring/Config.in"
>         source "package/python-bottle/Config.in"
> +       source "package/python-cached-property/Config.in"
>         source "package/python-can/Config.in"
>         source "package/python-cbor/Config.in"
>         source "package/python-certifi/Config.in"
> diff --git a/package/python-cached-property/Config.in b/package/python-cached-property/Config.in
> new file mode 100644
> index 0000000000..8343973342
> --- /dev/null
> +++ b/package/python-cached-property/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_CACHED_PROPERTY
> +       bool "python-cached-property"
> +       help
> +         A decorator for caching properties in classes.
> +
> +         https://github.com/pydanny/cached-property
> diff --git a/package/python-cached-property/python-cached-property.hash b/package/python-cached-property/python-cached-property.hash
> new file mode 100644
> index 0000000000..255b2d9ec6
> --- /dev/null
> +++ b/package/python-cached-property/python-cached-property.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/cached-property/json, sha256 locally computed
> +md5    fc7a49d2c4b7987f92b00c7b49128530  cached-property-1.4.0.tar.gz
> +sha256 a2fa0f89dd422f7e5dd992a4a3e0ce209d5d1e47a4db28fd0a7b5273ec8da3f0  cached-property-1.4.0.tar.gz
> +sha256 ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
> diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
> new file mode 100644
> index 0000000000..ccc2037f4f
> --- /dev/null
> +++ b/package/python-cached-property/python-cached-property.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-cached-property
> +#
> +################################################################################
> +
> +PYTHON_CACHED_PROPERTY_VERSION = 1.4.0
> +PYTHON_CACHED_PROPERTY_SOURCE = cached-property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
> +PYTHON_CACHED_PROPERTY_SITE = https://pypi.python.org/packages/ce/87/72b7a5a0504ad8d5d5ea6804ac5b24ce4f07869f61c47ea00cd4382320ba
> +PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
> +PYTHON_CACHED_PROPERTY_LICENSE = BSD

What kind of BSD?

> +PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
>
<div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9,
2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a
href="mailto:peter@korsgaard.com"
target="_blank">peter at korsgaard.com</a>&gt;</span>
wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0
.8ex;border-left:1px #ccc solid;padding-left:1ex">A decorator for
caching properties in classes.<br>
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
&nbsp;package/python-cached-<wbr>property/Config.in&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 6
++++++<br>
&nbsp;package/python-cached-<wbr>property/python-cached-<wbr>property.hash
|&nbsp; 4 ++++<br>
&nbsp;package/python-cached-<wbr>property/<a
href="http://python-cached-property.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-cached-property.mk&amp;source=gmail&amp;ust=1520748594561000&amp;usg=AFQjCNFUnjqD43Wota5qc15axVB019jQIQ"
rel="noreferrer"
target="_blank">python-cached-<wbr>property.mk</a>&nbsp; &nbsp;| 14
++++++++++++++<br>
&nbsp;5 files changed, 26 insertions(+)<br>
&nbsp;create mode 100644 package/python-cached-<wbr>property/Config.in<br>
&nbsp;create mode 100644
package/python-cached-<wbr>property/python-cached-<wbr>property.hash<br>
&nbsp;create mode 100644 package/python-cached-<wbr>property/<a
href="http://python-cached-property.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-cached-property.mk&amp;source=gmail&amp;ust=1520748594562000&amp;usg=AFQjCNFq3boM4BllkK_aJ0Z1U2Jp-uXnew"
rel="noreferrer"
target="_blank">python-cached-<wbr>property.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 9b68652b5f..ced3af7169 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1385,6 +1385,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/memtool/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/mosquitto/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-alsaaudio/<br>
&nbsp;F:&nbsp; &nbsp;
&nbsp;package/python-backports-ssl-<wbr>match-hostname/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-cached-<wbr>property/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker-pycreds/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index c1bf7067aa..1043338a7e 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -737,6 +737,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-<wbr>beautifulsoup4/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-bitstring/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-bottle/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-cached-<wbr>property/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-can/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-cbor/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-certifi/<wbr>Config.in"<br>
diff --git a/package/python-cached-<wbr>property/Config.in
b/package/python-cached-<wbr>property/Config.in<br>
new file mode 100644<br>
index 0000000000..8343973342<br>
--- /dev/null<br>
+++ b/package/python-cached-<wbr>property/Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_PYTHON_CACHED_<wbr>PROPERTY<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-cached-property"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;A decorator for caching properties
in classes.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/pydanny/cached-property"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/pydanny/cached-property&amp;source=gmail&amp;ust=1520748594563000&amp;usg=AFQjCNHZZymryELcerBsh88yXatwssKYSg"
rel="noreferrer"
target="_blank">https://github.com/pydanny/<wbr>cached-property</a><br>
diff --git a/package/python-cached-<wbr>property/python-cached-<wbr>property.hash
b/package/python-cached-<wbr>property/python-cached-<wbr>property.hash<br>
new file mode 100644<br>
index 0000000000..255b2d9ec6<br>
--- /dev/null<br>
+++ b/package/python-cached-<wbr>property/python-cached-<wbr>property.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/cached-property/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/cached-property/json&amp;source=gmail&amp;ust=1520748594563000&amp;usg=AFQjCNEL6tl7wTszUlSrkUjSi7z9wOV-AA"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>cached-property/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; fc7a49d2c4b7987f92b00c7b491285<wbr>30&nbsp;
cached-property-1.4.0.tar.gz<br>
+sha256 a2fa0f89dd422f7e5dd992a4a3e0ce<wbr>209d5d1e47a4db28fd0a7b5273ec8d<wbr>a3f0&nbsp;
cached-property-1.4.0.tar.gz<br>
+sha256 ba4756c8039b25b66e3c456cc5bf63<wbr>5aa528cf459b97ee1499d06684ccd8<wbr>9b9a&nbsp;
LICENSE<br>
diff --git a/package/python-cached-<wbr>property/<a
href="http://python-cached-property.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-cached-property.mk&amp;source=gmail&amp;ust=1520748594563000&amp;usg=AFQjCNHXpuuanKGzUvCiN0nARtxkvvoxiQ"
rel="noreferrer" target="_blank">python-cached-<wbr>property.mk</a>
b/package/python-cached-<wbr>property/<a
href="http://python-cached-property.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-cached-property.mk&amp;source=gmail&amp;ust=1520748594563000&amp;usg=AFQjCNHXpuuanKGzUvCiN0nARtxkvvoxiQ"
rel="noreferrer"
target="_blank">python-cached-<wbr>property.mk</a><br>
new file mode 100644<br>
index 0000000000..ccc2037f4f<br>
--- /dev/null<br>
+++ b/package/python-cached-<wbr>property/<a
href="http://python-cached-property.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-cached-property.mk&amp;source=gmail&amp;ust=1520748594564000&amp;usg=AFQjCNGTz_JtpLigylaxuz8XNrNODCFCrA"
rel="noreferrer"
target="_blank">python-cached-<wbr>property.mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-cached-property<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_CACHED_PROPERTY_<wbr>VERSION = 1.4.0<br>
+PYTHON_CACHED_PROPERTY_SOURCE =
cached-property-$(PYTHON_<wbr>CACHED_PROPERTY_VERSION).tar.<wbr>gz<br>
+PYTHON_CACHED_PROPERTY_SITE = <a
href="https://pypi.python.org/packages/ce/87/72b7a5a0504ad8d5d5ea6804ac5b24ce4f07869f61c47ea00cd4382320ba"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/ce/87/72b7a5a0504ad8d5d5ea6804ac5b24ce4f07869f61c47ea00cd4382320ba&amp;source=gmail&amp;ust=1520748594564000&amp;usg=AFQjCNFIxlLn9PjxwIPVOgHoN_TTBD6yww"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/ce/87/<wbr>72b7a5a0504ad8d5d5ea6804ac5b24<wbr>ce4f07869f61c47ea00cd4382320ba</a><br>
+PYTHON_CACHED_PROPERTY_SETUP_<wbr>TYPE = setuptools<br>
+PYTHON_CACHED_PROPERTY_<wbr>LICENSE = BSD<br>
+PYTHON_CACHED_PROPERTY_<wbr>LICENSE_FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
