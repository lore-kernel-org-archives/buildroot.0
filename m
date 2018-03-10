From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:15:37 +0100
Subject: [Buildroot] [PATCH 08/10] package: add python-functools32
In-Reply-To: <20180309191701.23760-9-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-9-peter@korsgaard.com>
Message-ID: <CAGm1_ktiAo5Ugbp=ZzTsJr9AeLY+_X6HxmaHbYUg74+u+CeC=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-functools32/Config.in               |  8 ++++++++
>  package/python-functools32/python-functools32.hash |  4 ++++
>  package/python-functools32/python-functools32.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-functools32/Config.in
>  create mode 100644 package/python-functools32/python-functools32.hash
>  create mode 100644 package/python-functools32/python-functools32.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1119f78ccc..e6dc51e1fe 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1391,6 +1391,7 @@ F:        package/python-dockerpty/
>  F:     package/python-docker-pycreds/
>  F:     package/python-enum/
>  F:     package/python-enum34/
> +F:     package/python-functools32/
>  F:     package/python-ipaddr/
>  F:     package/python-pam/
>  F:     package/python-psutil/
> diff --git a/package/Config.in b/package/Config.in
> index b7e0da6dd4..6fd61a0dea 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -785,6 +785,7 @@ menu "External python modules"
>         source "package/python-flask-login/Config.in"
>         source "package/python-flask-sqlalchemy/Config.in"
>         source "package/python-flup/Config.in"
> +       source "package/python-functools32/Config.in"
>         source "package/python-futures/Config.in"
>         source "package/python-gobject/Config.in"
>         source "package/python-gunicorn/Config.in"
> diff --git a/package/python-functools32/Config.in b/package/python-functools32/Config.in
> new file mode 100644
> index 0000000000..cc12557edc
> --- /dev/null
> +++ b/package/python-functools32/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_FUNCTOOLS32
> +       bool "python-functools32"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         Backport of the functools module from Python 3.2.3 for use on 2.7
> +         and PyPy.
> +
> +         https://github.com/MiCHiLU/python-functools32
> diff --git a/package/python-functools32/python-functools32.hash b/package/python-functools32/python-functools32.hash
> new file mode 100644
> index 0000000000..606de81774
> --- /dev/null
> +++ b/package/python-functools32/python-functools32.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/functools32/json, sha256 locally computed
> +md5    09f24ffd9af9f6cd0f63cb9f4e23d4b2  functools32-3.2.3-2.tar.gz
> +sha256 f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d  functools32-3.2.3-2.tar.gz
> +sha256 3f9ea6b89abe1556b72aff67b987d64c8272564815cd6a2832e6c4f6abdfe3b1  LICENSE
> diff --git a/package/python-functools32/python-functools32.mk b/package/python-functools32/python-functools32.mk
> new file mode 100644
> index 0000000000..8a88bb2a7f
> --- /dev/null
> +++ b/package/python-functools32/python-functools32.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-functools32
> +#
> +################################################################################
> +
> +PYTHON_FUNCTOOLS32_VERSION = 3.2.3-2
> +PYTHON_FUNCTOOLS32_SOURCE = functools32-$(PYTHON_FUNCTOOLS32_VERSION).tar.gz
> +PYTHON_FUNCTOOLS32_SITE = https://pypi.python.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db
> +PYTHON_FUNCTOOLS32_SETUP_TYPE = distutils
> +PYTHON_FUNCTOOLS32_LICENSE = Python-2.0
> +PYTHON_FUNCTOOLS32_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |&nbsp; 1 +<br>
&nbsp;package/python-functools32/<wbr>Config.in&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 8 ++++++++<br>
&nbsp;package/python-functools32/<wbr>python-functools32.hash |&nbsp; 4 ++++<br>
&nbsp;package/python-functools32/<a
href="http://python-functools32.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-functools32.mk&amp;source=gmail&amp;ust=1520748594552000&amp;usg=AFQjCNFld3LSz4CWNt5GyCcyJ3G5fLt6Nw"
rel="noreferrer" target="_blank">pyt<wbr>hon-functools32.mk</a>&nbsp;
&nbsp;| 14 ++++++++++++++<br>
&nbsp;5 files changed, 28 insertions(+)<br>
&nbsp;create mode 100644 package/python-functools32/<wbr>Config.in<br>
&nbsp;create mode 100644
package/python-functools32/<wbr>python-functools32.hash<br>
&nbsp;create mode 100644 package/python-functools32/<a
href="http://python-functools32.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-functools32.mk&amp;source=gmail&amp;ust=1520748594553000&amp;usg=AFQjCNGtFUGYdbuF5_IDtO4WOhSfrHcMRQ"
rel="noreferrer" target="_blank">pyt<wbr>hon-functools32.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 1119f78ccc..e6dc51e1fe 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1391,6 +1391,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp;
package/python-dockerpty/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker-pycreds/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum34/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-functools32/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-ipaddr/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-pam/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-psutil/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index b7e0da6dd4..6fd61a0dea 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -785,6 +785,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-flask-login/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-flask-<wbr>sqlalchemy/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-flup/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-functools32/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-futures/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-gobject/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-gunicorn/<wbr>Config.in"<br>
diff --git a/package/python-functools32/<wbr>Config.in
b/package/python-functools32/<wbr>Config.in<br>
new file mode 100644<br>
index 0000000000..cc12557edc<br>
--- /dev/null<br>
+++ b/package/python-functools32/<wbr>Config.in<br>
@@ -0,0 +1,8 @@<br>
+config BR2_PACKAGE_PYTHON_FUNCTOOLS32<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-functools32"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_PACKAGE_PYTHON<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Backport of the functools module
from Python 3.2.3 for use on 2.7<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;and PyPy.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/MiCHiLU/python-functools32"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/MiCHiLU/python-functools32&amp;source=gmail&amp;ust=1520748594553000&amp;usg=AFQjCNHiyqvjtchUmw9OAAhGlisNG2M_7g"
rel="noreferrer"
target="_blank">https://github.com/MiCHiLU/<wbr>python-functools32</a><br>
diff --git a/package/python-functools32/<wbr>python-functools32.hash
b/package/python-functools32/<wbr>python-functools32.hash<br>
new file mode 100644<br>
index 0000000000..606de81774<br>
--- /dev/null<br>
+++ b/package/python-functools32/<wbr>python-functools32.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/functools32/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/functools32/json&amp;source=gmail&amp;ust=1520748594554000&amp;usg=AFQjCNEPwWEYi9z56qfGGHMw2vtbbZ6lMA"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>functools32/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; 09f24ffd9af9f6cd0f63cb9f4e23d4<wbr>b2&nbsp;
functools32-3.2.3-2.tar.gz<br>
+sha256 f6253dfbe0538ad2e387bd8fdfd929<wbr>3c925d63553f5813c4e58774541650<wbr>1e6d&nbsp;
functools32-3.2.3-2.tar.gz<br>
+sha256 3f9ea6b89abe1556b72aff67b987d6<wbr>4c8272564815cd6a2832e6c4f6abdf<wbr>e3b1&nbsp;
LICENSE<br>
diff --git a/package/python-functools32/<a
href="http://python-functools32.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-functools32.mk&amp;source=gmail&amp;ust=1520748594554000&amp;usg=AFQjCNFs3bmkswOrgnMDiJDszVhuN_A5OQ"
rel="noreferrer" target="_blank">p<wbr>ython-functools32.mk</a>
b/package/python-functools32/<a href="http://python-functools32.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-functools32.mk&amp;source=gmail&amp;ust=1520748594554000&amp;usg=AFQjCNFs3bmkswOrgnMDiJDszVhuN_A5OQ"
rel="noreferrer" target="_blank">p<wbr>ython-functools32.mk</a><br>
new file mode 100644<br>
index 0000000000..8a88bb2a7f<br>
--- /dev/null<br>
+++ b/package/python-functools32/<a
href="http://python-functools32.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-functools32.mk&amp;source=gmail&amp;ust=1520748594554000&amp;usg=AFQjCNFs3bmkswOrgnMDiJDszVhuN_A5OQ"
rel="noreferrer" target="_blank">p<wbr>ython-functools32.mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-functools32<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_FUNCTOOLS32_VERSION = 3.2.3-2<br>
+PYTHON_FUNCTOOLS32_SOURCE =
functools32-$(PYTHON_<wbr>FUNCTOOLS32_VERSION).tar.gz<br>
+PYTHON_FUNCTOOLS32_SITE = <a
href="https://pypi.python.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db
+PYTHON_FUNCTOOLS32_SETUP_TYPE"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db%0A%2BPYTHON_FUNCTOOLS32_SETUP_TYPE&amp;source=gmail&amp;ust=1520748594555000&amp;usg=AFQjCNFdlxn6rJ3Za0IdxXL3KLV2r-Ipbg"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/c5/60/<wbr>6ac26ad05857c601308d8fb9e87fa3<wbr>6d0ebf889423f47c3502ef034365db<br>
+PYTHON_FUNCTOOLS32_SETUP_TYPE</a> = distutils<br>
+PYTHON_FUNCTOOLS32_LICENSE = Python-2.0<br>
+PYTHON_FUNCTOOLS32_LICENSE_<wbr>FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
