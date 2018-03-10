From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:10:38 +0100
Subject: [Buildroot] [PATCH 01/10] package: add python-docker-pycreds
In-Reply-To: <20180309191701.23760-2-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-2-peter@korsgaard.com>
Message-ID: <CAGm1_ku-emOhEb0ro0JL8MvE-=68DUnajOutrSphYRNQbEZSQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Python bindings for the docker credentials store API.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                               |  1 +
>  package/Config.in                                        |  1 +
>  package/python-docker-pycreds/Config.in                  |  7 +++++++
>  package/python-docker-pycreds/python-docker-pycreds.hash |  4 ++++
>  package/python-docker-pycreds/python-docker-pycreds.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-docker-pycreds/Config.in
>  create mode 100644 package/python-docker-pycreds/python-docker-pycreds.hash
>  create mode 100644 package/python-docker-pycreds/python-docker-pycreds.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index dba0e58757..2cd2ac85ae 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1384,6 +1384,7 @@ F:        package/lzop/
>  F:     package/memtool/
>  F:     package/mosquitto/
>  F:     package/python-alsaaudio/
> +F:     package/python-docker-pycreds/
>  F:     package/python-enum/
>  F:     package/python-enum34/
>  F:     package/python-ipaddr/
> diff --git a/package/Config.in b/package/Config.in
> index f455e74735..a5604fc36b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -765,6 +765,7 @@ menu "External python modules"
>         source "package/python-dialog3/Config.in"
>         source "package/python-dicttoxml/Config.in"
>         source "package/python-django/Config.in"
> +       source "package/python-docker-pycreds/Config.in"
>         source "package/python-docopt/Config.in"
>         source "package/python-docutils/Config.in"
>         source "package/python-dominate/Config.in"
> diff --git a/package/python-docker-pycreds/Config.in b/package/python-docker-pycreds/Config.in
> new file mode 100644
> index 0000000000..584c1dbc0e
> --- /dev/null
> +++ b/package/python-docker-pycreds/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_DOCKER_PYCREDS
> +       bool "python-docker-pycreds"
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       help
> +         Python bindings for the docker credentials store API.
> +
> +         https://github.com/shin-/dockerpy-creds
> diff --git a/package/python-docker-pycreds/python-docker-pycreds.hash b/package/python-docker-pycreds/python-docker-pycreds.hash
> new file mode 100644
> index 0000000000..9e1182d4a4
> --- /dev/null
> +++ b/package/python-docker-pycreds/python-docker-pycreds.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/docker-pycreds/json, sha256 locally computed
> +md5    ae63c7def3e58cb51a4d8f5810683030  docker-pycreds-0.2.2.tar.gz
> +sha256 c7ab85de2894baff6ee8f15160cbbfa2fd3a04e56f0372c5793d24060687b299  docker-pycreds-0.2.2.tar.gz
> +sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-docker-pycreds/python-docker-pycreds.mk b/package/python-docker-pycreds/python-docker-pycreds.mk
> new file mode 100644
> index 0000000000..e7ffd0eb51
> --- /dev/null
> +++ b/package/python-docker-pycreds/python-docker-pycreds.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-docker-pycreds
> +#
> +################################################################################
> +
> +PYTHON_DOCKER_PYCREDS_VERSION = 0.2.2
> +PYTHON_DOCKER_PYCREDS_SOURCE = docker-pycreds-$(PYTHON_DOCKER_PYCREDS_VERSION).tar.gz
> +PYTHON_DOCKER_PYCREDS_SITE = https://pypi.python.org/packages/db/73/42d4c698e70633d99f7f7c4c87c6de45ead5ad7b36dcfccd998fd1556ac9
> +PYTHON_DOCKER_PYCREDS_SETUP_TYPE = setuptools
> +PYTHON_DOCKER_PYCREDS_LICENSE = Apache-2.0
> +PYTHON_DOCKER_PYCREDS_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Python bindings for the docker credentials store API.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
&nbsp;package/python-docker-pycreds/<wbr>Config.in&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 7 +++++++<br>
&nbsp;package/python-docker-pycreds/<wbr>python-docker-pycreds.hash
|&nbsp; 4 ++++<br>
&nbsp;package/python-docker-pycreds/<a
href="http://python-docker-pycreds.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker-pycreds.mk&amp;source=gmail&amp;ust=1520748594887000&amp;usg=AFQjCNGOLCjqKneoosvqMdzpWTGgH4Sy1A"
rel="noreferrer"
target="_blank"><wbr>python-docker-pycreds.mk</a>&nbsp; &nbsp;| 14
++++++++++++++<br>
&nbsp;5 files changed, 27 insertions(+)<br>
&nbsp;create mode 100644 package/python-docker-pycreds/<wbr>Config.in<br>
&nbsp;create mode 100644
package/python-docker-pycreds/<wbr>python-docker-pycreds.hash<br>
&nbsp;create mode 100644 package/python-docker-pycreds/<a
href="http://python-docker-pycreds.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker-pycreds.mk&amp;source=gmail&amp;ust=1520748594887000&amp;usg=AFQjCNGOLCjqKneoosvqMdzpWTGgH4Sy1A"
rel="noreferrer" target="_blank"><wbr>python-docker-pycreds.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index dba0e58757..2cd2ac85ae 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1384,6 +1384,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/lzop/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/memtool/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/mosquitto/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-alsaaudio/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-docker-pycreds/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum34/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-ipaddr/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index f455e74735..a5604fc36b 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -765,6 +765,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-dialog3/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-dicttoxml/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-django/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-docker-<wbr>pycreds/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docopt/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docutils/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-dominate/<wbr>Config.in"<br>
diff --git a/package/python-docker-<wbr>pycreds/Config.in
b/package/python-docker-<wbr>pycreds/Config.in<br>
new file mode 100644<br>
index 0000000000..584c1dbc0e<br>
--- /dev/null<br>
+++ b/package/python-docker-<wbr>pycreds/Config.in<br>
@@ -0,0 +1,7 @@<br>
+config BR2_PACKAGE_PYTHON_DOCKER_<wbr>PYCREDS<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-docker-pycreds"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SIX # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Python bindings for the docker
credentials store API.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/shin-/dockerpy-creds"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/shin-/dockerpy-creds&amp;source=gmail&amp;ust=1520748594888000&amp;usg=AFQjCNGS280ROddnZ9BTVsnPPUuuBXtaMw"
rel="noreferrer"
target="_blank">https://github.com/shin-/<wbr>dockerpy-creds</a><br>
diff --git a/package/python-docker-<wbr>pycreds/python-docker-pycreds.<wbr>hash
b/package/python-docker-<wbr>pycreds/python-docker-pycreds.<wbr>hash<br>
new file mode 100644<br>
index 0000000000..9e1182d4a4<br>
--- /dev/null<br>
+++ b/package/python-docker-<wbr>pycreds/python-docker-pycreds.<wbr>hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/docker-pycreds/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/docker-pycreds/json&amp;source=gmail&amp;ust=1520748594889000&amp;usg=AFQjCNHI-Yq1R4Lu8N3B2YQ3SjTZIBEDWw"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>docker-pycreds/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; ae63c7def3e58cb51a4d8f58106830<wbr>30&nbsp;
docker-pycreds-0.2.2.tar.gz<br>
+sha256 c7ab85de2894baff6ee8f15160cbbf<wbr>a2fd3a04e56f0372c5793d24060687<wbr>b299&nbsp;
docker-pycreds-0.2.2.tar.gz<br>
+sha256 cfc7749b96f63bd31c3c42b5c471bf<wbr>756814053e847c10f3eb003417bc52<wbr>3d30&nbsp;
LICENSE<br>
diff --git a/package/python-docker-<wbr>pycreds/<a
href="http://python-docker-pycreds.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker-pycreds.mk&amp;source=gmail&amp;ust=1520748594889000&amp;usg=AFQjCNEvUn4yE8HBGGueAu-Jq3LebZvbHg"
rel="noreferrer" target="_blank">python-docker-pycreds.<wbr>mk</a>
b/package/python-docker-<wbr>pycreds/<a
href="http://python-docker-pycreds.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker-pycreds.mk&amp;source=gmail&amp;ust=1520748594889000&amp;usg=AFQjCNEvUn4yE8HBGGueAu-Jq3LebZvbHg"
rel="noreferrer" target="_blank">python-docker-pycreds.<wbr>mk</a><br>
new file mode 100644<br>
index 0000000000..e7ffd0eb51<br>
--- /dev/null<br>
+++ b/package/python-docker-<wbr>pycreds/<a
href="http://python-docker-pycreds.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker-pycreds.mk&amp;source=gmail&amp;ust=1520748594889000&amp;usg=AFQjCNEvUn4yE8HBGGueAu-Jq3LebZvbHg"
rel="noreferrer" target="_blank">python-docker-pycreds.<wbr>mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-docker-pycreds<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_DOCKER_PYCREDS_VERSION = 0.2.2<br>
+PYTHON_DOCKER_PYCREDS_SOURCE =
docker-pycreds-$(PYTHON_<wbr>DOCKER_PYCREDS_VERSION).tar.gz<br>
+PYTHON_DOCKER_PYCREDS_SITE = <a
href="https://pypi.python.org/packages/db/73/42d4c698e70633d99f7f7c4c87c6de45ead5ad7b36dcfccd998fd1556ac9"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/db/73/42d4c698e70633d99f7f7c4c87c6de45ead5ad7b36dcfccd998fd1556ac9&amp;source=gmail&amp;ust=1520748594890000&amp;usg=AFQjCNF40FGz2zQ3RJ4IFrLIFozHJ0RXXQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/db/73/<wbr>42d4c698e70633d99f7f7c4c87c6de<wbr>45ead5ad7b36dcfccd998fd1556ac9</a><br>
+PYTHON_DOCKER_PYCREDS_SETUP_<wbr>TYPE = setuptools<br>
+PYTHON_DOCKER_PYCREDS_LICENSE = Apache-2.0<br>
+PYTHON_DOCKER_PYCREDS_<wbr>LICENSE_FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
