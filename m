From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Thu, 20 Aug 2015 00:31:21 +0200
Subject: [Buildroot] package/dhcp/S80dhcp-*: possible bug
Message-ID: <55D503B9.6030005@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The S80dhcp-* scripts use string variables like INTERFACES that are left empty.
Because of that, the corresponding services are not started.

Previously, there were configuration files to initialize these variables, but
they have been removed by the commit 07064c0978b78356bf74408c216f524881df3362.

Is it a bug, or are these scripts supposed to just be templates (requiring a
root FS overlay to fix them) and not the actual scripts?

If it is a bug, what is the preferred way of fixing it? With a configuration
file that would be sourced by these scripts like before, or with Config.in
string options that would fill these scripts, or with something else?

Best regards,
Beno?t
