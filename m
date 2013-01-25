From: Patrick <kpa_info@yahoo.fr>
Date: Fri, 25 Jan 2013 10:03:06 +0100
Subject: [Buildroot] menuconfig error with python packages
In-Reply-To: <51024537.2010204@yahoo.fr>
References: <51024537.2010204@yahoo.fr>
Message-ID: <51024A4A.6070909@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/25/2013 09:41 AM, Patrick wrote:
> Dear all,
>
> I have detected what it seems a strange behaviour with python in the
> menuconfig. When activating python3 (BR2_PACKAGE_PYTHON3) the submenu
> "external python modules" is not visible.
> When activating dstat (BR2_PACKAGE_DSTAT) from "Debugging, profiling and
> benchmarking" the "external python modules" submenu become visible.
>
> Is this really the expected behaviour ? I don't think so
>

I think the patch below fix the problem. The "external python modules" 
submenu is now available when activating python3. Fow now only the 
python-bottle package is available I have to check if others python 
packages work also with python 3.

Any comments ?

Patrick

diff --git a/package/Config.in b/package/Config.in
index 10adf5d..1d477f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -309,7 +309,7 @@ source "package/microperl/Config.in"
  source "package/php/Config.in"
  source "package/python/Config.in"
  source "package/python3/Config.in"
-if BR2_PACKAGE_PYTHON
+if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
  menu "external python modules"
  source "package/python-bottle/Config.in"
  source "package/python-dpkt/Config.in"
