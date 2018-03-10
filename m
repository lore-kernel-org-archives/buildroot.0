From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:11:52 +0100
Subject: [Buildroot] [PATCH 03/10] package: add
 python-backports-ssl-match-hostname
In-Reply-To: <20180309191701.23760-4-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-4-peter@korsgaard.com>
Message-ID: <CAGm1_kv5O_DKo5kxnha1nZeXZ5xAEu0xieAM3zi8D5mF-W0nGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> The ssl.match_hostname() function from Python 3.5.
>
> This function IS available in python 2.7 since 2.7.9, but it doesn't support
> matching on IP addresses which is needed for some use cases.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-backports-ssl-match-hostname/Config.in      |  7 +++++++
>  .../python-backports-ssl-match-hostname.hash               |  4 ++++
>  .../python-backports-ssl-match-hostname.mk                 | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-backports-ssl-match-hostname/Config.in
>  create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
>  create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d4bd10fa28..34ecfeeb02 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1384,6 +1384,7 @@ F:        package/lzop/
>  F:     package/memtool/
>  F:     package/mosquitto/
>  F:     package/python-alsaaudio/
> +F:     package/python-backports-ssl-match-hostname/
>  F:     package/python-docker-pycreds/
>  F:     package/python-enum/
>  F:     package/python-enum34/
> diff --git a/package/Config.in b/package/Config.in
> index 9c727cad6c..d3018aee47 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -732,6 +732,7 @@ menu "External python modules"
>         source "package/python-babel/Config.in"
>         source "package/python-backports-abc/Config.in"
>         source "package/python-backports-shutil-get-terminal-size/Config.in"
> +       source "package/python-backports-ssl-match-hostname/Config.in"
>         source "package/python-bcrypt/Config.in"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bitstring/Config.in"
> diff --git a/package/python-backports-ssl-match-hostname/Config.in b/package/python-backports-ssl-match-hostname/Config.in
> new file mode 100644
> index 0000000000..8e55191a9e
> --- /dev/null
> +++ b/package/python-backports-ssl-match-hostname/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
> +       bool "python-backports-ssl-match-hostname"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         The ssl.match_hostname() function from Python 3.5.
> +
> +         http://bitbucket.org/brandon/backports.ssl_match_hostname
> diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
> new file mode 100644
> index 0000000000..b43e1af5a6
> --- /dev/null
> +++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/backports.ssl_match_hostname/json, sha256 locally computed
> +md5    c03fc5e2c7b3da46b81acf5cbacfe1e6  backports.ssl_match_hostname-3.5.0.1.tar.gz
> +sha256 502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2  backports.ssl_match_hostname-3.5.0.1.tar.gz
> +sha256 bfc8a75a4b9aec224aa7973c0c9d7cc0134bdcbf8eefd008936b58554d66e97e  backports/ssl_match_hostname/LICENSE.txt
> diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
> new file mode 100644
> index 0000000000..01c8bc448c
> --- /dev/null
> +++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-backports-ssl-match-hostname
> +#
> +################################################################################
> +
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.5.0.1
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SOURCE = backports.ssl_match_hostname-$(PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION).tar.gz
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://pypi.python.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python-2.0
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = backports/ssl_match_hostname/LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The ssl.match_hostname() function from Python 3.5.<br>
<br>
This function IS available in python 2.7 since 2.7.9, but it doesn't support<br>
matching on IP addresses which is needed for some use cases.<br>
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
&nbsp;package/python-backports-ssl-<wbr>match-hostname/Config.in&nbsp;
&nbsp; &nbsp; |&nbsp; 7 +++++++<br>
&nbsp;.../python-backports-ssl-<wbr>match-hostname.hash&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 ++++<br>
&nbsp;.../<a href="http://python-backports-ssl-match-hostname.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-backports-ssl-match-hostname.mk&amp;source=gmail&amp;ust=1520748594582000&amp;usg=AFQjCNE7-vIA1pQ6vlGosk_sE8foorNDEw"
rel="noreferrer"
target="_blank">python-backports-ssl-<wbr>match-hostname.mk</a>&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 14
++++++++++++++<br>
&nbsp;5 files changed, 27 insertions(+)<br>
&nbsp;create mode 100644
package/python-backports-ssl-<wbr>match-hostname/Config.in<br>
&nbsp;create mode 100644
package/python-backports-ssl-<wbr>match-hostname/python-<wbr>backports-ssl-match-hostname.<wbr>hash<br>
&nbsp;create mode 100644
package/python-backports-ssl-<wbr>match-hostname/<a
href="http://python-backports-ssl-match-hostname.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-backports-ssl-match-hostname.mk&amp;source=gmail&amp;ust=1520748594583000&amp;usg=AFQjCNFIiwhKzJYfI5ub2fj9Tg-M4oTVrQ"
rel="noreferrer"
target="_blank">python-<wbr>backports-ssl-match-hostname.<wbr>mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index d4bd10fa28..34ecfeeb02 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1384,6 +1384,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/lzop/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/memtool/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/mosquitto/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-alsaaudio/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-backports-ssl-<wbr>match-hostname/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker-pycreds/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum34/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 9c727cad6c..d3018aee47 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -732,6 +732,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-babel/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-backports-abc/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-backports-<wbr>shutil-get-terminal-size/<wbr>Config.in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source
"package/python-backports-ssl-<wbr>match-hostname/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-bcrypt/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-<wbr>beautifulsoup4/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-bitstring/<wbr>Config.in"<br>
diff --git a/package/python-backports-<wbr>ssl-match-hostname/Config.in
b/package/python-backports-<wbr>ssl-match-hostname/Config.in<br>
new file mode 100644<br>
index 0000000000..8e55191a9e<br>
--- /dev/null<br>
+++ b/package/python-backports-<wbr>ssl-match-hostname/Config.in<br>
@@ -0,0 +1,7 @@<br>
+config BR2_PACKAGE_PYTHON_BACKPORTS_<wbr>SSL_MATCH_HOSTNAME<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-backports-ssl-match-<wbr>hostname"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_PACKAGE_PYTHON<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The ssl.match_hostname() function
from Python 3.5.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="http://bitbucket.org/brandon/backports.ssl_match_hostname"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://bitbucket.org/brandon/backports.ssl_match_hostname&amp;source=gmail&amp;ust=1520748594583000&amp;usg=AFQjCNHghZhbeIKEeffh0lgSJBkrLIcT-w"
rel="noreferrer"
target="_blank">http://bitbucket.org/brandon/<wbr>backports.ssl_match_hostname</a><br>
diff --git a/package/python-backports-<wbr>ssl-match-hostname/python-<wbr>backports-ssl-match-hostname.<wbr>hash
b/package/python-backports-<wbr>ssl-match-hostname/python-<wbr>backports-ssl-match-hostname.<wbr>hash<br>
new file mode 100644<br>
index 0000000000..b43e1af5a6<br>
--- /dev/null<br>
+++ b/package/python-backports-<wbr>ssl-match-hostname/python-<wbr>backports-ssl-match-hostname.<wbr>hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/backports.ssl_match_hostname/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/backports.ssl_match_hostname/json&amp;source=gmail&amp;ust=1520748594584000&amp;usg=AFQjCNGkKcixgPUjCS4TctS3ON_soGPidw"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>backports.ssl_match_hostname/<wbr>json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; c03fc5e2c7b3da46b81acf5cbacfe1<wbr>e6&nbsp;
backports.ssl_match_hostname-<wbr>3.5.0.1.tar.gz<br>
+sha256 502ad98707319f4a51fa2ca1c677bd<wbr>659008d27ded9f6380c79e8932e38d<wbr>cdf2&nbsp;
backports.ssl_match_hostname-<wbr>3.5.0.1.tar.gz<br>
+sha256 bfc8a75a4b9aec224aa7973c0c9d7c<wbr>c0134bdcbf8eefd008936b58554d66<wbr>e97e&nbsp;
backports/ssl_match_hostname/<wbr>LICENSE.txt<br>
diff --git a/package/python-backports-<wbr>ssl-match-hostname/<a
href="http://python-backports-ssl-match-hostname.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-backports-ssl-match-hostname.mk&amp;source=gmail&amp;ust=1520748594584000&amp;usg=AFQjCNEcmGrCoGzKnuJiCMWK1yBKlhlguQ"
rel="noreferrer"
target="_blank">python-<wbr>backports-ssl-match-hostname.<wbr>mk</a>
b/package/python-backports-<wbr>ssl-match-hostname/<a
href="http://python-backports-ssl-match-hostname.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-backports-ssl-match-hostname.mk&amp;source=gmail&amp;ust=1520748594584000&amp;usg=AFQjCNEcmGrCoGzKnuJiCMWK1yBKlhlguQ"
rel="noreferrer"
target="_blank">python-<wbr>backports-ssl-match-hostname.<wbr>mk</a><br>
new file mode 100644<br>
index 0000000000..01c8bc448c<br>
--- /dev/null<br>
+++ b/package/python-backports-<wbr>ssl-match-hostname/<a
href="http://python-backports-ssl-match-hostname.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-backports-ssl-match-hostname.mk&amp;source=gmail&amp;ust=1520748594585000&amp;usg=AFQjCNE5fuaNO9h6coeUNlEDLjEdOW5Xbw"
rel="noreferrer"
target="_blank">python-<wbr>backports-ssl-match-hostname.<wbr>mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-backports-ssl-match-<wbr>hostname<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_VERSION = 3.5.0.1<br>
+PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_SOURCE =
backports.ssl_match_hostname-$<wbr>(PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_VERSION).tar.gz<br>
+PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_SITE = <a
href="https://pypi.python.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23&amp;source=gmail&amp;ust=1520748594585000&amp;usg=AFQjCNEc3e4Up2jBKL6IFe-l4ZtJE6dIHw"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/76/21/<wbr>2dc61178a2038a5cb35d14b61467c6<wbr>ac632791ed05131dda72c20e7b9e23</a><br>
+PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_SETUP_TYPE = distutils<br>
+PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_LICENSE = Python-2.0<br>
+PYTHON_BACKPORTS_SSL_MATCH_<wbr>HOSTNAME_LICENSE_FILES =
backports/ssl_match_hostname/<wbr>LICENSE.txt<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
