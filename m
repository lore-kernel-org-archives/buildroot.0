From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:19:21 +0100
Subject: [Buildroot] [PATCH 07/10] package: add python-dockerpty
In-Reply-To: <20180309191701.23760-8-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-8-peter@korsgaard.com>
Message-ID: <CAGm1_ktZbqF+0P5Ha5ByOmb0=duUaMnmugAvkMLFLm6F+5Pm7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Library to use the pseudo-tty of a docker container.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-dockerpty/Config.in             |  7 +++++++
>  package/python-dockerpty/python-dockerpty.hash |  4 ++++
>  package/python-dockerpty/python-dockerpty.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-dockerpty/Config.in
>  create mode 100644 package/python-dockerpty/python-dockerpty.hash
>  create mode 100644 package/python-dockerpty/python-dockerpty.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 10dab1d2e4..1119f78ccc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1387,6 +1387,7 @@ F:        package/python-alsaaudio/
>  F:     package/python-backports-ssl-match-hostname/
>  F:     package/python-cached-property/
>  F:     package/python-docker/
> +F:     package/python-dockerpty/
>  F:     package/python-docker-pycreds/
>  F:     package/python-enum/
>  F:     package/python-enum34/
> diff --git a/package/Config.in b/package/Config.in
> index 6068ef573e..b7e0da6dd4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -768,6 +768,7 @@ menu "External python modules"
>         source "package/python-dicttoxml/Config.in"
>         source "package/python-django/Config.in"
>         source "package/python-docker/Config.in"
> +       source "package/python-dockerpty/Config.in"
>         source "package/python-docker-pycreds/Config.in"
>         source "package/python-docopt/Config.in"
>         source "package/python-docutils/Config.in"
> diff --git a/package/python-dockerpty/Config.in b/package/python-dockerpty/Config.in
> new file mode 100644
> index 0000000000..f0bd85a68f
> --- /dev/null
> +++ b/package/python-dockerpty/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_DOCKERPTY
> +       bool "python-dockerpty"
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       help
> +         Python library to use the pseudo-tty of a docker container.
> +
> +         https://github.com/d11wtq/dockerpty
> diff --git a/package/python-dockerpty/python-dockerpty.hash b/package/python-dockerpty/python-dockerpty.hash
> new file mode 100644
> index 0000000000..f5ed252bcf
> --- /dev/null
> +++ b/package/python-dockerpty/python-dockerpty.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/dockerpty/json, sha256 locally computed
> +md5    028bacb34536f3ee6a2ccd668c27e8e4  dockerpty-0.4.1.tar.gz
> +sha256 69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce  dockerpty-0.4.1.tar.gz
> +sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
> new file mode 100644
> index 0000000000..e6fe6e3b49
> --- /dev/null
> +++ b/package/python-dockerpty/python-dockerpty.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-dockerpty
> +#
> +################################################################################
> +
> +PYTHON_DOCKERPTY_VERSION = 0.4.1
> +PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
> +PYTHON_DOCKERPTY_SITE = https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
> +PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
> +PYTHON_DOCKERPTY_LICENSE = Apache-2.0
> +PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Library to use the pseudo-tty of a docker container.<br>
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
&nbsp;package/python-dockerpty/<wbr>Config.in&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 7 +++++++<br>
&nbsp;package/python-dockerpty/<wbr>python-dockerpty.hash |&nbsp; 4 ++++<br>
&nbsp;package/python-dockerpty/<a href="http://python-dockerpty.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-dockerpty.mk&amp;source=gmail&amp;ust=1520749073159000&amp;usg=AFQjCNEd0PxMSzGsKD9GawaMb1iZdD3jDg"
rel="noreferrer" target="_blank">pytho<wbr>n-dockerpty.mk</a>&nbsp;
&nbsp;| 14 ++++++++++++++<br>
&nbsp;5 files changed, 27 insertions(+)<br>
&nbsp;create mode 100644 package/python-dockerpty/<wbr>Config.in<br>
&nbsp;create mode 100644 package/python-dockerpty/<wbr>python-dockerpty.hash<br>
&nbsp;create mode 100644 package/python-dockerpty/<a
href="http://python-dockerpty.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-dockerpty.mk&amp;source=gmail&amp;ust=1520749073160000&amp;usg=AFQjCNEhLwgn9uJn7InpprTBF_q7b50Osw"
rel="noreferrer" target="_blank">pytho<wbr>n-dockerpty.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 10dab1d2e4..1119f78ccc 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1387,6 +1387,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp;
package/python-alsaaudio/<br>
&nbsp;F:&nbsp; &nbsp;
&nbsp;package/python-backports-ssl-<wbr>match-hostname/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-cached-<wbr>property/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-dockerpty/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker-pycreds/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum34/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 6068ef573e..b7e0da6dd4 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -768,6 +768,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-dicttoxml/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-django/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docker/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source "package/python-dockerpty/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-docker-<wbr>pycreds/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docopt/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docutils/<wbr>Config.in"<br>
diff --git a/package/python-dockerpty/<wbr>Config.in
b/package/python-dockerpty/<wbr>Config.in<br>
new file mode 100644<br>
index 0000000000..f0bd85a68f<br>
--- /dev/null<br>
+++ b/package/python-dockerpty/<wbr>Config.in<br>
@@ -0,0 +1,7 @@<br>
+config BR2_PACKAGE_PYTHON_DOCKERPTY<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-dockerpty"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SIX # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Python library to use the
pseudo-tty of a docker container.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/d11wtq/dockerpty"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/d11wtq/dockerpty&amp;source=gmail&amp;ust=1520749073160000&amp;usg=AFQjCNFwaNXeBHu6B-7_VSKpqWYT9Gfqfg"
rel="noreferrer"
target="_blank">https://github.com/d11wtq/<wbr>dockerpty</a><br>
diff --git a/package/python-dockerpty/<wbr>python-dockerpty.hash
b/package/python-dockerpty/<wbr>python-dockerpty.hash<br>
new file mode 100644<br>
index 0000000000..f5ed252bcf<br>
--- /dev/null<br>
+++ b/package/python-dockerpty/<wbr>python-dockerpty.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/dockerpty/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/dockerpty/json&amp;source=gmail&amp;ust=1520749073161000&amp;usg=AFQjCNERJvtZtOHCf3Jsn1OrJIHh9u2TIg"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>dockerpty/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; 028bacb34536f3ee6a2ccd668c27e8<wbr>e4&nbsp;
dockerpty-0.4.1.tar.gz<br>
+sha256 69a9d69d573a0daa31bcd1c0774eee<wbr>d5c15c295fe719c61aca550ed13931<wbr>56ce&nbsp;
dockerpty-0.4.1.tar.gz<br>
+sha256 cfc7749b96f63bd31c3c42b5c471bf<wbr>756814053e847c10f3eb003417bc52<wbr>3d30&nbsp;
LICENSE.txt<br>
diff --git a/package/python-dockerpty/<a
href="http://python-dockerpty.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-dockerpty.mk&amp;source=gmail&amp;ust=1520749073161000&amp;usg=AFQjCNEF_XRr3cIZT2rbq7zXmuqpbk7wzg"
rel="noreferrer" target="_blank">pyt<wbr>hon-dockerpty.mk</a>
b/package/python-dockerpty/<a href="http://python-dockerpty.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-dockerpty.mk&amp;source=gmail&amp;ust=1520749073161000&amp;usg=AFQjCNEF_XRr3cIZT2rbq7zXmuqpbk7wzg"
rel="noreferrer" target="_blank">pyt<wbr>hon-dockerpty.mk</a><br>
new file mode 100644<br>
index 0000000000..e6fe6e3b49<br>
--- /dev/null<br>
+++ b/package/python-dockerpty/<a href="http://python-dockerpty.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-dockerpty.mk&amp;source=gmail&amp;ust=1520749073161000&amp;usg=AFQjCNEF_XRr3cIZT2rbq7zXmuqpbk7wzg"
rel="noreferrer" target="_blank">pyt<wbr>hon-dockerpty.mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-dockerpty<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_DOCKERPTY_VERSION = 0.4.1<br>
+PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_<wbr>VERSION).tar.gz<br>
+PYTHON_DOCKERPTY_SITE = <a
href="https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba&amp;source=gmail&amp;ust=1520749073162000&amp;usg=AFQjCNEg37RMkmUvsXPlvgyEfAZU418LMQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/8d/ee/<wbr>e9ecce4c32204a6738e0a5d5883d34<wbr>13794d7498fe8b06f44becc028d3ba</a><br>
+PYTHON_DOCKERPTY_SETUP_TYPE = setuptools<br>
+PYTHON_DOCKERPTY_LICENSE = Apache-2.0<br>
+PYTHON_DOCKERPTY_LICENSE_<wbr>FILES = LICENSE.txt<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
