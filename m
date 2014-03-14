From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2014 00:20:45 +0100
Subject: [Buildroot] [PATCH v2] pyrex: new host package
In-Reply-To: <1394837899-14937-2-git-send-email-rc.lsw.collaborate@gmail.com>
References: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
 <1394837899-14937-2-git-send-email-rc.lsw.collaborate@gmail.com>
Message-ID: <20140314232045.GE16649@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2014-03-14 17:58 -0500, rc.lsw.collaborate at gmail.com spake thusly:
> From: Matt Weber <mlweber1@rockwellcollins.com>

Could you add in the commit log what Pyrex is and why it would be needed
as a host-only package?

I can read the description in the help text, but that does not say why
it is interesting to have Pyrex as a host-tool in Buildroot.

Also, you're not adding any in-tree user of host-pyrex (maybe you have
one or two such packages ready to be submitted? ;-) ), which does not
help to understand why it is needed.

(Note: even if you provide such ackages, please expand this commit log
anyway.)

> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>    - Converted to a host only pkg as this pkg provides generated
>      C code that an application would use from a sysroot
>      (not on target).  (Suggested by Thomas)
> ---
>  package/Config.in                    |    1 +
>  package/python-pyrex/Config.in.host  |    7 +++++++
>  package/python-pyrex/python-pyrex.mk |   15 +++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/python-pyrex/Config.in.host
>  create mode 100644 package/python-pyrex/python-pyrex.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 70e5a7f..cec0fea 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -454,6 +454,7 @@ source "package/python-pyasn/Config.in"
>  source "package/python-pycrypto/Config.in"
>  source "package/python-pygame/Config.in"
>  source "package/python-pyparsing/Config.in"
> +source "package/python-pyrex/Config.in.host"

As I said in my reply to your cover-letter: we want to have all
host-only packages in the "Host utilities" sub-menu.

_But_ if this package is going to be used by other in-tree packages,
there is no real need to add an entry in the "Host utilities" menu.

We only add entries in that menu if a host tool may also be used outside
of the Buildroot infrastructure. For example, the file system generators
might be used by post-imnage scripts, so we expose them.

But for purely internal host tools, we usually do not expose an entry
for them.

>  source "package/python-pyro/Config.in"
>  source "package/python-pysnmp/Config.in"
>  source "package/python-pysnmp-apps/Config.in"
> diff --git a/package/python-pyrex/Config.in.host b/package/python-pyrex/Config.in.host
> new file mode 100644
> index 0000000..ff83daf
> --- /dev/null
> +++ b/package/python-pyrex/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_PYTHON_PYREX
> +	bool "python-pyrex (host tool)"

When you move this package to the "Host utilities" menu, change the
prompt to simply:
    "host pyrex"

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
