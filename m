From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:18:56 +0100
Subject: [Buildroot] [PATCH 09/10] python-jsonschema: needs
 python-functools32 when used with python 2.7
In-Reply-To: <20180309191701.23760-10-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-10-peter@korsgaard.com>
Message-ID: <CAGm1_kv__VqQZb6N=RFwZvWzGfMP8vQODQaY1gCaWsfepUhoGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:17 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> From setup.py:
>
> extras_require = {
>     ..
>     ":python_version=='2.7'": ["functools32"],
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-jsonschema/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
> index 7002653722..b547f4ae1a 100644
> --- a/package/python-jsonschema/Config.in
> +++ b/package/python-jsonschema/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_JSONSCHEMA
>         bool "python-jsonschema"
> +       select BR2_PACKAGE_PYTHON_FUNCTOOLS32 if BR2_PACKAGE_PYTHON # runtime
>         help
>           An implementation of JSON Schema validation for Python.
>
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:17 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From setup.py:<br>
<br>
extras_require = {<br>
&nbsp; &nbsp; ..<br>
&nbsp; &nbsp; ":python_version=='2.7'": ["functools32"],<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;package/python-jsonschema/<wbr>Config.in | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/python-jsonschema/<wbr>Config.in
b/package/python-jsonschema/<wbr>Config.in<br>
index 7002653722..b547f4ae1a 100644<br>
--- a/package/python-jsonschema/<wbr>Config.in<br>
+++ b/package/python-jsonschema/<wbr>Config.in<br>
@@ -1,5 +1,6 @@<br>
&nbsp;config BR2_PACKAGE_PYTHON_JSONSCHEMA<br>
&nbsp; &nbsp; &nbsp; &nbsp; bool "python-jsonschema"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_FUNCTOOLS32 if
BR2_PACKAGE_PYTHON # runtime<br>
&nbsp; &nbsp; &nbsp; &nbsp; help<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; An implementation of JSON Schema
validation for Python.<br>
<span class="HOEnZb"><font color="#888888"><br>
--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
