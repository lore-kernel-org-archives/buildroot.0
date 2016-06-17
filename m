From: Ben Boeckel <mathstuf@gmail.com>
Date: Fri, 17 Jun 2016 02:11:29 +0000 (UTC)
Subject: [Buildroot] Analysis of build results for 2016-05-16
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com> <njvjaj$gnv$1@ger.gmane.org>
Message-ID: <njvm8h$op2$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jun, 2016 at 01:21:23 GMT, Ben Boeckel wrote:
> Since everything is static, taskd needs to link to gnutls' transitive
> dependencies, but CMake's FindGnuTLS module only finds the library
> itself, so the final executable ends up with missing symbols.

Fixed it with a hacky patch. Proper fixes will need to wait for a
revamped FindGnuTLS module (earliest would be CMake 3.7.0; features
required will be in CMake 3.6.0).

--Ben
