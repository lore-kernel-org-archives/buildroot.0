From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 22:41:38 +0100
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.18
In-Reply-To: <1447356646-19912-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 12 Nov 2015 16:30:46 -0300")
References: <1447356646-19912-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877flmopyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes a potential heap corruption on Windows when
 > mbedtls_x509_crt_parse_path() is passed a path longer than 2GB. This
 > cannot be triggered remotely. Found by Guido Vranken, Intelworks.

 > Fixes a potential buffer overflow in some asn1_write_xxx() functions.
 > This cannot be triggered remotely unless you create X.509 certificates
 > based on untrusted input or write keys of untrusted origin. Found by
 > Guido Vranken, Intelworks.

 > The X509 max_pathlen constraint was not enforced on intermediate
 > certificates. Found by Nicholas Wilson, and fix and tests provided by
 > Janos Follath.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
