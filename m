From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Aug 2010 10:15:37 -0300
Subject: [Buildroot] [PATCH] [SECURITY] Bump php to 5.2.14
Message-ID: <4C63F3F9.2060804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


PHP 5.2.14 fixes various security vulnerabilities:

* Rewrote var_export() to use smart_str rather than output buffering,
prevents data disclosure if a fatal error occurs.
* Fixed a possible interruption array leak in strrchr().(CVE-2010-2484)
* Fixed a possible interruption array leak in strchr(), strstr(),
substr(), chunk_split(), strtok(), addcslashes(), str_repeat(), trim().
* Fixed a possible memory corruption in substr_replace().
* Fixed SplObjectStorage unserialization problems (CVE-2010-2225).
* Fixed a possible stack exaustion inside fnmatch().
* Fixed a NULL pointer dereference when processing invalid XML-RPC
requests (Fixes CVE-2010-0397, bug #51288).
* Fixed handling of session variable serialization on certain prefix
characters.
* Fixed a possible arbitrary memory access inside sqlite extension.
Reported by Mateusz Kocielski.


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-php-5.2.14.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100812/acd71360/attachment.ksh>
