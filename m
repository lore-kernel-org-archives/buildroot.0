From: Dmitry Ivanov <vonami@gmail.com>
Date: Fri, 5 Nov 2010 00:03:39 +0300
Subject: [Buildroot] Default extract commands fail for kerberos
Message-ID: <AANLkTi=0Tkj7L8q7n7YtAzyjHa_QY4MAGWvjKacr8Rn5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, buildroot,

I'm working on a recipe for kerberos and I faced a problem with
extracting the sources. The problem is, if I rely on the default
extraction commands the kerberos sources got eaten by tar.

The downloaded tarball krb5-1.6.3-signed.tar doesn't contain the
source files directly. Instead, there are 2 files inside:
krb5-1.6.3.tar.gz and krb5-1.6.3.tar.gz.asc. Obviously, tar
--strip-components=1 removes those 2 files leaving the build dir
empty.

I guess it would be useful to be able to overwrite the default
extraction commands via LIBFOO_EXTRACT_CMDS.


-- 
Best regards,
Dmitry Ivanov
